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
  bool _isScanning = false;
  List<Device> _devices;

  @override
  initState() {
    super.initState();
    _devices = new List<Device>();
    _devices.add(new Device(
        id: new Guid.fromMac("01:02:03:04:05:06"),
        name: "Test Device",
        rssi: 123,
    ));
    _scanSubscription = _flutterBlue.ble.adapter
        .deviceDiscovered()
        .listen((device) {
      setState(() {
        var name = device.name;
        var rssi = device.rssi;
        var id = device.id.toString();
        print("Device name: $name rssi: $rssi id: $id");
        if (_devices.contains(device)) {
          _devices[_devices.indexOf(device)] = device;
        } else {
          _devices.add(device);
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
    setState(() {
      _devices.clear();
      _isScanning = true;
    });
    await _flutterBlue.ble.adapter.startScanningForDevices();
    setState(() {
      _isScanning = false;
    });
    //_getDiscoveredDevices();
  }

  _getDiscoveredDevices() {
    Set<IDevice> discovered = _flutterBlue.ble.adapter.discoveredDevices;
    for(IDevice d in discovered) {
      print("${d.id} ${d.name} ${d.rssi}");
    }
  }

  _deviceTapped(Device device) {
    Navigator.pushNamed(context, '/device/${device.id.toString()}');
  }

  _buildLinearProgressIndicator(BuildContext context) {
    if(!_isScanning) {
      return new Container(height: 6.0,);
    }
    return new LinearProgressIndicator(value: null,);
  }

  _buildFloatingActionButton(BuildContext context) {
    if(_isScanning) {
      return null;
    }
    return new FloatingActionButton(
        child: new Icon(Icons.bluetooth_searching),
        onPressed: _searchClicked
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),*/
      floatingActionButton: _buildFloatingActionButton(context),
      body: new Stack(
          children: <Widget>[
            _buildLinearProgressIndicator(context),
            new ListView(children: _createListItemsFromString()),
            ],
      ),
    );
  }

  List<DeviceTile> _createListItemsFromString() {
    return _devices.map((s) => new DeviceTile(s, _deviceTapped)).toList();
  }
}
