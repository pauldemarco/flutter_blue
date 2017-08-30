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

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _scanSubscription = null;
  }

  _startScan() {
    if(_scanSubscription == null) {
      _scanSubscription = _flutterBlue.startScan()
          .listen((scanResult) {
        setState(() {
          var name = scanResult.name;
          var rssi = scanResult.rssi;
          var id = scanResult.identifier.toMac();
          print("Device name: $name rssi: $rssi id: $id");
        });
      });
      setState((){});
    }
  }

  _stopScan() async {
    _flutterBlue.stopScan();
    _scanSubscription?.cancel();
    _scanSubscription = null;
    setState((){});
  }


  _deviceTapped(Device device) {
    Navigator.pushNamed(context, '/device/${device.id.toString()}');
  }

  _buildLinearProgressIndicator(BuildContext context) {
    if(_scanSubscription == null) {
      return new Container(height: 6.0,);
    }
    return new LinearProgressIndicator(value: null,);
  }

  _buildFloatingActionButton(BuildContext context) {
    if(_scanSubscription != null) {
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
            new ListView(children: <Widget>[const Text('Hello')]),
            ],
      ),
    );
  }

}
