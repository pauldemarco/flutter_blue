#import "FlutterBluePlugin.h"

@interface FlutterBluePlugin ()
@property(nonatomic, retain) NSObject<FlutterPluginRegistrar> *registrar;
@property(nonatomic, retain) FlutterMethodChannel *channel;
@property(nonatomic, retain) FlutterEventChannel *stateChannel;
@property(nonatomic, retain) FlutterEventChannel *scanResultChannel;
@property(nonatomic, retain) FlutterEventChannel *servicesDiscoveredChannel;
@property(nonatomic, retain) FlutterEventChannel *characteristicReadChannel;
@property(nonatomic, retain) FlutterEventChannel *descriptorReadChannel;
@property(nonatomic, retain) FlutterEventChannel *characteristicNotifiedChannel;

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
    
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end

@implementation StateStreamHandler

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    
    return nil;
}

@end

