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
import 'package:flutter_blue/utils/guid.dart';

class Adapter implements IAdapter {

  final MethodChannel _methods = new MethodChannel("flutterblue.pauldemarco.com/adapter");
  final EventChannel _scanChannel = new EventChannel("flutterblue.pauldemarco.com/adapter/scanResults");

  ScanMode scanMode = ScanMode.lowPower;

  int scanTimeout = 10000;

  // TODO: implement connectedDevices
  List<IDevice> get connectedDevices => null;

  List<IDevice> _discoveredDevices = new List<IDevice>();
  List<IDevice> get discoveredDevices => _discoveredDevices;

  Future<bool> get isScanning =>
      _methods.invokeMethod("isScanning");

  void deviceAdvertised(DeviceEventArgs args) {
    // TODO: implement deviceAdvertised
  }

  void deviceConnected(DeviceEventArgs args) {
    // TODO: implement deviceConnected
  }

  void deviceConnectionLost(DeviceErrorEventArgs args) {
    // TODO: implement deviceConnectionLost
  }

  void deviceDisconnected(DeviceEventArgs args) {
    // TODO: implement deviceDisconnected
  }

  Stream<IDevice> deviceDiscovered() {
    return _scanChannel.receiveBroadcastStream()
        .map((m) {
          var d = new Device.fromMap(m);
          if(_discoveredDevices.contains(d)) {
            _discoveredDevices.remove(d);
          }
          _discoveredDevices.add(d);
          return d;
        }
    );
  }

  void scanTimeoutElapsed() {
    // TODO: implement scanTimeoutElapsed
  }

  Future connectToDevice(IDevice device) {
    return _methods.invokeMethod("connectToDevice", device.toMap());
  }

  Future<IDevice> connectToKnownDevice(Guid deviceGuid) {
    // TODO: implement connectToKnownDeviceAsync
  }

  Future disconnectDevice(IDevice device) {
    // TODO: implement disconnectDeviceAsync
  }

  List<IDevice> getSystemConnectedOrPairedDevices({Set<Guid> services: null}) {
    // TODO: implement getSystemConnectedOrPairedDevices
  }

  Future startScanningForDevices({Set<Guid> serviceUuids: null}) async{
    _discoveredDevices.clear();
    // TODO: implement service UUID filtering
    bool scanning = await isScanning;
    if(scanning) return new Future.value("Already scanning.");
    await _methods.invokeMethod("startScanningForDevices");
    // Wait the specified duration
    await new Future.delayed(new Duration(milliseconds: scanTimeout));
    return stopScanningForDevices();
  }

  Future stopScanningForDevices() async{
    await _methods.invokeMethod("stopScanningForDevices");
  }
}