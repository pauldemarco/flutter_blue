import 'dart:async';

import 'package:flutter_blue/concrete/bluetoothle.dart';
import 'package:meta/meta.dart' show visibleForTesting;


class FlutterBlue {
  static FlutterBlue _instance;

  factory FlutterBlue() {
    if (_instance == null) {
      _instance = new FlutterBlue.private(new BluetoothLE());
    }
    return _instance;
  }

  @visibleForTesting
  FlutterBlue.private(this._ble);

  final BluetoothLE _ble;
  BluetoothLE get ble => _ble;

}
