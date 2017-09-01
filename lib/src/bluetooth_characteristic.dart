// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of flutter_blue;

class BluetoothCharacteristic {
  final Guid uuid;
  final Guid serviceUuid; // The service that this characteristic belongs to.
  final List<BluetoothDescriptor> descriptors;
  final CharacteristicProperties properties;
  bool isNotifying = false;
  List<int> value;

  BluetoothCharacteristic(
      {@required this.uuid,
      @required this.serviceUuid,
      @required this.descriptors,
      @required this.properties});

  BluetoothCharacteristic.fromProto(protos.BluetoothCharacteristic p) :
      uuid = new Guid(p.uuid),
      serviceUuid = new Guid(p.serviceUuid),
      descriptors = p.descriptors.map((d) => new BluetoothDescriptor.fromProto(d)).toList(),
      properties = new CharacteristicProperties.fromProto(p.properties);
}

class CharacteristicProperties {
  final bool broadcast;
  final bool read;
  final bool writeWithoutResponse;
  final bool write;
  final bool notify;
  final bool indicate;
  final bool authenticatedSignedWrites;
  final bool extendedProperties;
  final bool notifyEncryptionRequired;
  final bool indicateEncryptionRequired;

  CharacteristicProperties(
      {this.broadcast = false,
      this.read = false,
      this.writeWithoutResponse = false,
      this.write = false,
      this.notify = false,
      this.indicate = false,
      this.authenticatedSignedWrites = false,
      this.extendedProperties = false,
      this.notifyEncryptionRequired = false,
      this.indicateEncryptionRequired = false});

  CharacteristicProperties.fromProto(protos.CharacteristicProperties p) :
        broadcast = p.broadcast,
        read = p.read,
        writeWithoutResponse = p.writeWithoutResponse,
        write = p.write,
        notify = p.notify,
        indicate = p.indicate,
        authenticatedSignedWrites = p.authenticatedSignedWrites,
        extendedProperties = p.extendedProperties,
        notifyEncryptionRequired = p.notifyEncryptionRequired,
        indicateEncryptionRequired = p.indicateEncryptionRequired;
}
