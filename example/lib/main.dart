// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_example/widgets.dart';

void main() {
  runApp(FlutterBlueApp());
}

class FlutterBlueApp extends StatefulWidget {
  FlutterBlueApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterBlueAppState createState() => _FlutterBlueAppState();
}

class _FlutterBlueAppState extends State<FlutterBlueApp> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;

  /// Scanning
  StreamSubscription _scanSubscription;
  Map<DeviceIdentifier, ScanResult> scanResults = Map();
  bool isScanning = false;

  /// State
  StreamSubscription _stateSubscription;
  BluetoothState state = BluetoothState.unknown;

  /// Device
  BluetoothDevice device;
  bool get isConnected => (device != null);
  StreamSubscription deviceStateSubscription;
  List<BluetoothService> services = List();
  Map<Guid, StreamSubscription> valueChangedSubscriptions = {};
  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  @override
  void initState() {
    super.initState();
    // Immediately get the state of FlutterBlue
    _flutterBlue.state.then((s) {
      setState(() {
        state = s;
      });
    });
    // Subscribe to state changes
    _stateSubscription = _flutterBlue.onStateChanged().listen((s) {
      setState(() {
        state = s;
      });
    });
  }

  @override
  void dispose() {
    _stateSubscription?.cancel();
    _stateSubscription = null;
    _scanSubscription?.cancel();
    _scanSubscription = null;
    device?.disconnect();
    device = null;
    super.dispose();
  }

  _startScan() {
    _scanSubscription = _flutterBlue
        .scan(
      timeout: Duration(seconds: 5),
      /*withServices: [
          Guid('0000180F-0000-1000-8000-00805F9B34FB')
        ]*/
    )
        .listen((scanResult) {
      print('localName: ${scanResult.advertisementData.localName}');
      print(
          'manufacturerData: ${scanResult.advertisementData.manufacturerData}');
      print('serviceData: ${scanResult.advertisementData.serviceData}');
      setState(() {
        scanResults[scanResult.device.id] = scanResult;
      });
    }, onDone: _stopScan);

    setState(() {
      isScanning = true;
    });
  }

  _stopScan() {
    _scanSubscription?.cancel();
    _scanSubscription = null;
    setState(() {
      isScanning = false;
    });
  }

  _connect(BluetoothDevice d) async {
    device = d;
    // Connect to device
    device.connect(timeout: Duration(seconds: 4));

    // Update the connection state immediately
    device.state.then((s) {
      setState(() {
        deviceState = s;
      });
    });

    // Subscribe to connection changes
    deviceStateSubscription = device.onStateChanged().listen((s) {
      setState(() {
        deviceState = s;
      });
      if (s == BluetoothDeviceState.connected) {
        device.discoverServices().then((s) {
          setState(() {
            services = s;
          });
        });
      }
    });
  }

  _disconnect() {
    // Remove all value changed listeners
    valueChangedSubscriptions.forEach((uuid, sub) => sub.cancel());
    valueChangedSubscriptions.clear();
    deviceStateSubscription?.cancel();
    deviceStateSubscription = null;
    device?.disconnect();
    device = null;
    setState(() {
      device = null;
    });
  }

  _readCharacteristic(BluetoothCharacteristic c) async {
    await c.read();
    setState(() {});
  }

  _writeCharacteristic(BluetoothCharacteristic c) async {
    await c.write([0x12, 0x34], type: CharacteristicWriteType.withResponse);
    setState(() {});
  }

  _readDescriptor(BluetoothDescriptor d) async {
    await d.read();
    setState(() {});
  }

  _writeDescriptor(BluetoothDescriptor d) async {
    await d.write([0x12, 0x34]);
    setState(() {});
  }

  _setNotification(BluetoothCharacteristic c) async {
    if (c.isNotifying) {
      await c.setNotifyValue(false);
      // Cancel subscription
      valueChangedSubscriptions[c.uuid]?.cancel();
      valueChangedSubscriptions.remove(c.uuid);
    } else {
      await c.setNotifyValue(true);
      // ignore: cancel_subscriptions
      final sub = c.onValueChanged().listen((d) {
        setState(() {
          print('onValueChanged $d');
        });
      });
      // Add to map
      valueChangedSubscriptions[c.uuid] = sub;
    }
    setState(() {});
  }

  _refreshDeviceState(BluetoothDevice d) async {
    var state = await d.state;
    setState(() {
      deviceState = state;
      print('State refreshed: $deviceState');
    });
  }

  _buildScanningButton() {
    if (isConnected || state != BluetoothState.on) {
      return null;
    }
    if (isScanning) {
      return FloatingActionButton(
        child: Icon(Icons.stop),
        onPressed: _stopScan,
        backgroundColor: Colors.red,
      );
    } else {
      return FloatingActionButton(
          child: Icon(Icons.search), onPressed: _startScan);
    }
  }

  _buildScanResultTiles() {
    return scanResults.values
        .map((r) => ScanResultTile(
              result: r,
              onTap: () => _connect(r.device),
            ))
        .toList();
  }

  List<Widget> _buildServiceTiles() {
    return services
        .map(
          (s) => ServiceTile(
                service: s,
                characteristicTiles: s.characteristics
                    .map(
                      (c) => CharacteristicTile(
                            characteristic: c,
                            onReadPressed: () => _readCharacteristic(c),
                            onWritePressed: () => _writeCharacteristic(c),
                            onNotificationPressed: () => _setNotification(c),
                            descriptorTiles: c.descriptors
                                .map(
                                  (d) => DescriptorTile(
                                        descriptor: d,
                                        onReadPressed: () => _readDescriptor(d),
                                        onWritePressed: () =>
                                            _writeDescriptor(d),
                                      ),
                                )
                                .toList(),
                          ),
                    )
                    .toList(),
              ),
        )
        .toList();
  }

  _buildActionButtons() {
    if (isConnected) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () => _disconnect(),
        )
      ];
    }
  }

  _buildAlertTile() {
    return Container(
      color: Colors.redAccent,
      child: ListTile(
        title: Text(
          'Bluetooth adapter is ${state.toString().substring(15)}',
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        trailing: Icon(
          Icons.error,
          color: Theme.of(context).primaryTextTheme.subhead.color,
        ),
      ),
    );
  }

  _buildDeviceStateTile() {
    return ListTile(
        leading: (deviceState == BluetoothDeviceState.connected)
            ? Icon(Icons.bluetooth_connected)
            : Icon(Icons.bluetooth_disabled),
        title: Text('Device is ${deviceState.toString().split('.')[1]}.'),
        subtitle: Text('${device.id}'),
        trailing: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () => _refreshDeviceState(device),
          color: Theme.of(context).iconTheme.color.withOpacity(0.5),
        ));
  }

  _buildProgressBarTile() {
    return LinearProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var tiles = List<Widget>();
    if (state != BluetoothState.on) {
      tiles.add(_buildAlertTile());
    }
    if (isConnected) {
      tiles.add(_buildDeviceStateTile());
      tiles.addAll(_buildServiceTiles());
    } else {
      tiles.addAll(_buildScanResultTiles());
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlutterBlue'),
          actions: _buildActionButtons(),
        ),
        floatingActionButton: _buildScanningButton(),
        body: Stack(
          children: <Widget>[
            (isScanning) ? _buildProgressBarTile() : Container(),
            ListView(
              children: tiles,
            )
          ],
        ),
      ),
    );
  }
}
