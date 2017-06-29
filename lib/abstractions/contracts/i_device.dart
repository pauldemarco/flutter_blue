import 'dart:async';

import 'package:flutter_blue/abstractions/advertisement_record.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/utils/guid.dart';

/// A bluetooth LE device.
abstract class IDevice {
  /// Id of the device. (MAC Address converted to 128 bit uuid)
  Guid get id;

  /// Advertised Name of the Device.
  String get name;

  /// Last known rssi value in decibals.
  /// Can be updated via <see cref="UpdateRssiAsync()"/>.
  int rssi;

  /// Gets the native device object reference. Should be cast to the
  /// appropriate type on each platform.
  /// <value>The native device.</value>
  Object get nativeDevice;

  /// State of the device.
  Future<DeviceState> get state;

  /// All the advertisment records
  /// For example:
  /// - Advertised Service UUIDS
  /// - Manufacturer Specifc data
  /// - ...
  List<AdvertisementRecord> get advertisementRecords;

  /// Stream of connection state changes for device
  Stream<DeviceState> stateChanged();

  /// Gets all services of the device.
  /// <returns>A task that represents the asynchronous read operation. The Result property will contain a list of all available services.</returns>
  Future<List<IService>> getServices();

  /// Gets the first service with the Id <paramref name="id"/>.
  /// <param name="id">The id of the searched service.</param>
  /// <returns>
  /// A task that represents the asynchronous read operation.
  /// The Result property will contain the service with the specified <paramref name="id"/>.
  /// If the service doesn't exist, the Result will be null.
  /// </returns>
  Future<IService> getService(Guid id);

  /// Updates the rssi value.
  ///
  /// Important:
  /// On Android: This function will only work if the device is connected. The Rssi value will be determined once on the discovery of the device.
  /// <returns>
  /// A task that represents the asynchronous read operation. The Result property will contain a boolean that inticates if the update was successful.
  /// The Task will finish after Rssi has been updated.
  /// </returns>
  Future<bool> updateRssiAsync();

  /// Requests a MTU update and fires an "Exchange MTU Request" on the ble stack. Be aware that the resulting MTU value will be negotiated between master and slave using your requested value for the negotiation.
  ///
  /// Important:
  /// On Android: This function will only work with API level 21 and higher. Other API level will get an default value as function result.
  /// On iOS: Requesting MTU sizes is not supported by iOS. The function will return the current negotiated MTU between master / slave.
  /// <returns>
  /// A task that represents the asynchronous operation. The result contains the negotiated MTU size between master and slave</returns>
  /// <param name="requestValue">The requested MTU</param>
  Future<int> requestMtuAsync(int requestValue);

  /// Serializes the map for use over the platform stream
  Map<String, dynamic> toMap();

}
