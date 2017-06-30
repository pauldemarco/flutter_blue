import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/characteristic_prop_type.dart';
import 'package:flutter_blue/abstractions/characteristic_write_type.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_descriptor.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/eventargs/characteristic_updated_args.dart';
import 'package:flutter_blue/utils/guid.dart';

class Characteristic implements ICharacteristic{

  Characteristic._internal({this.id, this.name, this.value, this.stringValue, this.properties, this.writeType, this.canRead, this.canReadEncrypted, this.canWrite, this.canWriteEncrypted, this.service})
      : _methodChannel = new MethodChannel(
      "flutterblue.pauldemarco.com/devices/${service.device.id.toString()}/services/${service.id.toString()}/characteristics/${id.toString()}/methods");

  Characteristic({id, name, value, stringValue, properties, writeType, canRead, canReadEncrypted, canWrite, canWriteEncrypted, service})
      : this._internal(
      id: id, name: name, value: value, stringValue: stringValue, properties: properties, writeType: writeType, canRead: canRead, canReadEncrypted: canReadEncrypted, canWrite: canWrite, canWriteEncrypted: canWriteEncrypted, service: service);

  Characteristic.fromMap(map)
      : this._internal(
    id: new Guid(map['id']),
    name: null,
    properties: map['properties'],
    writeType: CharacteristicWriteType.values[map['writeType']],
    canRead: map['canRead'],
    canReadEncrypted: map['canReadEncrypted'],
    canWrite: map['canWrite'],
    canWriteEncrypted: map['canWriteEncrypted'],
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

  /// Specifies how the <see cref="WriteAsync"/> function writes the value.
  final CharacteristicWriteType writeType;

  /// Indicates whether the characteristic can be read or not.
  final bool canRead;
  final bool canReadEncrypted;

  /// Indicates whether the characteristic can be written or not.
  final bool canWrite;
  final bool canWriteEncrypted;

  /// Returns the parent service. Use this to access the device.
  final IService service;

  final MethodChannel _methodChannel;

  @override
  void valueUpdated(CharacteristicUpdatedEventArgs args) {
    // TODO: implement valueUpdated
  }

  @override
  Future<Uint8List> readAsync() {
    // TODO: implement readAsync
  }

  @override
  Future startUpdatesAsync() {
    // TODO: implement startUpdatesAsync
  }

  @override
  Future stopUpdatesAsync() {
    // TODO: implement stopUpdatesAsync
  }

  @override
  Future<bool> writeAsync(Uint8List data) {
    // TODO: implement writeAsync
  }
  @override
  Future<IDescriptor> getDescriptorAsync(Guid id) {
    // TODO: implement getDescriptorAsync
  }

  @override
  Future<List<IDescriptor>> getDescriptorsAsync() {
    // TODO: implement getDescriptorsAsync
  }

  Map<String, dynamic> toMap() {
    var map = new Map();
    map["id"] = id.toString();
    map["name"] = name;
    map["properties"] = properties;
    map["writeType"] = writeType;
    map["canRead"] = canRead;
    map["canReadEncrypted"] = canReadEncrypted;
    map["canWrite"] = canWrite;
    map["canWriteEncrypted"] = canWriteEncrypted;
    return map;
  }

  operator ==(other) =>
      other is Characteristic && id.hashCode == other.id.hashCode;

  int get hashCode => id.hashCode;
}

typedef void ValueChanged<T>(T value);