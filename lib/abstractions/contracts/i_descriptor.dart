import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/utils/guid.dart';

/// A descriptor for a GATT characteristic.
abstract class IDescriptor {
  /// Id of the descriptor.
  Guid get id;

  /// Name of the descriptor.
  /// Returns the name if the <see cref="Id"/> is a standard Id. See <see cref="KnownDescriptors"/>.
  String get name;

  /// The stored value of the descriptor. Call ReadAsync to update / write async to set it.
  Uint8List get value;

  /// Returns the parent characteristic
  ICharacteristic get characteristic;

  /// Reads the characteristic value from the device. The result is also stored inisde the Value property.
  /// <returns>A task that represents the asynchronous read operation. The Result property will contain the read bytes.</returns>
  /// <exception cref="InvalidOperationException">Thrown if characteristic doesn't support read. See: <see cref="CanRead"/></exception>
  /// <exception cref="Exception">Thrown if the reading of the value failed.</exception>
  Future<Uint8List> readAsync();

  /// Sends <paramref name="data"/> as characteristic value to the device.
  /// <param name="data">Data that should be written.</param>
  /// <exception cref="ArgumentNullException">Thrwon if <paramref name="data"/> is null.</exception>
  /// <exception cref="Exception">Thrwon if writing of the value failed.</exception>
  Future writeAsync(Uint8List data);
}
