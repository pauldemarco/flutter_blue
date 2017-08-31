import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/concrete/device.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ScanDevicesPage extends StatefulWidget {
  ScanDevicesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScanDevicesPageState createState() => new _ScanDevicesPageState();
}

class _ScanDevicesPageState extends State<ScanDevicesPage> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription _scanSubscription;
  List<ScanResult> scanResults = new List();
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
    List<BluetoothService> services = await device.discoverServices();
  }

  _disconnect() async {
    print('Disconnect clicked!');
    await _flutterBlue.cancelConnection(new DeviceIdentifier('D4:35:2A:DD:54:C7'));
  }

  _readAll() async {
    var services = await device.services;
    for(int i=0;i<100;i++) {
      for (BluetoothService s in services) {
        print('${s.deviceId} Service discovered:: uuid=${s.uuid} isPrimary=${s
            .isPrimary}');
        for (BluetoothCharacteristic c in s.characteristics) {
          print('Reading characteristic ${c.uuid}');
          List<int> value = await device.readCharacteristic(c);
          print('Read: $value');
        }
      }
    }
  }

  _getServices() async {
    var services = await device.services;
    services.forEach((s) => print('${s.deviceId} Service discovered:: uuid=${s.uuid} isPrimary=${s.isPrimary}'));
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

  _buildFloatingActionButton(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Scan for devices'),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
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
          onPressed: () => _readAll(),
          child: const Text('READ'),
        ),
        new RaisedButton(
          onPressed: () => _getServices(),
          child: const Text('SERVICES'),
        )
      ],
    );
  }



}
