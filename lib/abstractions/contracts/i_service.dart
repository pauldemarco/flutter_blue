import 'dart:async';

import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_device.dart';
import 'package:flutter_blue/utils/guid.dart';

/// A bluetooth LE GATT service.
abstract class IService {
  /// Id of the Service.
  Guid get id;

  /// Name of the service.
  /// Returns the name if the <see cref="Id"/> is a standard Id. See <see cref="KnownServices"/>.
  String get name;

  /// Indicates whether the type of service is primary or secondary.
  bool get isPrimary;

  /// Returns the parent device.
  IDevice get device;

  /// Gets the characteristics of the service.
  /// <returns>A task that represents the asynchronous read operation. The Result property will contain a list of characteristics.</returns>
  Future<List<ICharacteristic>> getCharacteristicsAsync();

  /// Gets the first characteristic with the Id <paramref name="id"/>.
  /// <param name="id">The id of the searched characteristic.</param>
  /// <returns>
  /// A task that represents the asynchronous read operation.
  /// The Result property will contain the characteristic with the specified <paramref name="id"/>.
  /// If the characteristic doesn't exist, the Result will be null.
  /// </returns>
  Future<ICharacteristic> getCharacteristicAsync(Guid id);
}
