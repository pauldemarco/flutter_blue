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
  List<BluetoothService> services = new List();
  StreamSubscription<List<int>> valueChangedSubscription;
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
    super.dispose();
  }

  _startScan() {
    _scanSubscription = _flutterBlue
        .startScan(timeout: const Duration(seconds: 5))
        .listen((scanResult) {
      setState(() {
        scanResults[scanResult.identifier] = scanResult;
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

  _connect(ScanResult r) async {
    // Connect to device
    BluetoothDevice d = await _flutterBlue.connect(r.identifier);
    setState(() {
      device = d;
    });

    // Discover the services
    List<BluetoothService> s = await device.discoverServices();
    setState(() {
      services = s;
    });

    // Update the connection state
    var state = await device.state;
    setState(() {
      deviceState = state;
    });

    // Subscribe to connection changes
    device.onStateChanged().listen((s) {
      setState(() {
        deviceState = s;
      });
    });
  }

  _disconnect() async {
    await _flutterBlue.cancelConnection(device.id);
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
    } else {
      await device.setNotifyValue(c, true);
      valueChangedSubscription = device.onValueChanged(c).listen((d) {
        setState(() {
          print('onValueChanged $d');
        });
      });
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

  _buildScanningButton(BuildContext context) {
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

  _buildScanResultTiles(BuildContext context) {
    return scanResults.values
        .map((s) => new ListTile(
              title: new Text(s.name),
              subtitle: new Text(s.identifier.toString()),
              leading: new Text(s.rssi.toString()),
              onTap: () => _connect(s),
            ))
        .toList();
  }

  _buildDescriptorTile(BuildContext context, BluetoothDescriptor d) {
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

  _buildCharacteristicTile(BuildContext context, BluetoothCharacteristic c) {
    var descriptorTiles =
        c.descriptors.map((d) => _buildDescriptorTile(context, d)).toList();
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
          trailing: actions,
        ),
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

  _buildServiceTile(BuildContext context, BluetoothService s) {
    var characteristicsTiles = s.characteristics
        .map((c) => _buildCharacteristicTile(context, c))
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

  _buildServiceTiles(BuildContext context) {
    return services.map((s) => _buildServiceTile(context, s)).toList();
  }

  _buildActionButtons(BuildContext context) {
    if (isConnected) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () => _disconnect(),
        )
      ];
    }
  }

  _buildAlertTile(BuildContext context) {
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

  _buildDeviceStateTile(BuildContext context) {
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

  _buildProgressBarTile(BuildContext context) {
    return new LinearProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var tiles = new List();
    if (state != BluetoothState.on) {
      tiles.add(_buildAlertTile(context));
    }
    if (isConnected) {
      tiles.add(_buildDeviceStateTile(context));
      tiles.addAll(_buildServiceTiles(context));
    } else {
      tiles.addAll(_buildScanResultTiles(context));
    }
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('FlutterBlue'),
          actions: _buildActionButtons(context),
        ),
        floatingActionButton: _buildScanningButton(context),
        body: new Stack(
          children: <Widget>[
            (isScanning) ? _buildProgressBarTile(context) : new Container(),
            new ListView(
              children: tiles,
            )
          ],
        ),
      ),
    );
  }
}
