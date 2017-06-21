import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_blue/concrete/device.dart';

/// Holds a list of methods to be implemented by the platform
/// Serializes the parameters for method channel
class NativeMethods {

  static MethodChannel _channel = const MethodChannel('flutterblue.pauldemarco.com/methods');

  Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');

  /// Kicks off the scanning process on the platform
  static Future startingScanningForDevices() {
    return _channel.invokeMethod('startScanningForDevicesAsync');
  }

  /// Cancels any pending scans on the platform
  static Future stopScanningForDevices() {
    return _channel.invokeMethod('stopScanningForDevicesAsync');
  }

  /// Connects to the device on the platform, returns result if successful
  static Future connectToDevice(Device device) {
    return _channel.invokeMethod('connectToDeviceAsync', device.toMap());
  }


}