import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DevicePage extends StatefulWidget {

  final IDevice device;

  DevicePage({this.device});

  @override
  State<StatefulWidget> createState() => new _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {

  final FlutterBlue _flutterBlue = new FlutterBlue();
  IDevice _device;
  DeviceState _deviceState;

  StreamSubscription _stateSubscription;

  @override
  void initState() {
    super.initState();
    _device = widget.device;
    _device.state.then((s) {
      setState((){
        _deviceState = s;
      });
    });
    _stateSubscription = _device.stateChanged()
      .listen((s) {
        setState((){
          _deviceState = s;
        });
      });
  }


  @override
  void dispose() {
    _stateSubscription?.cancel();
    _stateSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(_device.name)
        ),
        body: new SingleChildScrollView(
            child: new Container(
                margin: const EdgeInsets.all(20.0),
                child: new Card(
                    child: new Text(
                        _deviceState.toString()
                    )
                )
            )
        ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.bluetooth_connected),
          onPressed: _connect
      ),
    );
  }

  _connect() async {
    String result = await _flutterBlue.ble.adapter.connectToDevice(_device);
    print(result);
  }

}