import 'dart:async';
import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';
import 'package:flutter_blue/abstractions/contracts/i_adapter.dart';
import 'package:flutter_blue/abstractions/contracts/i_bluetoothle.dart';
import 'package:flutter_blue/abstractions/eventargs/bluetooth_state_changed_args.dart';
import 'package:flutter_blue/concrete/adapter.dart';
import 'package:flutter_blue/eventchannels/bluetooth_state_event_channel.dart';

class BluetoothLE implements IBluetoothLE {
  
  final IAdapter _adapter;
  IAdapter get adapter => _adapter;

  bool _isAvailable;
  bool get isAvailable => _isAvailable;

  bool _isOn;
  bool get isOn => _isOn;

  BluetoothState _state = BluetoothState.unknown;
  Future<BluetoothState> get state => stateChanged().map((stateArg) => stateArg.newState).first;

  BluetoothLE() : _adapter = new Adapter() {}
  
  Stream<BluetoothStateChangedArgs> stateChanged() {
    return BluetoothStateEventChannel.bluetoothState()
        .where((s) => s != _state)
        .map((s) => new BluetoothStateChangedArgs(_state, s))
        .map((s){ _state = s.newState; return s; }); // TODO: This is not advised. Consider using rxDart and doOn() function to set local variable
  }

}