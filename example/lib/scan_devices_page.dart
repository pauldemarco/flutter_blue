import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/concrete/device.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue/utils/guid.dart';

import 'device_tile.dart';

class ScanDevicesPage extends StatefulWidget {
  ScanDevicesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScanDevicesPageState createState() => new _ScanDevicesPageState();
}

class _ScanDevicesPageState extends State<ScanDevicesPage> {
  FlutterBlue _flutterBlue = new FlutterBlue();
  StreamSubscription _scanSubscription;
  List<Device> devices;

  @override
  initState() {
    super.initState();
    devices = new List<Device>();
    devices.add(new Device(
        id: new Guid.fromMac("01:02:03:04:05:06"),
        name: "Test Device",
        rssi: 123,
        state: DeviceState.disconnected));
    _scanSubscription = _flutterBlue.ble.adapter
        .deviceDiscovered()
        .listen((device) {
      setState(() {
        var name = device.name;
        var rssi = device.rssi;
        var id = device.id.toString();
        print("Device name: $name rssi: $rssi id: $id");
        if (devices.contains(device)) {
          devices[devices.indexOf(device)] = device;
        } else {
          devices.add(device);
        }
      });
    });
  }

  @override
  void dispose() {
    _scanSubscription.cancel();
    _scanSubscription = null;
  }

  _searchClicked() async {
    await _flutterBlue.ble.adapter.startScanningForDevices();
    _getDiscoveredDevices();
  }

  _getDiscoveredDevices() {
    List<IDevice> discovered = _flutterBlue.ble.adapter.discoveredDevices;
    for(IDevice d in discovered) {
      print("${d.id} ${d.name} ${d.rssi}");
    }
  }

  _deviceTapped(Device device) {
    _flutterBlue.ble.adapter.connectToDevice(device);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.search), onPressed: _searchClicked),
      body: new ListView(children: _createListItemsFromString()),
    );
  }

  List<DeviceTile> _createListItemsFromString() {
    return devices.map((s) => new DeviceTile(s, _deviceTapped)).toList();
  }
}
