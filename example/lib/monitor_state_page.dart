import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/abstractions/contracts/bluetooth_state.dart';
import 'package:flutter_blue/flutter_blue.dart';

class MonitorStatePage extends StatefulWidget {
  MonitorStatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MonitorStatePageState createState() => new _MonitorStatePageState();
}

class _MonitorStatePageState extends State<MonitorStatePage> {
  FlutterBlue _flutterBlue = new FlutterBlue();
  StreamSubscription _scanSubscription;
  BluetoothState _state;
  BluetoothState _oldState;

  @override
  initState() {
    super.initState();
    _state = BluetoothState.unknown;
    _oldState = BluetoothState.unknown;
    _scanSubscription =
        _flutterBlue.ble.stateChanged().listen((state) {
          setState(() {
            _oldState = state.oldState;
            _state = state.newState;
          });
        });
  }

  @override
  void dispose() {
    _scanSubscription.cancel();
    _scanSubscription = null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Plugin example app'),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.search), 
          onPressed: null),
      body: new Center(
        child: new Text(stringFromState(_oldState) + " " + stringFromState(_state)),
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
