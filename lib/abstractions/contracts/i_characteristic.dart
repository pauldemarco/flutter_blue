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
Stream<Uint8List> valueUpdated();

/// Id of the characteristic.
Guid get id;

/// Name of the charakteristic.
/// Returns the name if the <see cref="Id"/> is a id of a standard characteristic.
String get name;

/// Gets the last known value of the characteristic.
Uint8List get value;

/// Gets <see cref="Value"/> as UTF8 encoded string representation.
String get stringValue;

/// Specifies how the <see cref="WriteAsync"/> function writes the value.
CharacteristicWriteType get writeType;

/// Raw value of properties
int get properties;

/// Properties of the characteristic.
bool get canBroadcast;
bool get canRead;
bool get canWriteWithoutResponse;
bool get canWrite;
bool get canNotify;
bool get canIndicate;
bool get canAuthenticatedSignedWrites;
bool get hasExtendedProperties;
bool get isNotifyEncryptionRequired;
bool get isIndicateEncryptionRequired;

/// Returns the parent service. Use this to access the device.
IService get service;

/// Returns whether the characteristic is currently notifying
bool get isUpdating;

/// Reads the characteristic value from the device. The result is also stored inisde the Value property.
/// <returns>A task that represents the asynchronous read operation. The Result property will contain the read bytes.</returns>
/// <exception cref="InvalidOperationException">Thrown if characteristic doesn't support read. See: <see cref="CanRead"/></exception>
/// <exception cref="CharacteristicReadException">Thrown if the reading of the value failed.</exception>
Future<Uint8List> read();

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
Future<bool> write(Uint8List data);

/// Starts listening for notify events on this characteristic.
/// <exception cref="InvalidOperationException">Thrown if characteristic doesn't support notify. See: <see cref="CanUpdate"/></exception>
/// <exception cref="Exception">Thrown if an error occurs while starting notifications </exception>
Future startUpdates();

/// Stops listening for notify events on this characteristic.
/// <exception cref="Exception">Thrown if an error occurs while starting notifications </exception>
Future stopUpdates();

/// Gets the descriptors of the characteristic.
/// <returns>A task that represents the asynchronous read operation. The Result property will contain a list of descriptors.</returns>
Future<List<IDescriptor>> getDescriptors();

/// Gets the first descriptor with the Id <paramref name="id"/>.
/// <param name="id">The id of the searched descriptor.</param>
/// <returns>
/// A task that represents the asynchronous read operation.
/// The Result property will contain the descriptor with the specified <paramref name="id"/>.
/// If the descriptor doesn't exist, the Result will be null.
/// </returns>
Future<IDescriptor> getDescriptor(Guid id);

/// Serializes to map for use over the platform stream
Map<String, dynamic> toMap();

}