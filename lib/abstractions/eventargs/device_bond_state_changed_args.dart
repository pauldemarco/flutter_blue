import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/device_bond_state.dart';

class DeviceBondStateChangedEventArgs {
  final IDevice device;
  final DeviceBondState state;

  const DeviceBondStateChangedEventArgs(this.device, this.state);

}