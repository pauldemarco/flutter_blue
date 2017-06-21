import 'dart:async';

import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/utils/guid.dart';

class Service implements IService {

  // TODO: implement device
  @override
  IDevice get device => null;

  @override
  Future<ICharacteristic> getCharacteristicAsync(Guid id) {
    // TODO: implement getCharacteristicAsync
  }

  @override
  Future<List<ICharacteristic>> getCharacteristicsAsync() {
    // TODO: implement getCharacteristicsAsync
  }

  // TODO: implement id
  @override
  Guid get id => null;

  // TODO: implement isPrimary
  @override
  bool get isPrimary => null;

  // TODO: implement name
  @override
  String get name => null;
}