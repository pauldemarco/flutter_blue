import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/known_services.dart';
import 'package:flutter_blue/concrete/characteristic.dart';
import 'package:guid/guid.dart';

class Service implements IService {
  Service._internal({this.id, this.device, this.isPrimary, List<Map<String,Object>> includedServices, List<Map<String,Object>> characteristics})
      : _methodChannel = new MethodChannel(
            "flutterblue.pauldemarco.com/devices/${device.id.toString()}/services/${id.toString()}/methods"),
        name = KnownServices.lookup(id).name
  {
    if(includedServices != null) {
      var s = includedServices.map((m) {
        m.putIfAbsent("device", () => this.device);
        return new Service.fromMap(m);
      }).toList();
      this.includedServices.addAll(s);
    }
    if(characteristics != null) {
      var c = characteristics.map((m) {
        m.putIfAbsent("service", () => this);
        return new Characteristic.fromMap(m);
      }).toList();
      this.characteristics.addAll(c);
    }
  }

  Service({id, device, isPrimary})
      : this._internal(
            id: id, device: device, isPrimary: isPrimary);

  Service.fromMap(map)
      : this._internal(
      id: new Guid(map['id']),
      device: map['device'],
      isPrimary: map['isPrimary'],
      includedServices: map['includedServices'],
      characteristics: map['characteristics']);

  final Guid id;
  final IDevice device;
  final bool isPrimary;
  final String name;
  final MethodChannel _methodChannel;
  final Set<IService> includedServices = new Set<IService>();
  final Set<ICharacteristic> characteristics = new Set<ICharacteristic>();

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
    return _methodChannel.invokeMethod("getCharacteristic", id.toString())
        .asStream()
        .map((m) {
          m.putIfAbsent("service", () => this);
          return new Characteristic.fromMap(m);
        })
        .first;
  }

  Map<String, dynamic> toMap() {
    var map = new Map();
    map["id"] = id.toString();
    map["device"] = null;
    map["isPrimary"] = isPrimary;
    map["name"] = name;
    return map;
  }

  operator ==(other) =>
      other is Service && id.hashCode == other.id.hashCode;

  int get hashCode => id.hashCode;
}
