#import "FlutterBluePlugin.h"
#import "Flutterblue.pbobjc.h"

@interface FlutterBluePlugin ()
@property(nonatomic, retain) NSObject<FlutterPluginRegistrar> *registrar;
@property(nonatomic, retain) FlutterMethodChannel *channel;
@property(nonatomic, retain) FlutterEventChannel *stateChannel;
@property(nonatomic, retain) StateStreamHandler *stateStreamHandler;
@property(nonatomic, retain) FlutterEventChannel *scanResultChannel;
@property(nonatomic, retain) FlutterEventChannel *servicesDiscoveredChannel;
@property(nonatomic, retain) FlutterEventChannel *characteristicReadChannel;
@property(nonatomic, retain) FlutterEventChannel *descriptorReadChannel;
@property(nonatomic, retain) FlutterEventChannel *characteristicNotifiedChannel;
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
    instance.stateChannel = stateChannel;
    instance.scanResultChannel = scanResultChannel;
    instance.servicesDiscoveredChannel = servicesDiscoveredChannel;
    instance.characteristicReadChannel = characteristicReadChannel;
    instance.descriptorReadChannel = descriptorReadChannel;
    instance.characteristicNotifiedChannel = characteristicNotifiedChannel;
    
    StateStreamHandler* stateStreamHandler = [[StateStreamHandler alloc] init];
    [stateChannel setStreamHandler:stateStreamHandler];
    instance.stateStreamHandler = stateStreamHandler;
    
    [registrar addMethodCallDelegate:instance channel:channel];
    
    instance.centralManager = [[CBCentralManager alloc] initWithDelegate:instance queue:nil];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"state" isEqualToString:call.method]) {
        FlutterStandardTypedData *data = [self toFlutterData:[self fromStateToProto:self->_centralManager.state]];
        result(data);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)centralManagerDidUpdateState:(nonnull CBCentralManager *)central {
    if(self.stateStreamHandler.sink != nil) {
        FlutterStandardTypedData *data = [self toFlutterData:[self fromStateToProto:self->_centralManager.state]];
        self.stateStreamHandler.sink(data);
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

@end

@implementation StateStreamHandler

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    self.sink = eventSink;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    self.sink = nil;
    return nil;
}

@end

