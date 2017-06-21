import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';
import 'package:flutter_blue/abstractions/contracts/i_adapter.dart';
import 'package:flutter_blue/abstractions/contracts/i_bluetoothle.dart';
import 'package:flutter_blue/abstractions/eventargs/bluetooth_state_changed_args.dart';
import 'package:flutter_blue/concrete/adapter.dart';
import 'package:flutter_blue/eventchannels/bluetooth_state_event_channel.dart';

class BluetoothLE implements IBluetoothLE {

  final MethodChannel _channel = new MethodChannel("flutterblue.pauldemarco.com/bluetoothLe");
  final EventChannel _eventChannel = new EventChannel("flutterblue.pauldemarco.com/bluetoothLe/state");
  
  final IAdapter _adapter;
  IAdapter get adapter => _adapter;

  Future<bool> get isOn =>
      _channel.invokeMethod('isOn');

  Future<bool> get isAvailable =>
      _channel.invokeMethod('isAvailable');

  Future<BluetoothState> get state =>
      _channel.invokeMethod('getState')
      .then((i) => BluetoothState.values[i]);

  BluetoothLE() : _adapter = new Adapter() {}
  
  Stream<BluetoothState> stateChanged() {
    return _eventChannel.receiveBroadcastStream()
        .map((i) => BluetoothState.values[i]);
  }

}