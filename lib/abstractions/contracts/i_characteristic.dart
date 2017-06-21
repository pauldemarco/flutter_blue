import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_blue/abstractions/characteristic_prop_type.dart';
import 'package:flutter_blue/abstractions/characteristic_write_type.dart';
import 'package:flutter_blue/abstractions/contracts/i_descriptor.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue/abstractions/eventargs/characteristic_updated_args.dart';
import 'package:flutter_blue/utils/guid.dart';

/// A bluetooth LE GATT characteristic.
abstract class ICharacteristic
{
/// Event gets raised, when the davice notifies a value change on this characteristic.
/// To start listening, call <see cref="StartUpdates"/>.
//event EventHandler<CharacteristicUpdatedEventArgs> ValueUpdated;
void valueUpdated(CharacteristicUpdatedEventArgs args);

/// Id of the characteristic.
Guid get id;

/// TODO: review: do we need this in any case?
/// Uuid of the characteristic.
String get uuid;

/// Name of the charakteristic.
/// Returns the name if the <see cref="Id"/> is a id of a standard characteristic.
String get name;

/// Gets the last known value of the characteristic.
Uint8List get value;

/// Gets <see cref="Value"/> as UTF8 encoded string representation.
String get stringValue;

/// Properties of the characteristic.
CharacteristicPropertyType get properties;

/// Specifies how the <see cref="WriteAsync"/> function writes the value.
CharacteristicWriteType writeType;

/// Indicates wheter the characteristic can be read or not.
bool get canRead;

/// Indicates wheter the characteristic can be written or not.
bool get canWrite;

/// Indicates wheter the characteristic supports notify or not.
bool get canUpdate;

/// Returns the parent service. Use this to access the device.
IService get service;

/// Reads the characteristic value from the device. The result is also stored inisde the Value property.
/// <returns>A task that represents the asynchronous read operation. The Result property will contain the read bytes.</returns>
/// <exception cref="InvalidOperationException">Thrown if characteristic doesn't support read. See: <see cref="CanRead"/></exception>
/// <exception cref="CharacteristicReadException">Thrown if the reading of the value failed.</exception>
Future<Uint8List> readAsync();

/// Sends <paramref name="data"/> as characteristic value to the device.
/// <param name="data">Data that should be written.</param>
/// <returns>
/// A task that represents the asynchronous read operation. The Task will finish after the value was written. The Result property will be <c>true</c> if the value
/// was written successful, otherwise <c>false</c>.
/// If the characteristic is write with response, the Task will finish if the value has been written.
/// If it is write without response, the task will immediately finish with <c>true</c>.
/// </returns>
/// <exception cref="InvalidOperationException">Thrown if characteristic doesn't support write. See: <see cref="CanWrite"/></exception>
/// <exception cref="ArgumentNullException">Thrwon if <paramref name="data"/> is null.</exception>
Future<bool> writeAsync(Uint8List data);

/// Starts listening for notify events on this characteristic.
/// <exception cref="InvalidOperationException">Thrown if characteristic doesn't support notify. See: <see cref="CanUpdate"/></exception>
/// <exception cref="Exception">Thrown if an error occurs while starting notifications </exception>
Future startUpdatesAsync();

/// Stops listening for notify events on this characteristic.
/// <exception cref="Exception">Thrown if an error occurs while starting notifications </exception>
Future stopUpdatesAsync();

/// Gets the descriptors of the characteristic.
/// <returns>A task that represents the asynchronous read operation. The Result property will contain a list of descriptors.</returns>
Future<List<IDescriptor>> getDescriptorsAsync();

/// Gets the first descriptor with the Id <paramref name="id"/>.
/// <param name="id">The id of the searched descriptor.</param>
/// <returns>
/// A task that represents the asynchronous read operation.
/// The Result property will contain the descriptor with the specified <paramref name="id"/>.
/// If the descriptor doesn't exist, the Result will be null.
/// </returns>
Future<IDescriptor> getDescriptorAsync(Guid id);


}