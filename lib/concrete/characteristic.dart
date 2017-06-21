import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_blue/abstractions/characteristic_prop_type.dart';
import 'package:flutter_blue/abstractions/characteristic_write_type.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_descriptor.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/eventargs/characteristic_updated_args.dart';
import 'package:flutter_blue/utils/guid.dart';

class Characteristic implements ICharacteristic{

  /// Id of the characteristic.
  final Guid id;

  /// TODO: review: do we need this in any case?
  /// Uuid of the characteristic.
  final String uuid;

  /// Name of the charakteristic.
  /// Returns the name if the <see cref="Id"/> is a id of a standard characteristic.
  final String name;

  /// Gets the last known value of the characteristic.
  final Uint8List value;

  /// Gets <see cref="Value"/> as UTF8 encoded string representation.
  final String stringValue;

  /// Properties of the characteristic.
  final CharacteristicPropertyType properties;

  /// Specifies how the <see cref="WriteAsync"/> function writes the value.
  CharacteristicWriteType writeType;

  /// Indicates wheter the characteristic can be read or not.
  final bool canRead;

  /// Indicates wheter the characteristic can be written or not.
  final bool canWrite;

  /// Indicates wheter the characteristic supports notify or not.
  final bool canUpdate;

  /// Returns the parent service. Use this to access the device.
  final IService service;

  Characteristic({this.id, this.uuid, this.name, this.value, this.stringValue, this.properties, this.canRead, this.canWrite, this.canUpdate, this.service});

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
}

typedef void ValueChanged<T>(T value);