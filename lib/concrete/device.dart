import 'dart:async';

import 'dart:typed_data';
import 'package:flutter_blue/abstractions/advertisement_record.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/utils/guid.dart';

class Device implements IDevice {

  // We must use a Guid since the Mac address is not exposed on iOS
  final Guid id;
  final String name;
  final Object nativeDevice;
  final int rssi;
  final DeviceState state;
  final List<AdvertisementRecord> advertisementRecords;

  Device({this.advertisementRecords, this.id, this.name, this.nativeDevice, this.rssi, this.state});

  Device.fromMap(map)
      : id = new Guid(map['id']),
        name = (map['name'] != null) ? map['name'] : 'Unknown',
        rssi = map['rssi'],
        nativeDevice = map['nativeDevice'],
        state = DeviceState.values[map['state']],
        advertisementRecords = AdvertisementRecord.listFromBytes(map['advPacket']) {
  }

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
  Future<IService> getServiceAsync(Guid id) {
    // TODO: implement getServiceAsync
  }

  @override
  Future<List<IService>> getServicesAsync() {
    // TODO: implement getServicesAsync
  }

  @override
  Future<int> requestMtuAsync(int requestValue) {
    // TODO: implement requestMtuAsync
  }

  @override
  Future<bool> updateRssiAsync() {
    // TODO: implement updateRssiAsync
  }

  bool operator ==(o) {
   if(o is! Device) return false;
   return this.id == o.id;
  }

}