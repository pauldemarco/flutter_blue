import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';

/// Put's the EventChannel behind a data conversion layer
/// EventChannel int's are converted to BluetoothState objects
class BluetoothStateEventChannel {

  static EventChannel _channel = const EventChannel('flutterblue.pauldemarco.com/bluetoothState');

  static Stream<BluetoothState> bluetoothState() {
    return _channel.receiveBroadcastStream()
        .map((i) => stateFromInt(i));
  }

  static BluetoothState stateFromInt(int s) {
    BluetoothState newState = BluetoothState.unknown;
    switch(s) {
      case 0:
        newState = BluetoothState.unknown;
        break;
      case 1:
        newState = BluetoothState.unavailable;
        break;
      case 2:
        newState = BluetoothState.unauthorized;
        break;
      case 3:
        newState = BluetoothState.turningOn;
        break;
      case 4:
        newState = BluetoothState.on;
        break;
      case 5:
        newState = BluetoothState.turningOff;
        break;
      case 6:
        newState = BluetoothState.off;
        break;
    }
    return newState;
  }

}