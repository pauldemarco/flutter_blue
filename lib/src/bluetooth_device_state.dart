part of flutter_blue;

class _BluetoothDeviceStateConst {
  static const int disconnected = 0;
  static const int connecting = 1;
  static const int connected = 2;
  static const int disconnecting = 3;
}

//enum BluetoothDeviceStateEnum { disconnected, connecting, connected, disconnecting }

class BluetoothDeviceState {
  final BluetoothStatusCode bluetoothStatusCode;
  const BluetoothDeviceState(this.bluetoothStatusCode);

  factory BluetoothDeviceState.fromId(
      int id, BluetoothStatusCode bluetoothStatusCode) {
    switch (id) {
      case _BluetoothDeviceStateConst.disconnected:
        return BluetoothDeviceDisconnected(bluetoothStatusCode);
      case _BluetoothDeviceStateConst.connecting:
        return BluetoothDeviceConnecting(bluetoothStatusCode);
      case _BluetoothDeviceStateConst.connected:
        return BluetoothDeviceConnected(bluetoothStatusCode);
      case _BluetoothDeviceStateConst.disconnecting:
        return BluetoothDeviceDisconnecting(bluetoothStatusCode);
    }
    throw Error();
  }
}

class BluetoothDeviceConnected extends BluetoothDeviceState {
  const BluetoothDeviceConnected(BluetoothStatusCode bluetoothStatusCode)
      : super(bluetoothStatusCode);
}

class BluetoothDeviceConnecting extends BluetoothDeviceState {
  const BluetoothDeviceConnecting(BluetoothStatusCode bluetoothStatusCode)
      : super(bluetoothStatusCode);
}

class BluetoothDeviceDisconnected extends BluetoothDeviceState {
  const BluetoothDeviceDisconnected(BluetoothStatusCode bluetoothStatusCode)
      : super(bluetoothStatusCode);
}

class BluetoothDeviceDisconnecting extends BluetoothDeviceState {
  const BluetoothDeviceDisconnecting(BluetoothStatusCode bluetoothStatusCode)
      : super(bluetoothStatusCode);
}
