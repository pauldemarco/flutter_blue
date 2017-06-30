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

  /// Set to hold all included services
  Set<IService> get includedServices;

  /// Set to hold all characteristics
  Set<ICharacteristic> get characteristics;

  /// Gets the list of included services
  Future<List<IService>> getIncludedServices();

  /// Gets the characteristics of the service.
  Future<List<ICharacteristic>> getCharacteristics();

  /// Gets the first characteristic with the Id <paramref name="id"/>.
  /// <param name="id">The id of the searched characteristic.</param>
  Future<ICharacteristic> getCharacteristic(Guid id);

  /// Serializes to map for use over the platform stream
  Map<String, dynamic> toMap();
}
