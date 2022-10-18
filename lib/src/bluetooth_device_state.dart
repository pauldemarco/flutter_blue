
part of flutter_blue;

enum BluetoothDeviceStateEnum { disconnected, connecting, connected, disconnecting }

class BluetoothDeviceState {
  final BluetoothDeviceStateEnum state;
  final int status;
  const BluetoothDeviceState(this.state, this.status);
}