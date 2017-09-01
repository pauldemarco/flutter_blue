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
    var request = protos.ReadCharacteristicRequest.create()
      ..remoteId = id.toString()
      ..characteristicUuid = characteristic.uuid.toString()
      ..serviceUuid = characteristic.serviceUuid.toString();

    await FlutterBlue.instance._channel
        .invokeMethod('readCharacteristic', request.writeToBuffer());

    return await FlutterBlue.instance._characteristicReadChannel
        .receiveBroadcastStream()
        .map((List<int> data) =>
            new protos.ReadCharacteristicResponse.fromBuffer(data))
        .where((d) =>
            (d.request.remoteId == request.remoteId) &&
            (d.request.characteristicUuid == request.characteristicUuid) &&
            (d.request.serviceUuid == request.serviceUuid))
        .map((d) => d.value)
        .first
        .then((d) => characteristic.value = d);
  }

  /// Retrieves the value of a specified characteristic descriptor
  Future<List<int>> readDescriptor(BluetoothDescriptor descriptor) async {
    var request = protos.ReadDescriptorRequest.create()
      ..remoteId = id.toString()
      ..descriptorUuid = descriptor.uuid.toString()
      ..characteristicUuid = descriptor.characteristicUuid.toString()
      ..serviceUuid = descriptor.serviceUuid.toString();

    await FlutterBlue.instance._channel
        .invokeMethod('readDescriptor', request.writeToBuffer());

    return await FlutterBlue.instance._descriptorReadChannel
        .receiveBroadcastStream()
        .map((List<int> data) =>
            new protos.ReadDescriptorResponse.fromBuffer(data))
        .where((d) =>
            (d.request.remoteId == request.remoteId) &&
            (d.request.descriptorUuid == request.descriptorUuid) &&
            (d.request.characteristicUuid == request.characteristicUuid) &&
            (d.request.serviceUuid == request.serviceUuid))
        .map((d) => d.value)
        .first
        .then((d) => descriptor.value = d);
  }

  /// Writes the value of a characteristic.
  /// [CharacteristicWriteType.withoutResponse]: the write is not
  /// guaranteed and will return immediately with success.
  /// [CharacteristicWriteType.withResponse]: the method will return after the
  /// write operation has either passed or failed.
  Future<Null> writeCharacteristic(BluetoothCharacteristic characteristic, List<int> value,
      {CharacteristicWriteType type =
          CharacteristicWriteType.withoutResponse}) async {
    var request = protos.WriteCharacteristicRequest.create()
      ..remoteId = id.toString()
      ..characteristicUuid = characteristic.uuid.toString()
      ..serviceUuid = characteristic.serviceUuid.toString()
      ..writeType = protos.WriteCharacteristicRequest_WriteType.valueOf(type.index)
      ..value = value;

    var result = await FlutterBlue.instance._channel
        .invokeMethod('writeCharacteristic', request.writeToBuffer());

    if(type == CharacteristicWriteType.withoutResponse) {
      return result;
    }

    return await FlutterBlue.instance._methodStream
      .where((m) => m.method == "WriteCharacteristicResponse")
      .map((m) => m.arguments)
      .map((List<int> data) => new protos.WriteCharacteristicResponse.fromBuffer(data))
      .where((d) =>
        (d.request.remoteId == request.remoteId) &&
        (d.request.characteristicUuid == request.characteristicUuid) &&
        (d.request.serviceUuid == request.serviceUuid))
      .first
      .then((w) => w.success)
      .then((success) => (!success) ? throw new Exception('Failed to write the characteristic') : null);
  }

  /// Writes the value of a characteristic descriptor
  Future<Null> writeDescriptor(BluetoothDescriptor descriptor, List<int> value) async {
    var request = protos.WriteDescriptorRequest.create()
      ..remoteId = id.toString()
      ..descriptorUuid = descriptor.uuid.toString()
      ..characteristicUuid = descriptor.characteristicUuid.toString()
      ..serviceUuid = descriptor.serviceUuid.toString()
      ..value = value;

    await FlutterBlue.instance._channel
        .invokeMethod('writeDescriptor', request.writeToBuffer());

    return await FlutterBlue.instance._methodStream
        .where((m) => m.method == "WriteDescriptorResponse")
        .map((m) => m.arguments)
        .map((List<int> data) => new protos.WriteDescriptorResponse.fromBuffer(data))
        .where((d) =>
        (d.request.remoteId == request.remoteId) &&
        (d.request.descriptorUuid == request.descriptorUuid) &&
        (d.request.characteristicUuid == request.characteristicUuid) &&
        (d.request.serviceUuid == request.serviceUuid))
        .first
        .then((w) => w.success)
        .then((success) => (!success) ? throw new Exception('Failed to write the descriptor') : null);
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
