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

  /// Discovers services offered by the remote device as well as their characteristics and descriptors
  Future<List<BluetoothService>> discoverServices() {
    return FlutterBlue.instance._channel
        .invokeMethod('discoverServices', id.toString())
        .then((List<int> data) =>
            new protos.DiscoverServicesResult.fromBuffer(data))
        .then((p) => p.services)
        .then((s) => s.map((p) => new BluetoothService.fromProto(p)).toList());
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
      BluetoothCharacteristic characteristic) {
    var request = protos.ReadCharacteristicRequest.create()
      ..remoteId = id.toString()
      ..characteristicUuid = characteristic.uuid.toString()
      ..serviceUuid = characteristic.serviceUuid.toString();

    return FlutterBlue.instance._channel
        .invokeMethod('readCharacteristic', request.writeToBuffer())
        .then((List<int> data) => new protos.ReadCharacteristicResponse.fromBuffer(data))
        .then((p) => p.characteristic.value)
        .then((d) => characteristic.value = d);
  }


  /// Retrieves the value of a specified descriptor
  Future<List<int>> readDescriptor(BluetoothDescriptor descriptor) async {
    var request = protos.ReadDescriptorRequest.create()
      ..remoteId = id.toString()
      ..descriptorUuid = descriptor.uuid.toString()
      ..characteristicUuid = descriptor.characteristicUuid.toString()
      ..serviceUuid = descriptor.serviceUuid.toString();

    return FlutterBlue.instance._channel
        .invokeMethod('readDescriptor', request.writeToBuffer())
        .then((List<int> data) =>
            new protos.ReadDescriptorResponse.fromBuffer(data))
        .then((d) => descriptor.value = d.value);
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


    if(type == CharacteristicWriteType.withoutResponse) {
      return FlutterBlue.instance._channel
        .invokeMethod('writeCharacteristic', request.writeToBuffer());
    }

    return FlutterBlue.instance._channel
      .invokeMethod('writeCharacteristic', request.writeToBuffer())
      .then((List<int> data) => new protos.WriteCharacteristicResponse.fromBuffer(data))
      .then((w) => w.success)
      .then((success) => (!success) ? throw new Exception('Failed to write the characteristic') : null)
      .then((value) => characteristic.value = value)
      .then((_) => null);
  }

  /// Writes the value of a descriptor
  Future<Null> writeDescriptor(BluetoothDescriptor descriptor, List<int> value) async {
    var request = protos.WriteDescriptorRequest.create()
      ..remoteId = id.toString()
      ..descriptorUuid = descriptor.uuid.toString()
      ..characteristicUuid = descriptor.characteristicUuid.toString()
      ..serviceUuid = descriptor.serviceUuid.toString()
      ..value = value;

    await FlutterBlue.instance._channel
        .invokeMethod('writeDescriptor', request.writeToBuffer())
        .then((List<int> data) => new protos.WriteDescriptorResponse.fromBuffer(data))
        .then((w) => w.success)
        .then((success) => (!success) ? throw new Exception('Failed to write the descriptor') : null)
        .then((_) => descriptor.value = value)
        .then((_) => null);
  }

  /// Sets notifications or indications for the value of a specified characteristic
  Future<bool> setNotifyValue(
      BluetoothCharacteristic characteristic, bool notify) {
    var request = protos.SetNotificationRequest.create()
      ..remoteId = id.toString()
      ..serviceUuid = characteristic.serviceUuid.toString()
      ..characteristicUuid = characteristic.uuid.toString()
      ..enable = notify;
    return FlutterBlue.instance._channel.invokeMethod('setNotification', request.writeToBuffer())
        .then((List<int> data) => new protos.BluetoothCharacteristic.fromBuffer(data))
        .then((p) => new BluetoothCharacteristic.fromProto(p))
        .then((c) {
          characteristic.updateDescriptors(c.descriptors);
          characteristic.value = c.value;
          return (c.isNotifying == notify);
        });
  }

  /// Notifies when the characteristic's value has changed.
  /// setNotification() should be run first to enable them on the peripheral
  Stream<List<int>> onValueChanged(BluetoothCharacteristic characteristic) {
    return FlutterBlue.instance._methodStream
        .where((m) => m.method == "CharacteristicChanged")
        .map((m) => m.arguments)
        .map((List<int> data) => new protos.OnNotificationResponse.fromBuffer(data))
        .where((p) => p.remoteId == id.toString())
        .map((p) => new BluetoothCharacteristic.fromProto(p.characteristic))
        .where((c) => c.uuid == characteristic.uuid)
        .map((c) {
          characteristic.updateDescriptors(c.descriptors);
          characteristic.value = c.value;
          return c.value;
        });
  }

  /// The current connection state of the device
  Future<BluetoothDeviceState> get state =>
      FlutterBlue.instance._channel.invokeMethod('deviceState', id.toString())
          .then((List<int> data) => new protos.DeviceStateResponse.fromBuffer(data))
          .then((p) => BluetoothDeviceState.values[p.state.value]);

  /// Notifies when the device connection state has changed
  Stream<BluetoothDeviceState> onStateChanged() {
    return FlutterBlue.instance._methodStream
        .where((m) => m.method == "DeviceState")
        .map((m) => m.arguments)
        .map((List<int> data) => new protos.DeviceStateResponse.fromBuffer(data))
        .where((p) => p.remoteId == id.toString())
        .map((p) => BluetoothDeviceState.values[p.state.value]);
  }

  /// Indicates whether the Bluetooth Device can send a write without response
  Future<bool> get canSendWriteWithoutResponse =>
      new Future.error(new UnimplementedError());
}

enum BluetoothDeviceType { unknown, classic, le, dual }

enum BluetoothDeviceState { disconnected, connecting, connected, disconnecting }
