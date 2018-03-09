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

  /// Scanning
  StreamSubscription _scanSubscription;
  Map<DeviceIdentifier, ScanResult> scanResults = new Map();
  bool isScanning = false;

  /// State
  StreamSubscription _stateSubscription;
  BluetoothState state = BluetoothState.unknown;

  /// Device
  BluetoothDevice device;
  bool get isConnected => (device != null);
  StreamSubscription deviceConnection;
  StreamSubscription deviceStateSubscription;
  List<BluetoothService> services = new List();
  Map<Guid, StreamSubscription> valueChangedSubscriptions;
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
    deviceConnection?.cancel();
    deviceConnection = null;
    super.dispose();
  }

  _startScan() {
    _scanSubscription = _flutterBlue
        .scan(timeout: const Duration(seconds: 5))
        .listen((scanResult) {
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
    deviceConnection = _flutterBlue
        .connect(device, timeout: const Duration(seconds: 4))
        .listen(
          null,
          onDone: _disconnect,
        );

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
    deviceConnection?.cancel();
    deviceConnection = null;
    setState(() {
      device = null;
    });
  }

  _readCharacteristic(BluetoothCharacteristic c) async {
    await device.readCharacteristic(c);
    setState(() {});
  }

  _writeCharacteristic(BluetoothCharacteristic c) async {
    await device.writeCharacteristic(c, [0x12, 0x34],
        type: CharacteristicWriteType.withResponse);
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

  _setNotification(BluetoothCharacteristic c) async {
    if (c.isNotifying) {
      await device.setNotifyValue(c, false);
      // Cancel subscription
      valueChangedSubscriptions[c.uuid]?.cancel();
      valueChangedSubscriptions.remove(c.uuid);
    } else {
      await device.setNotifyValue(c, true);
      final sub = device.onValueChanged(c).listen((d) {
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
      return new FloatingActionButton(
        child: new Icon(Icons.stop),
        onPressed: _stopScan,
        backgroundColor: Colors.red,
      );
    } else {
      return new FloatingActionButton(
          child: new Icon(Icons.search), onPressed: _startScan);
    }
  }

  _buildScanResultTiles() {
    return scanResults.values
        .map((s) => new ListTile(
              title: new Text(s.device.name),
              subtitle: new Text(s.device.id.toString()),
              leading: new Text(s.rssi.toString()),
              onTap: () => _connect(s.device),
            ))
        .toList();
  }

  _buildDescriptorTile(BluetoothDescriptor d) {
    var title = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Descriptor'),
        new Text('0x${d.uuid.toString().toUpperCase().substring(4, 8)}',
            style: Theme
                .of(context)
                .textTheme
                .body1
                .copyWith(color: Theme.of(context).textTheme.caption.color))
      ],
    );
    return new ListTile(
      title: new ListTile(
        title: title,
        subtitle: new Text(d.value.toString()),
        trailing: new Row(
          children: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.file_download,
                color: Theme.of(context).iconTheme.color.withOpacity(0.5),
              ),
              onPressed: () => _readDescriptor(d),
            ),
            new IconButton(
              icon: new Icon(
                Icons.file_upload,
                color: Theme.of(context).iconTheme.color.withOpacity(0.5),
              ),
              onPressed: () => _writeDescriptor(d),
            )
          ],
        ),
      ),
    );
  }

  _buildCharacteristicTile(BluetoothCharacteristic c) {
    var descriptorTiles =
        c.descriptors.map((d) => _buildDescriptorTile(d)).toList();
    var actions = new Row(
      children: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.file_download,
            color: Theme.of(context).iconTheme.color.withOpacity(0.5),
          ),
          onPressed: () => _readCharacteristic(c),
        ),
        new IconButton(
          icon: new Icon(Icons.file_upload,
              color: Theme.of(context).iconTheme.color.withOpacity(0.5)),
          onPressed: () => _writeCharacteristic(c),
        ),
        new IconButton(
          icon: new Icon(c.isNotifying ? Icons.sync_disabled : Icons.sync,
              color: Theme.of(context).iconTheme.color.withOpacity(0.5)),
          onPressed: () => _setNotification(c),
        )
      ],
    );

    var title = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Characteristic'),
        new Text('0x${c.uuid.toString().toUpperCase().substring(4, 8)}',
            style: Theme
                .of(context)
                .textTheme
                .body1
                .copyWith(color: Theme.of(context).textTheme.caption.color))
      ],
    );

    if (descriptorTiles.length > 0) {
      return new ExpansionTile(
        title: new ListTile(
          title: title,
          subtitle: new Text(c.value.toString()),
        ),
        trailing: actions,
        children: descriptorTiles,
      );
    } else {
      return new ListTile(
        title: title,
        subtitle: new Text(c.value.toString()),
        trailing: actions,
      );
    }
  }

  _buildServiceTile(BluetoothService s) {
    var characteristicsTiles = s.characteristics
        .map((c) => _buildCharacteristicTile(c))
        .toList();
    if (characteristicsTiles.length > 0) {
      return new ExpansionTile(
        title: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Service'),
            new Text('0x${s.uuid.toString().toUpperCase().substring(4, 8)}',
                style: Theme
                    .of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Theme.of(context).textTheme.caption.color))
          ],
        ),
        children: characteristicsTiles,
      );
    } else {
      return new ListTile(
        title: const Text('Service'),
        subtitle:
            new Text('0x${s.uuid.toString().toUpperCase().substring(4, 8)}'),
      );
    }
  }

  _buildServiceTiles() {
    return services.map((s) => _buildServiceTile(s)).toList();
  }

  _buildActionButtons() {
    if (isConnected) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () => _disconnect(),
        )
      ];
    }
  }

  _buildAlertTile() {
    return new Container(
      color: Colors.redAccent,
      child: new ListTile(
        title: new Text(
          'Bluetooth is not turned on!',
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        trailing: new Icon(
          Icons.error,
          color: Theme.of(context).primaryTextTheme.subhead.color,
        ),
      ),
    );
  }

  _buildDeviceStateTile() {
    return new ListTile(
        leading: (deviceState == BluetoothDeviceState.connected)
            ? const Icon(Icons.bluetooth_connected)
            : const Icon(Icons.bluetooth_disabled),
        title: new Text('Device is ${deviceState.toString().split('.')[1]}.'),
        subtitle: new Text('${device.id}'),
        trailing: new IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => _refreshDeviceState(device),
          color: Theme.of(context).iconTheme.color.withOpacity(0.5),
        ));
  }

  _buildProgressBarTile() {
    return new LinearProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var tiles = new List();
    if (state != BluetoothState.on) {
      tiles.add(_buildAlertTile());
    }
    if (isConnected) {
      tiles.add(_buildDeviceStateTile());
      tiles.addAll(_buildServiceTiles());
    } else {
      tiles.addAll(_buildScanResultTiles());
    }
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('FlutterBlue'),
          actions: _buildActionButtons(),
        ),
        floatingActionButton: _buildScanningButton(),
        body: new Stack(
          children: <Widget>[
            (isScanning) ? _buildProgressBarTile() : new Container(),
            new ListView(
              children: tiles,
            )
          ],
        ),
      ),
    );
  }
}
