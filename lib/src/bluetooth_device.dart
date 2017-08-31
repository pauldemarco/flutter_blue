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

  /// Discovers services offered by the remote device as well as their characteristics and descriptors
  Future<List<BluetoothService>> discoverServices() async {
    await FlutterBlue.instance._channel
        .invokeMethod('discoverServices', id.toString());

    return await FlutterBlue.instance._servicesDiscoveredChannel
        .receiveBroadcastStream()
        .map((List<int> data) =>
            new protos.DiscoverServicesResult.fromBuffer(data))
        .where((d) => d.remoteId == id.toString())
        .map((d) => d.services)
        .map((s) => s.map((p) => new BluetoothService.fromProto(p)).toList())
        .first;
  }

  /// Returns a list of Bluetooth GATT services offered by the remote device
  /// This function requires that discoverServices has been completed for this device
  Future<List<BluetoothService>> get services {
    return FlutterBlue.instance._channel
        .invokeMethod('services', id.toString())
        .then((List<int> data) =>
            new protos.DiscoverServicesResult.fromBuffer(data).services)
        .then((i) => i.map((s) => new BluetoothService.fromProto(s)).toList());
  }

  /// Retrieves the value of a specified characteristic
  Future<List<int>> readCharacteristic(
      BluetoothCharacteristic characteristic) async {
    var request = protos.ReadAttributeRequest.create()
      ..remoteId = id.toString()
      ..uuid = characteristic.uuid.toString()
      ..serviceUuid = characteristic.serviceUuid.toString();

    await FlutterBlue.instance._channel
        .invokeMethod('readCharacteristic', request.writeToBuffer());

    return await FlutterBlue.instance._characteristicReadChannel
        .receiveBroadcastStream()
        .map((List<int> data) =>
            new protos.ReadAttributeResponse.fromBuffer(data))
        .where((d) => (d.request.remoteId == request.remoteId) &&
              (d.request.uuid == request.uuid) &&
              (d.request.serviceUuid == request.serviceUuid))
        .map((d) => d.value)
        .first;
  }

  /// Retrieves the value of a specified characteristic descriptor
  Future<List<int>> readDescriptor(BluetoothDescriptor descriptor) {
    return new Future.error(new UnimplementedError());
  }

  /// Writes the value of a characteristic
  Future<Null> writeCharacteristic(BluetoothCharacteristic characteristic,
      {CharacteristicWriteType type =
          CharacteristicWriteType.withoutResponse}) {
    return new Future.error(new UnimplementedError());
  }

  /// Writes the value of a characteristic descriptor
  Future<Null> writeDescriptor(BluetoothDescriptor descriptor) {
    return new Future.error(new UnimplementedError());
  }

  /// Sets notifications or indications for the value of a specified characteristic
  Future<Null> setNotifyValue(
      BluetoothCharacteristic characteristic, bool notify) {
    return new Future.error(new UnimplementedError());
  }

  /// The current connection state of the peripheral
  Future<BluetoothDeviceState> get state =>
      new Future.error(new UnimplementedError());

  /// Notifies when the Bluetooth Device connection state has changed
  Stream<BluetoothDeviceState> onStateChanged() =>
      new Future.error(new UnimplementedError()).asStream();

  /// Indicates whether the Bluetooth Device can send a write without response
  Future<bool> get canSendWriteWithoutResponse =>
      new Future.error(new UnimplementedError());
}

enum BluetoothDeviceType { unknown, classic, le, dual }

enum CharacteristicWriteType { withResponse, withoutResponse }

enum BluetoothDeviceState { disconnected, connecting, connected, disconnecting }
