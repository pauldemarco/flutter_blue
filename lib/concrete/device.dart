import 'dart:async';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/advertisement_record.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/utils/guid.dart';

class Device implements IDevice {

  final Guid id;
  final String name;
  final Object nativeDevice;
  final int rssi;
  final DeviceState state;
  final List<AdvertisementRecord> advertisementRecords;

  final MethodChannel _methodChannel;
  final EventChannel _statusChannel;

  Device._internal({this.advertisementRecords, this.id, this.name, this.nativeDevice, this.rssi, this.state})
        : _methodChannel = new MethodChannel("flutterblue.pauldemarco.com/device/${id.toString()}/methods"),
          _statusChannel = new EventChannel("flutterblue.pauldemarco.com/device/${id.toString()}/status");

  Device({id, name, nativeDevice, rssi, state, advertisementRecords})
      : this._internal(
      id: id,
      name: name,
      rssi: rssi,
      nativeDevice: nativeDevice,
      state: state,
      advertisementRecords: advertisementRecords
  );

  Device.fromMap(map)
      : this._internal(
          id: new Guid(map['id']),
          name: (map['name'] != null) ? map['name'] : 'Unknown',
          rssi: map['rssi'],
          nativeDevice: map['nativeDevice'],
          state: DeviceState.values[map['state']],
          advertisementRecords: AdvertisementRecord.listFromBytes(map['advPacket'])
      );

  Map<String, dynamic> toMap() {
    var map = new Map();
    map["id"] = id.toString();
    map["name"] = name;
    map["nativeDevice"] = null;
    map["rssi"] = rssi;
    map["state"] = state.index;
    //map["advertisementRecords"] = advertisementRecords; TODO: Need to serialize this as well
    return map;
  }

  @override
  Stream<DeviceState> stateChanged() {
    return _statusChannel.receiveBroadcastStream()
        .map((i) => DeviceState.values[i]);
  }

  @override
  Future<IService> getService(Guid id) {
    return _methodChannel.invokeMethod("getService", id.toString());
  }

  @override
  Future<List<IService>> getServices() {
    return _methodChannel.invokeMethod("getServices");
  }

  @override
  Future<int> requestMtuAsync(int requestValue) {
    // TODO: implement requestMtuAsync
  }

  @override
  Future<bool> updateRssiAsync() {
    // TODO: implement updateRssiAsync
  }

  operator ==(other) =>
      other is Device && id.hashCode == other.id.hashCode;

  int get hashCode => id.hashCode;
}