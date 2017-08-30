import 'package:flutter_blue/src/bluetooth_state.dart';

class BluetoothStateChangedArgs {
  final BluetoothState oldState;
  final BluetoothState newState;

  const BluetoothStateChangedArgs(this.oldState, this.newState);
}