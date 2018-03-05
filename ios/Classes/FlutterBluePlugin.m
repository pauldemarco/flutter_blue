#import "FlutterBluePlugin.h"
#import "Flutterblue.pbobjc.h"

@interface FlutterBluePlugin ()
@property(nonatomic, retain) NSObject<FlutterPluginRegistrar> *registrar;
@property(nonatomic, retain) FlutterMethodChannel *channel;
@property(nonatomic, retain) FlutterBlueStreamHandler *stateStreamHandler;
@property(nonatomic, retain) FlutterBlueStreamHandler *scanResultStreamHandler;
@property(nonatomic, retain) CBCentralManager *centralManager;
@property(nonatomic) NSMutableDictionary *scannedPeripherals;
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
    instance.centralManager = [[CBCentralManager alloc] initWithDelegate:instance queue:nil];
    instance.scannedPeripherals = [NSMutableDictionary new];
    
    // STATE
    FlutterBlueStreamHandler* stateStreamHandler = [[FlutterBlueStreamHandler alloc] init];
    [stateChannel setStreamHandler:stateStreamHandler];
    instance.stateStreamHandler = stateStreamHandler;
    
    // SCAN RESULTS
    FlutterBlueStreamHandler* scanResultStreamHandler = [[FlutterBlueStreamHandler alloc] init];
    [scanResultChannel setStreamHandler:scanResultStreamHandler];
    instance.scanResultStreamHandler = scanResultStreamHandler;
    
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"state" isEqualToString:call.method]) {
        FlutterStandardTypedData *data = [self toFlutterData:[self toBluetoothStateProto:self->_centralManager.state]];
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
        // Clear any existing scan results
        [self.scannedPeripherals removeAllObjects];
        // TODO: Request Permission?
        FlutterStandardTypedData *data = [call arguments];
        ProtosScanSettings *request = [[ProtosScanSettings alloc] initWithData:[data data] error:nil];
        // TODO: Implement UUID Service filter and iOS Scan Options (#34 #35)
        [self->_centralManager scanForPeripheralsWithServices:nil options:nil];
        result(nil);
    } else if([@"stopScan" isEqualToString:call.method]) {
        [self->_centralManager stopScan];
        result(nil);
    } else if([@"connect" isEqualToString:call.method]) {
        FlutterStandardTypedData *data = [call arguments];
        ProtosConnectRequest *request = [[ProtosConnectRequest alloc] initWithData:[data data] error:nil];
        NSString *remoteId = [request remoteId];
        CBPeripheral *peripheral = [self.scannedPeripherals objectForKey:remoteId];
        if(peripheral == nil) {
            result([FlutterError errorWithCode:@"connect"
                                       message:@"Peripheral not found in scannedPeripherals"
                                       details:nil]);
            return;
        }
        // TODO: Implement Connect options (#36)
        [_centralManager connectPeripheral:peripheral options:nil];
        result(nil);
    } else if([@"disconnect" isEqualToString:call.method]) {
        NSString *remoteId = [call arguments];
        // x1800 is a common service all devices should implement (#37)
        NSArray<CBPeripheral*> *peripherals = [_centralManager retrieveConnectedPeripheralsWithServices:@[[CBUUID UUIDWithString:@"1800"]]];
        CBPeripheral *peripheral;
        for(CBPeripheral *p in peripherals) {
            if([[p.identifier UUIDString] isEqualToString:remoteId]) {
                peripheral = p;
                break;
            }
        }
        if(peripheral != nil) {
            [_centralManager cancelPeripheralConnection:peripheral];
        }
        result(nil);
    } else if([@"deviceState" isEqualToString:call.method]) {
        NSString *remoteId = [call arguments];
        CBPeripheral *peripheral = [self findPeripheral:remoteId];
        if(peripheral != nil) {
            result([self toFlutterData:[self toDeviceStateProto:peripheral state:peripheral.state]]);
        } else {
            result([FlutterError errorWithCode:@"deviceState"
                                       message:@"Peripheral not found in retrievePeripheralsWithIdentifiers"
                                       details:nil]);
        }
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (CBPeripheral*)findPeripheral:(NSString*)remoteId {
    NSArray<CBPeripheral*> *peripherals = [_centralManager retrievePeripheralsWithIdentifiers:@[[[NSUUID alloc] initWithUUIDString:remoteId]]];
    for(CBPeripheral *p in peripherals) {
        if([[p.identifier UUIDString] isEqualToString:remoteId]) {
            return p;
        }
    }
}

//
// CBCentralManagerDelegate methods
//
- (void)centralManagerDidUpdateState:(nonnull CBCentralManager *)central {
    if(_stateStreamHandler.sink != nil) {
        FlutterStandardTypedData *data = [self toFlutterData:[self toBluetoothStateProto:self->_centralManager.state]];
        self.stateStreamHandler.sink(data);
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    [self.scannedPeripherals setObject:peripheral
                              forKey:[[peripheral identifier] UUIDString]];
    if(_scanResultStreamHandler.sink != nil) {
        FlutterStandardTypedData *data = [self toFlutterData:[self toScanResultProto:peripheral advertisementData:advertisementData RSSI:RSSI]];
        _scanResultStreamHandler.sink(data);
    }
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    // Register self as delegate for peripheral
    [peripheral setDelegate:self];
    
    // Send connection state
    [_channel invokeMethod:@"DeviceState" arguments:[self toFlutterData:[self toDeviceStateProto:peripheral state:peripheral.state]]];
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    // Unregister self as delegate for peripheral
    [peripheral setDelegate:nil];
    
    // Send connection state
    [_channel invokeMethod:@"DeviceState" arguments:[self toFlutterData:[self toDeviceStateProto:peripheral state:peripheral.state]]];
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}

//
// CBPeripheralDelegate methods
//
// TODO: Implement all methods

//
// Proto Helper methods
//
- (FlutterStandardTypedData*)toFlutterData:(GPBMessage*)proto {
    FlutterStandardTypedData *data = [FlutterStandardTypedData typedDataWithBytes:[[proto data] copy]];
    return data;
}

- (ProtosBluetoothState*)toBluetoothStateProto:(CBManagerState)state {
    ProtosBluetoothState *result = [[ProtosBluetoothState alloc] init];
    switch(state) {
        case CBManagerStateResetting:
            [result setState:ProtosBluetoothState_State_TurningOn];
            break;
        case CBManagerStateUnsupported:
            [result setState:ProtosBluetoothState_State_Unavailable];
            break;
        case CBManagerStateUnauthorized:
            [result setState:ProtosBluetoothState_State_Unauthorized];
            break;
        case CBManagerStatePoweredOff:
            [result setState:ProtosBluetoothState_State_Off];
            break;
        case CBManagerStatePoweredOn:
            [result setState:ProtosBluetoothState_State_On];
            break;
        default:
            [result setState:ProtosBluetoothState_State_Unknown];
            break;
    }
    return result;
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

- (ProtosDeviceStateResponse*)toDeviceStateProto:(CBPeripheral *)peripheral state:(CBPeripheralState)state {
    ProtosDeviceStateResponse *result = [[ProtosDeviceStateResponse alloc] init];
    switch(state) {
        case CBPeripheralStateDisconnected:
            [result setState:ProtosDeviceStateResponse_BluetoothDeviceState_Disconnected];
            break;
        case CBPeripheralStateConnecting:
            [result setState:ProtosDeviceStateResponse_BluetoothDeviceState_Connecting];
            break;
        case CBPeripheralStateConnected:
            [result setState:ProtosDeviceStateResponse_BluetoothDeviceState_Connected];
            break;
        case CBPeripheralStateDisconnecting:
            [result setState:ProtosDeviceStateResponse_BluetoothDeviceState_Disconnecting];
            break;
    }
    [result setRemoteId:[[peripheral identifier] UUIDString]];
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

