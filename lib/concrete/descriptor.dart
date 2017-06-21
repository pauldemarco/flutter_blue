import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_descriptor.dart';
import 'package:flutter_blue/utils/guid.dart';

class Descriptor implements IDescriptor {

  // TODO: implement characteristic
  @override
  ICharacteristic get characteristic => null;

  // TODO: implement id
  @override
  Guid get id => null;

  // TODO: implement name
  @override
  String get name => null;

  @override
  Future<Uint8List> readAsync() {
    // TODO: implement readAsync
  }

  // TODO: implement value
  @override
  Uint8List get value => null;

  @override
  Future writeAsync(Uint8List data) {
    // TODO: implement writeAsync
  }
}