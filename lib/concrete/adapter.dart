import 'dart:async';
import 'package:flutter_blue/abstractions/contracts/i_adapter.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/scan_mode.dart';
import 'package:flutter_blue/abstractions/eventargs/device_error_event_args.dart';
import 'package:flutter_blue/abstractions/eventargs/device_event_args.dart';
import 'package:flutter_blue/eventchannels/scan_results_event_channel.dart';
import 'package:flutter_blue/methodchannels/native_methods.dart';
import 'package:flutter_blue/utils/guid.dart';

class Adapter implements IAdapter {

  ScanMode scanMode = ScanMode.lowPower;

  int scanTimeout = 10000;

  // TODO: implement connectedDevices
  List<IDevice> get connectedDevices => null;

  // TODO: implement discoveredDevices
  List<IDevice> get discoveredDevices => null;

  // TODO: implement isScanning
  bool _isScanning = false;
  bool get isScanning => _isScanning;

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

  Stream<DeviceEventArgs> deviceDiscovered() {
    return ScanResultsEventChannel.scanResults()
        .map((d) => new DeviceEventArgs(d));
  }

  void scanTimeoutElapsed() {
    // TODO: implement scanTimeoutElapsed
  }

  Future connectToDeviceAsync(IDevice device) {
    return NativeMethods.connectToDevice(device);
  }

  Future<IDevice> connectToKnownDeviceAsync(Guid deviceGuid) {
    // TODO: implement connectToKnownDeviceAsync
  }

  Future disconnectDeviceAsync(IDevice device) {
    // TODO: implement disconnectDeviceAsync
  }

  List<IDevice> getSystemConnectedOrPairedDevices({Set<Guid> services: null}) {
    // TODO: implement getSystemConnectedOrPairedDevices
  }

  Future startScanningForDevicesAsync({Set<Guid> serviceUuids: null}) async{
    // TODO: implement service UUID filtering
    if(isScanning) return new Future.value("Already scanning.");
    _isScanning = true;
    await NativeMethods.startingScanningForDevices();
    // Wait the specified duration
    await new Future.delayed(new Duration(milliseconds: scanTimeout));
    return stopScanningForDevicesAsync();
  }

  Future stopScanningForDevicesAsync() async{
    await NativeMethods.stopScanningForDevices();
    _isScanning = false;
  }
}