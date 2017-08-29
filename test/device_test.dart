import 'dart:typed_data';
import 'package:flutter_blue/abstractions/advertisement_record.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/concrete/device.dart';
import 'package:guid/guid.dart';
import 'package:test/test.dart';

main() {
  group('device', (){
    var device = new Device(
        id: new Guid.fromMac("01:02:03:04:05:06"),
        name: "Test Device",
        rssi: 123,);

    var device2 = new Device(
        id: new Guid.fromMac("01:02:03:04:05:06"),
        name: "Test Device",
        rssi: 123,);

    var device3 = new Device(
        id: new Guid.fromMac("02:02:03:04:05:07"),
        name: "Test Device",
        rssi: 123,);

    test('equality', (){
      expect(device, device2);
      expect((device != device3), true);
    });

    test('lists', () {
      List<Device> devices = new List();
      devices.add(device);
      expect(devices.contains(device2), true);
      expect(devices.contains(device3), false);
    });

    test('sets', () {
      Set<Device> devices = new Set();
      devices.add(device);
      expect(devices.contains(device2), true);
      expect(devices.contains(device3), false);
    });

  });
}