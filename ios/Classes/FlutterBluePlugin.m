#import "FlutterBluePlugin.h"
#import "Flutterblue.pbobjc.h"

@interface FlutterBluePlugin ()
@property(nonatomic, retain) NSObject<FlutterPluginRegistrar> *registrar;
@property(nonatomic, retain) FlutterMethodChannel *channel;
@property(nonatomic, retain) FlutterBlueStreamHandler *stateStreamHandler;
@property(nonatomic, retain) FlutterBlueStreamHandler *scanResultStreamHandler;
@property(nonatomic, retain) CBCentralManager *centralManager;

@end

@implementation FlutterBluePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:NAMESPACE @"/methods"
                                     binaryMessenger:[registrar messenger]];
    FlutterEventChannel* stateChannel = [FlutterEventChannel eventChannelWithName:NAMESPACE @"/state" binaryMessenger:[registrar messenger]];
    FlutterEventChannel* scanResultChannel = [FlutterEventChannel eventChannelWithName:NAMESPACE @"/scanResult" binaryMessenger:[registrar messenger]];
    FlutterEventChannel* servicesDiscoveredChannel = [FlutterEventChannel eventChannelWithName:NAMESPACE @"/servicesDiscovered" binaryMessenger:[registrar messenger]];
    FlutterEventChannel* characteristicReadChannel = [FlutterEventChannel eventChannelWithName:NAMESPACE @"/characteristicRead" binaryMessenger:[registrar messenger]];
    FlutterEventChannel* descriptorReadChannel = [FlutterEventChannel eventChannelWithName:NAMESPACE @"/descriptorRead" binaryMessenger:[registrar messenger]];
    FlutterEventChannel* characteristicNotifiedChannel = [FlutterEventChannel eventChannelWithName:NAMESPACE @"/characteristicNotified" binaryMessenger:[registrar messenger]];
    FlutterBluePlugin* instance = [[FlutterBluePlugin alloc] init];
    instance.channel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];
    instance.centralManager = [[CBCentralManager alloc] initWithDelegate:instance queue:nil];
    
    // STATE
    FlutterBlueStreamHandler* stateStreamHandler = [[FlutterBlueStreamHandler alloc] init];
    [stateChannel setStreamHandler:stateStreamHandler];
    instance.stateStreamHandler = stateStreamHandler;
    
    // SCAN RESULTS
    FlutterBlueStreamHandler* scanResultStreamHandler = [[FlutterBlueStreamHandler alloc] init];
    [scanResultChannel setStreamHandler:scanResultStreamHandler];
    instance.scanResultStreamHandler = scanResultStreamHandler;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"state" isEqualToString:call.method]) {
        FlutterStandardTypedData *data = [self toFlutterData:[self fromStateToProto:self->_centralManager.state]];
        result(data);
    } else if([@"isAvailable" isEqualToString:call.method]) {
        if(self.centralManager.state != CBManagerStateUnsupported && self.centralManager.state != CBManagerStateUnknown) {
            result(@(YES));
        } else {
            result(@(NO));
        }
    } else if([@"isOn" isEqualToString:call.method]) {
        if(self.centralManager.state == CBManagerStatePoweredOn) {
            result(@(YES));
        } else {
            result(@(NO));
        }
    } else if([@"startScan" isEqualToString:call.method]) {
        // TODO: Request Permission?
        FlutterStandardTypedData *data = [call arguments];
        ProtosScanSettings *request = [[ProtosScanSettings alloc] initWithData:[data data] error:nil];
        // TODO: Implement UUID Service filter and iOS Scan Options (#34 #35)
        [self->_centralManager scanForPeripheralsWithServices:nil options:nil];
        result(nil);
    } else if([@"stopScan" isEqualToString:call.method]) {
        [self->_centralManager stopScan];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)centralManagerDidUpdateState:(nonnull CBCentralManager *)central {
    if(_stateStreamHandler.sink != nil) {
        FlutterStandardTypedData *data = [self toFlutterData:[self fromStateToProto:self->_centralManager.state]];
        self.stateStreamHandler.sink(data);
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    if(_scanResultStreamHandler.sink != nil) {
        FlutterStandardTypedData *data = [self toFlutterData:[self toScanResultProto:peripheral advertisementData:advertisementData RSSI:RSSI]];
        _scanResultStreamHandler.sink(data);
    }
}

- (FlutterStandardTypedData*)toFlutterData:(GPBMessage*)proto {
    FlutterStandardTypedData *data = [FlutterStandardTypedData typedDataWithBytes:[[proto data] copy]];
    return data;
}

- (ProtosBluetoothState*)fromStateToProto:(CBManagerState)state {
    ProtosBluetoothState *proto = [[ProtosBluetoothState alloc] init];
    [proto setState:[self fromStateToProtoState:state]];
    return proto;
}

- (ProtosBluetoothState_State)fromStateToProtoState:(CBManagerState)state {
    switch(state)
    {
        case CBManagerStateResetting: return ProtosBluetoothState_State_TurningOn;
        case CBManagerStateUnsupported: return ProtosBluetoothState_State_Unavailable;
        case CBManagerStateUnauthorized: return ProtosBluetoothState_State_Unauthorized;
        case CBManagerStatePoweredOff: return ProtosBluetoothState_State_Off;
        case CBManagerStatePoweredOn: return ProtosBluetoothState_State_On;
        default: return ProtosBluetoothState_State_Unknown;
    }
}

- (ProtosScanResult*)toScanResultProto:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    ProtosScanResult *result = [[ProtosScanResult alloc] init];
    [result setDevice:[self toDeviceProto:peripheral]];
    [result setRssi:[RSSI intValue]];
    ProtosAdvertisementData *ads = [[ProtosAdvertisementData alloc] init];
    [ads setLocalName:advertisementData[CBAdvertisementDataLocalNameKey]];
    [ads setManufacturerData:advertisementData[CBAdvertisementDataManufacturerDataKey]];
    NSDictionary *serviceData = advertisementData[CBAdvertisementDataServiceDataKey];
    for (CBUUID *uuid in serviceData) {
        [[ads serviceData] setObject:serviceData[uuid] forKey:uuid.UUIDString];
    }
    [ads setTxPowerLevel:[advertisementData[CBAdvertisementDataTxPowerLevelKey] intValue]];
    [ads setConnectable:[advertisementData[CBAdvertisementDataIsConnectable] boolValue]];
    [result setAdvertisementData:ads];
    return result;
}

- (ProtosBluetoothDevice*)toDeviceProto:(CBPeripheral *)peripheral {
    ProtosBluetoothDevice *result = [[ProtosBluetoothDevice alloc] init];
    [result setName:[peripheral name]];
    [result setRemoteId:[[peripheral identifier] UUIDString]];
    [result setType:ProtosBluetoothDevice_Type_Le]; // TODO: Does iOS differentiate?
    return result;
}

@end

@implementation FlutterBlueStreamHandler

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    self.sink = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    self.sink = nil;
    return nil;
}

@end

