// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of flutter_blue;

class BluetoothDescriptor {
  static final Uuid CCCD = Uuid.fromString("00002902-0000-1000-8000-00805f9b34fb");

  final Uuid uuid;
  final Uuid serviceUuid; // The service that this descriptor belongs to.
  final BluetoothCharacteristicIdentifier
      characteristicId; // The characteristic that this descriptor belongs to.
  List<int> value;

  BluetoothDescriptor(
      {@required this.uuid,
      @required this.serviceUuid,
      @required this.characteristicId});

  BluetoothDescriptor.fromProto(protos.BluetoothDescriptor p)
      : uuid = Uuid.fromString(p.uuid),
        serviceUuid = Uuid.fromString(p.serviceUuid),
        characteristicId = BluetoothCharacteristicIdentifier.fromProto(p.characteristicId),
        value = p.value;
}
