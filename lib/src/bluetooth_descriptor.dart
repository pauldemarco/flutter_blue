// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of flutter_blue;

class BluetoothDescriptor {
  static final Guid CCCD = new Guid("00002902-0000-1000-8000-00805f9b34fb");

  final Guid uuid;
  final DeviceIdentifier deviceId;
  final Guid serviceUuid; // The service that this descriptor belongs to.
  final Guid
      characteristicUuid; // The characteristic that this descriptor belongs to.
  List<int> value;

  BluetoothDescriptor.fromProto(protos.BluetoothDescriptor p)
      : uuid = new Guid(p.uuid),
        deviceId = new DeviceIdentifier(p.remoteId),
        serviceUuid = new Guid(p.serviceUuid),
        characteristicUuid = new Guid(p.characteristicUuid),
        value = p.value;
}
