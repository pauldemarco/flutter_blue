import 'dart:async';

import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/abstractions/contracts/scan_mode.dart';
import 'package:flutter_blue/abstractions/eventargs/device_error_event_args.dart';
import 'package:flutter_blue/abstractions/eventargs/device_event_args.dart';
import 'package:guid/guid.dart';

/// The bluetooth LE Adapter.
abstract class IAdapter {

  /// Occurs when the adapter receives an advertisement.
  //event EventHandler<DeviceEventArgs> DeviceAdvertised;
  void deviceAdvertised(DeviceEventArgs args);

  /// Occurs when the adapter receives an advertisement for the first time of the current scan run.
  /// This means once per every <see cref="StartScanningForDevicesAsync(Guid[], Func&lt;IDevice, bool&gt;, CancellationToken)"/> call.
  //event EventHandler<DeviceEventArgs> DeviceDiscovered;
  //Stream<DeviceEventArgs> deviceDiscovered();
  Stream<IDevice> deviceDiscovered();

  /// Occurs when a device has been connected.
  //event EventHandler<DeviceEventArgs> DeviceConnected;
  //void deviceConnected(DeviceEventArgs args);
  Stream<IDevice> deviceConnected();

  /// Occurs when a device has been disconnected. This occurs on intentional disconnects after <see cref="DisconnectDeviceAsync"/>.
  //event EventHandler<DeviceEventArgs> DeviceDisconnected;
  void deviceDisconnected(DeviceEventArgs args);

  /// Occurs when a device has been disconnected. This occurs on unintentional disconnects (e.g. when the device exploded).
  //event EventHandler<DeviceErrorEventArgs> DeviceConnectionLost;
  void deviceConnectionLost(DeviceErrorEventArgs args);

  /// Occurs when the scan has been stopped due the timeout after <see cref="ScanTimeout"/> ms.
  //event EventHandler ScanTimeoutElapsed;
  void scanTimeoutElapsed();

  /// Indicates, if the adapter is scanning for devices.
  Future<bool> get isScanning;

  /// Timeout for Ble scanning. Default is 10000.
  int scanTimeout;

  /// Specifies the scanning mode. Must be set before calling StartScanningForDevicesAsync().
  /// Changing it while scanning, will have no change the current scan behavior.
  /// Default: <see cref="ScanMode.LowPower"/>
  ScanMode scanMode;

  /// List of all devices, whether connected or not.
  Set<IDevice> get devices;

  /// List of last discovered devices.
  Set<IDevice> get discoveredDevices;

  /// List of currently connected devices.
  Set<IDevice> get connectedDevices;

  /// Starts scanning for BLE devices that fulfill the <paramref name="deviceFilter"/>.
  /// DeviceDiscovered will only be called, if <paramref name="deviceFilter"/> returns <c>true</c> for the discovered device.
  /// <param name="serviceUuids">Requested service Ids. The default is null.</param>
  /// <param name="deviceFilter">Function that filters the devices. The default is a function that returns true.</param>
  /// <param name="allowDuplicatesKey"> iOS only: If true, filtering is disabled and a discovery event is generated each time the central receives an advertising packet from the peripheral.
  /// Disabling this filtering can have an adverse effect on battery life and should be used only if necessary.
  /// If false, multiple discoveries of the same peripheral are coalesced into a single discovery event.
  /// If the key is not specified, the default value is false.
  /// For android, key is ignored.</param>
  /// <param name="cancellationToken">The token to monitor for cancellation requests. The default value is None.</param>
  /// <returns>A task that represents the asynchronous read operation. The Task will finish after the scan has ended.</returns>
  // TODO Implement Missing Parameters: Future startScanningForDevicesAsync({Set<Guid> serviceUuids = null, Function<IDevice, bool> deviceFilter = null, bool allowDuplicatesKey = false, CancellationToken cancellationToken = default(CancellationToken)});
  Future startScanningForDevices({Set<Guid> serviceUuids = null});

  /// Stops scanning for BLE devices.
  /// <returns>A task that represents the asynchronous read operation. The Task will finish after the scan has ended.</returns>
  Future stopScanningForDevices();

  /// Connects to the <paramref name="device"/>.
  /// <param name="device">Device to connect to.</param>
  /// <param name="connectParameters">Connection parameters. Contains platform specific parameters needed to achieved connection. The default value is None.</param>
  /// <param name="cancellationToken">The token to monitor for cancellation requests. The default value is None.</param>
  /// <returns>A task that represents the asynchronous read operation. The Task will finish after the device has been connected successfuly.</returns>
  /// <exception cref="DeviceConnectionException">Thrown if the device connection fails.</exception>
  /// <exception cref="ArgumentNullException">Thrown if the <paramref name="device"/> is null.</exception>
  // TODO Implement Missing Parameters: Future connectToDeviceAsync(IDevice device, ConnectParameters connectParameters = default(ConnectParameters), CancellationToken cancellationToken = default(CancellationToken));
  Future connectToDevice(IDevice device);

  /// Disconnects from the <paramref name="device"/>.
  /// <param name="device">Device to connect from.</param>
  /// <returns>A task that represents the asynchronous read operation. The Task will finish after the device has been disconnected successfuly.</returns>
  Future disconnectDevice(IDevice device);

  /// Connects to a device whith a known GUID wihtout scanning and if in range. Does not scan for devices.
  /// <param name="deviceGuid"></param>
  /// <param name="connectParameters">Connection parameters. Contains platform specific parameters needed to achieved connection. The default value is None.</param>
  /// <param name="cancellationToken">The token to monitor for cancellation requests. The default value is None.</param>
  /// <returns></returns>
  // TODO Implement Missing Parameters: Future<IDevice> connectToKnownDeviceAsync(Guid deviceGuid, ConnectParameters connectParameters = default(ConnectParameters), CancellationToken cancellationToken = default(CancellationToken));
  Future<IDevice> connectToKnownDevice(Guid deviceGuid);

  /// Returns all BLE devices connected to the system. For android the implementations uses getConnectedDevices(GATT) & getBondedDevices()
  /// and for ios the implementation uses get retrieveConnectedPeripherals(services)
  /// https://developer.apple.com/reference/corebluetooth/cbcentralmanager/1518924-retrieveconnectedperipherals
  ///
  /// For android this function merges the functionality of thw following API calls:
  /// https://developer.android.com/reference/android/bluetooth/BluetoothManager.html#getConnectedDevices(int)
  /// https://developer.android.com/reference/android/bluetooth/BluetoothAdapter.html#getBondedDevices()
  /// In order to use the device in the app you have to first call ConnectAsync.
  /// <param name="services">IMPORTANT: Only considered by iOS due to platform limitations. Filters devices by advertised services. SET THIS VALUE FOR ANY RESULTS</param>
  /// <returns>List of IDevices connected to the OS.  In case of no devices the list is empty.</returns>
  Future<List<IDevice>> getSystemConnectedOrPairedDevices({Set<Guid> services = null});

}