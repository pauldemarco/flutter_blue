import 'dart:async';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/advertisement_record.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/concrete/service.dart';
import 'package:guid/guid.dart';

class Device implements IDevice {
  Device._internal(
      {this.advertisementRecords,
      this.id,
      this.name,
      this.nativeDevice,
      this.rssi})
      : _methodChannel = new MethodChannel(
            "flutterblue.pauldemarco.com/devices/${id.toString()}/methods"),
        _statusChannel = new EventChannel(
            "flutterblue.pauldemarco.com/devices/${id.toString()}/status");

  Device({id, name, nativeDevice, rssi, advertisementRecords})
      : this._internal(
            id: id,
            name: name,
            rssi: rssi,
            nativeDevice: nativeDevice,
            advertisementRecords: advertisementRecords);

  Device.fromMap(map)
      : this._internal(
            id: new Guid(map['id']),
            name: (map['name'] != null) ? map['name'] : 'Unknown',
            rssi: map['rssi'],
            nativeDevice: map['nativeDevice'],
            advertisementRecords:
                AdvertisementRecord.listFromBytes(map['advPacket']));

  final Guid id;
  final String name;
  final Object nativeDevice;
  int rssi;
  Future<DeviceState> get state => _methodChannel
      .invokeMethod("getState")
      .then((i) => DeviceState.values[i]);
  final List<AdvertisementRecord> advertisementRecords;

  final Set<IService> services = new Set<IService>();

  final MethodChannel _methodChannel;
  final EventChannel _statusChannel;

  @override
  Stream<DeviceState> stateChanged() {
    return _statusChannel
        .receiveBroadcastStream()
        .map((i) => DeviceState.values[i]);
  }

  @override
  Future<IService> getService(Guid id) {
    return _methodChannel.invokeMethod("getService", id.toString())
        .asStream()
        .map((m) {
          m.putIfAbsent("device", () => this);
          return new Service.fromMap(m);
        })
        .first;
  }

  @override
  Future<Set<IService>> getServices() {
    services.clear();
    return _methodChannel
        .invokeMethod("getServices")
        .then((List<Map<String, Object>> s) {
      for (Map<String, Object> m in s) {
        m.putIfAbsent("device", () => this);
        services.add(new Service.fromMap(m));
      }
      return services;
    });
  }

  @override
  Future<int> requestMtuAsync(int requestValue) {
    // TODO: implement requestMtuAsync
  }

  @override
  Future<bool> updateRssiAsync() {
    // TODO: implement updateRssiAsync
  }

  @override
  Future<bool> createBond() {
    return _methodChannel.invokeMethod("createBond");
  }

  @override
  Future<bool> isBonded() {
    return _methodChannel.invokeMethod("isBonded");
  }

  Map<String, dynamic> toMap() {
    var map = new Map();
    map["id"] = id.toString();
    map["name"] = name;
    map["nativeDevice"] = null;
    map["rssi"] = rssi;
    //map["advertisementRecords"] = advertisementRecords; TODO: Need to serialize this as well
    return map;
  }

  operator ==(other) => other is Device && id.hashCode == other.id.hashCode;

  int get hashCode => id.hashCode;
}
