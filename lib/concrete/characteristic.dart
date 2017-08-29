import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/characteristic_prop_type.dart';
import 'package:flutter_blue/abstractions/characteristic_write_type.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_descriptor.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/eventargs/characteristic_updated_args.dart';
import 'package:flutter_blue/abstractions/known_characteristics.dart';
import 'package:guid/guid.dart';

class Characteristic implements ICharacteristic {
  Characteristic._internal(
      {this.id,
      this.value,
      this.stringValue,
      this.properties,
      this.writeType,
      this.service})
      : _methodChannel = new MethodChannel(
            "flutterblue.pauldemarco.com/devices/${service.device.id.toString()}/services/${service.id.toString()}/characteristics/${id.toString()}/methods"),
        _valueChannel = new EventChannel(
            "flutterblue.pauldemarco.com/devices/${service.device.id.toString()}/services/${service.id.toString()}/characteristics/${id.toString()}/value"),
        name = KnownCharacteristics.lookup(id).name;

  Characteristic(
      {id,
      value,
      stringValue,
      properties,
      writeType,
      service})
      : this._internal(
            id: id,
            value: value,
            stringValue: stringValue,
            properties: properties,
            writeType: writeType,
            service: service);

  Characteristic.fromMap(map)
      : this._internal(
            id: new Guid(map['id']),
            properties: map['properties'],
            writeType: CharacteristicWriteType.values[map['writeType']],
            service: map['service']);

  /// Id of the characteristic.
  final Guid id;

  /// Name of the charakteristic.
  /// Returns the name if the <see cref="Id"/> is a id of a standard characteristic.
  final String name;

  /// Gets the last known value of the characteristic.
  final Uint8List value;

  /// Gets <see cref="Value"/> as UTF8 encoded string representation.
  final String stringValue;

  /// Properties of the characteristic.
  final int properties;

  /// Specifies how the <see cref="Write"/> function writes the value.
  final CharacteristicWriteType writeType;

  /// Indicates whether the characteristic can be read or not.
  bool get canBroadcast => (properties & CharacteristicPropertyType.broadcast) == CharacteristicPropertyType.broadcast;
  bool get canRead => (properties & CharacteristicPropertyType.read) == CharacteristicPropertyType.read;
  bool get canWriteWithoutResponse => (properties & CharacteristicPropertyType.writeWithoutResponse) == CharacteristicPropertyType.writeWithoutResponse;
  bool get canWrite => (properties & CharacteristicPropertyType.write) == CharacteristicPropertyType.write;
  bool get canNotify => (properties & CharacteristicPropertyType.notify) == CharacteristicPropertyType.notify;
  bool get canIndicate => (properties & CharacteristicPropertyType.indicate) == CharacteristicPropertyType.indicate;
  bool get canAuthenticatedSignedWrites => (properties & CharacteristicPropertyType.authenticatedSignedWrites) == CharacteristicPropertyType.authenticatedSignedWrites;
  bool get hasExtendedProperties => (properties & CharacteristicPropertyType.extendedProperties) == CharacteristicPropertyType.extendedProperties;
  bool get isNotifyEncryptionRequired => (properties & CharacteristicPropertyType.notifyEncryptionRequired) == CharacteristicPropertyType.notifyEncryptionRequired;
  bool get isIndicateEncryptionRequired => (properties & CharacteristicPropertyType.indicateEncryptionRequired) == CharacteristicPropertyType.indicateEncryptionRequired;

  /// Returns the parent service. Use this to access the device.
  final IService service;

  /// Returns whether we are currently notifying
  bool _isUpdating = false;
  bool get isUpdating => _isUpdating;

  /// Platform channels
  final MethodChannel _methodChannel;
  final EventChannel _valueChannel;

  Stream<Uint8List> valueUpdated() {
    print("valueUpdated(): updates requested for " + id.toString());
    return _valueChannel.receiveBroadcastStream();
  }

  @override
  Future<Uint8List> read() {
    return _methodChannel.invokeMethod('read');
  }

  @override
  Future<bool> write(Uint8List data) {
    return _methodChannel.invokeMethod('write', data);
  }

  @override
  Future startUpdates() {
    return _methodChannel.invokeMethod('startUpdates')
        .then((b) => _isUpdating = true);
  }

  @override
  Future stopUpdates() {
    return _methodChannel.invokeMethod('stopUpdates')
        .then((b) => _isUpdating = false);
  }

  @override
  Future<IDescriptor> getDescriptor(Guid id) {
    return _methodChannel.invokeMethod('getDescriptor', id.toString());
  }

  @override
  Future<List<IDescriptor>> getDescriptors() {
    return _methodChannel.invokeMethod('getDescriptors');
  }

  Map<String, dynamic> toMap() {
    var map = new Map();
    map["id"] = id.toString();
    map["name"] = name;
    map["properties"] = properties;
    map["writeType"] = writeType;
    return map;
  }

  operator ==(other) =>
      other is Characteristic && id.hashCode == other.id.hashCode;

  int get hashCode => id.hashCode;
}

typedef void ValueChanged<T>(T value);
