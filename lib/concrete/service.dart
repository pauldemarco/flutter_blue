import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/utils/guid.dart';

class Service implements IService {
  Service._internal({this.id, this.device, this.isPrimary, this.name})
      : _methodChannel = new MethodChannel(
            "flutterblue.pauldemarco.com/devices/${device.id.toString()}/services/${id.toString()}/methods");

  Service({id, device, isPrimary, name})
      : this._internal(
            id: id, device: device, isPrimary: isPrimary, name: name);

  final Guid id;
  final IDevice device;
  final bool isPrimary;
  final String name;

  final MethodChannel _methodChannel;

  @override
  Future<List<IService>> getIncludedServices() {
    return _methodChannel.invokeMethod("getIncludedServices");
  }

  @override
  Future<List<ICharacteristic>> getCharacteristics() {
    return _methodChannel.invokeMethod("getCharacteristics");
  }

  @override
  Future<ICharacteristic> getCharacteristic(Guid id) {
    return _methodChannel.invokeMethod("getCharacteristic", id.toString());
  }

}
