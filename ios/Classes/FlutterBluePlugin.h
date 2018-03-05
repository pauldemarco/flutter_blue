#import <Flutter/Flutter.h>
#import <CoreBluetooth/CoreBluetooth.h>

#define NAMESPACE @"plugins.pauldemarco.com/flutter_blue"

@interface FlutterBluePlugin : NSObject<FlutterPlugin, CBCentralManagerDelegate>
@end

@interface StateStreamHandler : NSObject<FlutterStreamHandler>
@property FlutterEventSink sink;
@end

