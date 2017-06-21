import 'package:flutter_blue/abstractions/contracts/i_device.dart';

class DeviceEventArgs {
  final IDevice device;

  const DeviceEventArgs(this.device);
}