import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class MonitorStatePage extends StatefulWidget {
  MonitorStatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MonitorStatePageState createState() => new _MonitorStatePageState();
}

class _MonitorStatePageState extends State<MonitorStatePage> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription _scanSubscription;
  BluetoothState _state;

  @override
  initState() {
    super.initState();
    _state = BluetoothState.unknown;
    _scanSubscription =
        _flutterBlue.onStateChanged().listen((state) {
          setState(() {
            _state = state;
          });
        });
  }

  @override
  void dispose() {
    if(_scanSubscription != null) {
      _scanSubscription.cancel();
      _scanSubscription = null;
    }
  }

  _getState() async {
    BluetoothState state = await _flutterBlue.state;
    setState(() {
      _state = state;
    });
  }

  _isAvailable() async {
    bool available = await _flutterBlue.isAvailable;
    print(available);
  }

  _isOn() async {
    bool on = await _flutterBlue.isOn;
    print(on);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.search), 
          onPressed: _isOn),
      body: new Center(
        child: new Text(stringFromState(_state)),
      ),
    );
  }
  
  String stringFromState(BluetoothState state){
    switch(state){
      case BluetoothState.unknown:
        return "unknown";
        break;
      case BluetoothState.unavailable:
        return "unavailable";
        break;
      case BluetoothState.unauthorized:
        return "unauthorized";
        break;
      case BluetoothState.turningOff:
        return "turningOff";
        break;
      case BluetoothState.off:
        return "off";
        break;
      case BluetoothState.turningOn:
        return "turningOn";
        break;
      case BluetoothState.on:
        return "on";
        break;
    }
    return "unknown";
  }
}
