// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() {
  runApp(new FlutterBlueApp());
}

class FlutterBlueApp extends StatefulWidget {
  FlutterBlueApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterBlueAppState createState() => new _FlutterBlueAppState();
}

class _FlutterBlueAppState extends State<FlutterBlueApp> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription _scanSubscription;
  List<ScanResult> scanResults = new List();
  List<BluetoothService> services = new List();
  bool isScanning = false;
  ScanResult activeScanResult;
  BluetoothDevice device;

  @override
  void initState() {
    super.initState();
    _flutterBlue.onStateChanged().listen((s) {
      print('State changed: $s');
    });
  }

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  _startScan() {
    if(_scanSubscription == null) {
      _scanSubscription = _flutterBlue.startScan()
          .listen((scanResult) {
        bool exists = false;
        for(int i=0; i<scanResults.length; i++){
          if(scanResults[i].identifier == scanResult.identifier){
            setState(() {
              scanResults[i] = scanResult;
            });
            exists = true;
          }
        }
        if(!exists){
          setState(() {
            scanResults.add(scanResult);
          });
        }
        print("Device name: ${scanResult.name} rssi: ${scanResult.rssi} id: ${scanResult.identifier}");
      });
      setState(() {
        isScanning = true;
      });
    }
  }

  _stopScan() {
    _flutterBlue.stopScan();
    _scanSubscription?.cancel();
    _scanSubscription = null;
    setState(() {
      isScanning = false;
    });
  }


  _scanResultTapped(ScanResult result) async {
    print('ScanResult tapped: ${result.identifier}');
    activeScanResult = result;
    //Navigator.pushNamed(context, '/device/${device.id.toString()}');
  }

  _connect() async {
    print('Connect clicked!');
    device = await _flutterBlue.connect(new DeviceIdentifier('D4:35:2A:DD:54:C7'), autoConnect: false);
    print('Device connected: ${device.id} ${device.name} ${device.type}');
    services = await device.discoverServices();
    setState(() {});
  }

  _disconnect() async {
    print('Disconnect clicked!');
    await _flutterBlue.cancelConnection(new DeviceIdentifier('D4:35:2A:DD:54:C7'));
  }

  _refresh() async {
    services = await device.services;
    setState((){});
  }

  _readCharacteristic(BluetoothCharacteristic c) async {
    await device.readCharacteristic(c);
    setState(() {});
  }

  _writeCharacteristic(BluetoothCharacteristic c) async {
    await device.writeCharacteristic(c, [0x12, 0x34], type: CharacteristicWriteType.withResponse);
    setState(() {});
  }

  _readDescriptor(BluetoothDescriptor d) async {
    await device.readDescriptor(d);
    setState(() {});
  }

  _writeDescriptor(BluetoothDescriptor d) async {
    await device.writeDescriptor(d, [0x12, 0x34]);
    setState(() {});
  }

  _buildLinearProgressIndicator(BuildContext context) {
    var widget;
    if(isScanning) {
      widget = new LinearProgressIndicator(value: null,);
    } else {
      widget = new Container(height: 6.0,);
    }
    return widget;
  }

  _buildScanningButton(BuildContext context) {
    if(isScanning) {
      return new FloatingActionButton(
          child: new Icon(Icons.stop),
          onPressed: _stopScan
      );
    } else {
      return new FloatingActionButton(
          child: new Icon(Icons.search),
          onPressed: _startScan
      );
    }
  }

  List<Widget> _buildScanResultTiles(BuildContext context) {
    return scanResults.map((s) => new ListTile(
      title: new Text(s.name),
      subtitle: new Text(s.identifier.toString()),
      leading: new Text(s.rssi.toString()),
      onTap: () => _scanResultTapped(s),
    )).toList();
  }

  Widget _buildDescriptorTile(BuildContext context, BluetoothDescriptor d){
    return new ListTile(
      title: new ListTile(
        title: new Text('Descriptor 0x'+d.uuid.toString().toUpperCase().substring(4,8)),
        subtitle: new Text(d.value.toString()),
        trailing: new Row(
          children: <Widget>[
            new IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () => _readDescriptor(d),
            ),
            new IconButton(
              icon: const Icon(Icons.file_upload),
              onPressed: () => _writeDescriptor(d),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCharacteristicTile(BuildContext context, BluetoothCharacteristic c){
    var descriptorTiles = c.descriptors.map((d) => _buildDescriptorTile(context, d)).toList();
    return new ExpansionTile(
      title: new ListTile(
        title: new Text('Characteristic 0x'+c.uuid.toString().toUpperCase().substring(4,8)),
        subtitle: new Text(c.value.toString()),
        trailing: new Row(
          children: <Widget>[
            new IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () => _readCharacteristic(c),
            ),
            new IconButton(
              icon: const Icon(Icons.file_upload),
              onPressed: () => _writeCharacteristic(c),
            )
          ],
        ),
      ),
      children: descriptorTiles,
    );
  }

  Widget _buildServiceTile(BuildContext context, BluetoothService s){
    var characteristicsTiles = s.characteristics.map((c) => _buildCharacteristicTile(context, c)).toList();
    return new ExpansionTile(
      title: new Text('Service 0x'+s.uuid.toString().toUpperCase().substring(4,8)),
      children: characteristicsTiles,
    );
  }

  Widget _buildScanPage(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Scan for devices'),
      ),
      floatingActionButton: _buildScanningButton(context),
      body: new Stack(
        children: <Widget>[
          _buildLinearProgressIndicator(context),
          new ListView(children: _buildScanResultTiles(context)),
        ],
      ),
      persistentFooterButtons: <Widget>[
        new RaisedButton(
          onPressed: () => _connect(),
          child: const Text('CONNECT'),
        ),
        new RaisedButton(
          onPressed: () => _disconnect(),
          child: const Text('DISC'),
        ),
        new RaisedButton(
          onPressed: () => _refresh(),
          child: const Text('REFRESH'),
        )
      ],
    );
  }

  Widget _buildDevicePage(BuildContext context) {
    var serviceTiles = services.map((s) => _buildServiceTile(context, s)).toList();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Device connected'),
      ),
      body: new Stack(
        children: <Widget>[
          _buildLinearProgressIndicator(context),
          new ListView(children: serviceTiles),
        ],
      ),
      persistentFooterButtons: <Widget>[
        new RaisedButton(
          onPressed: () => _connect(),
          child: const Text('CONNECT'),
        ),
        new RaisedButton(
          onPressed: () => _disconnect(),
          child: const Text('DISC'),
        ),
        new RaisedButton(
          onPressed: () => _refresh(),
          child: const Text('REFRESH'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    home: (device == null) ? _buildScanPage(context) : _buildDevicePage(context),
    );
  }
}
