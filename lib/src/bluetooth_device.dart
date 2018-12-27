// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of flutter_blue;

class BluetoothDevice {
  final DeviceIdentifier id;
  final String name;
  final BluetoothDeviceType type;

  BluetoothDevice(
      {@required this.id, this.name, this.type = BluetoothDeviceType.unknown});

  BluetoothDevice.fromProto(protos.BluetoothDevice p)
      : id = new DeviceIdentifier(p.remoteId),
        name = p.name,
        type = BluetoothDeviceType.values[p.type.value];

  /// Establishes a connection to the Bluetooth Device.
  Future<void> connect({
    Duration timeout,
    bool autoConnect = true,
  }) async {
    var request = protos.ConnectRequest.create()
      ..remoteId = id.toString()
      ..androidAutoConnect = autoConnect;

    Timer timer;
    if (timeout != null) {
      timer = Timer(timeout, () {
        disconnect();
        throw TimeoutException('Failed to connect in time.', timeout);
      });
    }

    await FlutterBlue.instance._channel
        .invokeMethod('connect', request.writeToBuffer());

    await onStateChanged()
        .firstWhere((s) => s == BluetoothDeviceState.connected);

    timer.cancel();

    return;
  }

  /// Cancels connection to the Bluetooth Device
  Future disconnect() =>
      FlutterBlue.instance._channel.invokeMethod('disconnect', id.toString());

  /// Discovers services offered by the remote device as well as their characteristics and descriptors
  Future<List<BluetoothService>> discoverServices() async {
    var response = FlutterBlue.instance._servicesDiscoveredChannel
        .receiveBroadcastStream()
        .map((buffer) => new protos.DiscoverServicesResult.fromBuffer(buffer))
        .where((p) => p.remoteId == id.toString())
        .map((p) => p.services)
        .map((s) => s.map((p) => new BluetoothService.fromProto(p)).toList())
        .first;

    await FlutterBlue.instance._channel
        .invokeMethod('discoverServices', id.toString());

    return response;
  }

  /// Returns a list of Bluetooth GATT services offered by the remote device
  /// This function requires that discoverServices has been completed for this device
  Future<List<BluetoothService>> get services {
    return FlutterBlue.instance._channel
        .invokeMethod('services', id.toString())
        .then((buffer) =>
            new protos.DiscoverServicesResult.fromBuffer(buffer).services)
        .then((i) => i.map((s) => new BluetoothService.fromProto(s)).toList());
  }

  /// The current connection state of the device
  Future<BluetoothDeviceState> get state => FlutterBlue.instance._channel
      .invokeMethod('deviceState', id.toString())
      .then((buffer) => new protos.DeviceStateResponse.fromBuffer(buffer))
      .then((p) => BluetoothDeviceState.values[p.state.value]);

  /// Notifies when the device connection state has changed
  Stream<BluetoothDeviceState> onStateChanged() {
    return FlutterBlue.instance._methodStream
        .where((m) => m.method == "DeviceState")
        .map((m) => m.arguments)
        .map((buffer) => new protos.DeviceStateResponse.fromBuffer(buffer))
        .where((p) => p.remoteId == id.toString())
        .map((p) => BluetoothDeviceState.values[p.state.value]);
  }

  /// Indicates whether the Bluetooth Device can send a write without response
  Future<bool> get canSendWriteWithoutResponse =>
      new Future.error(new UnimplementedError());
}

enum BluetoothDeviceType { unknown, classic, le, dual }

enum BluetoothDeviceState { disconnected, connecting, connected, disconnecting }
