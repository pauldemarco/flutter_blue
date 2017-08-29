import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_descriptor.dart';
import 'package:flutter_blue/abstractions/known_descriptors.dart';
import 'package:guid/guid.dart';

class Descriptor implements IDescriptor {

  Descriptor._internal({this.id, this.value, this.characteristic})
      : name = KnownDescriptors.lookup(id).name;

  Descriptor.fromMap(map)
      : this._internal(
      id: new Guid(map['id']),
      value: map['value'],
      characteristic: map['characteristic']);

  final Guid id;
  final String name;
  final Uint8List value;
  final ICharacteristic characteristic;

  @override
  Future<Uint8List> read() {
    // TODO: implement readAsync
  }

  @override
  Future write(Uint8List data) {
    // TODO: implement writeAsync
  }
}