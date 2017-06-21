import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';

/// Converts EventChannel stream into dart Stream
@deprecated("Using /eventchannels")
class BluetoothStateStream extends Stream<BluetoothState> {

  Stream<int> _source;
  StreamSubscription<int> _subscription;
  StreamController<BluetoothState> _controller;

  BluetoothStateStream(Stream<int> source) : _source = source {
    _controller = new StreamController<BluetoothState>(
        onListen: _onListen,
        onPause: _onPause,
        onResume: _onResume,
        onCancel: _onCancel);
  }

  @override
  StreamSubscription<BluetoothState> listen(void onData(BluetoothState event), {Function onError, void onDone(), bool cancelOnError}) {
    return _controller.stream.listen(onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError);
  }

  void _onListen() {
    _subscription = _source.listen(_onData,
        onError: _controller.addError,
        onDone: _onDone);
  }

  void _onCancel() {
    _subscription.cancel();
    _subscription = null;
  }

  void _onPause() {
    _subscription.pause();
  }

  void _onResume() {
    _subscription.resume();
  }

  void _onData(int state) {
    BluetoothState newState = BluetoothState.unknown;
    switch(state) {
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
    _controller.add(newState);
  }

  void _onDone() {
    _controller.close();
  }
}