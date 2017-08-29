import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/contracts/i_adapter.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/scan_mode.dart';
import 'package:flutter_blue/abstractions/eventargs/device_error_event_args.dart';
import 'package:flutter_blue/abstractions/eventargs/device_event_args.dart';
import 'package:flutter_blue/concrete/device.dart';
import 'package:flutter_blue/eventchannels/scan_results_event_channel.dart';
import 'package:flutter_blue/methodchannels/native_methods.dart';
import 'package:guid/guid.dart';

class Adapter implements IAdapter {
  final MethodChannel _methods =
      new MethodChannel("flutterblue.pauldemarco.com/adapter/methods");
  final EventChannel _discoveredChannel =
      new EventChannel("flutterblue.pauldemarco.com/adapter/deviceDiscovered");
  final EventChannel _connectedChannel =
      new EventChannel("flutterblue.pauldemarco.com/adapter/deviceConnected");

  ScanMode scanMode = ScanMode.lowPower;

  int scanTimeout = 10000;

  final Set<IDevice> devices = new Set<IDevice>();

  Set<IDevice> _connectedDevices = new Set<IDevice>();
  Set<IDevice> get connectedDevices => _connectedDevices;

  Set<IDevice> _discoveredDevices = new Set<IDevice>();
  Set<IDevice> get discoveredDevices => _discoveredDevices;

  Future<bool> get isScanning => _methods.invokeMethod("isScanning");

  void deviceAdvertised(DeviceEventArgs args) {
    // TODO: implement deviceAdvertised
  }

  Stream<IDevice> deviceConnected() {
    return _connectedChannel.receiveBroadcastStream().map((m) {
      var d = new Device.fromMap(m);
      if (devices.contains(d)) {
        d = devices.lookup(d);
      } else {
        devices.add(d);
      }
      return d;
    });
  }

  void deviceConnectionLost(DeviceErrorEventArgs args) {
    // TODO: implement deviceConnectionLost
  }

  void deviceDisconnected(DeviceEventArgs args) {
    // TODO: implement deviceDisconnected
  }

  Stream<IDevice> deviceDiscovered() {
    return _discoveredChannel.receiveBroadcastStream().map((m) {
      var d = new Device.fromMap(m);
      var existing = devices.lookup(d);
      if (existing != null) {
        existing.rssi = d.rssi;
        return existing;
      }
      devices.add(d);
      return d;
    });
  }

  void scanTimeoutElapsed() {
    // TODO: implement scanTimeoutElapsed
  }

  Future connectToDevice(IDevice device) {
    return _methods.invokeMethod("connectToDevice", device.toMap());
  }

  Future<IDevice> connectToKnownDevice(Guid deviceGuid) {
    throw new UnimplementedError('connectToKnownDevice is unimplemented!');
  }

  Future disconnectDevice(IDevice device) {
    return _methods.invokeMethod("disconnectDevice", device.toMap());
  }

  Future<List<IDevice>> getSystemConnectedOrPairedDevices({Set<Guid> services: null}) {
    return _methods.invokeMethod("getSystemConnectedOrPairedDevices")
        .asStream()
        .expand((_) => _)
        .map((d) => new Device.fromMap(d))
        .toList();
  }

  Future startScanningForDevices({Set<Guid> serviceUuids: null}) async {
    _discoveredDevices.clear();
    // TODO: implement service UUID filtering
    bool scanning = await isScanning;
    if (scanning) return new Future.value("Already scanning.");
    await _methods.invokeMethod("startScanningForDevices");
    // Wait the specified duration
    await new Future.delayed(new Duration(milliseconds: scanTimeout));
    return stopScanningForDevices();
  }

  Future stopScanningForDevices() async {
    await _methods.invokeMethod("stopScanningForDevices");
  }
}
