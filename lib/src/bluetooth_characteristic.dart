// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of flutter_blue;

class BluetoothCharacteristicIdentifier {
  final Uuid uuid;
  final int instanceId;
  final int _hashCode;

  BluetoothCharacteristicIdentifier(Uuid uuid, int instanceId)
      : uuid = uuid,
        instanceId = instanceId,
        _hashCode = _calcHashCode(uuid, instanceId);

  factory BluetoothCharacteristicIdentifier.fromProto(
          protos.BluetoothCharacteristicIdentifier p) =>
      BluetoothCharacteristicIdentifier(Uuid.fromString(p.uuid), p.instanceId);


  @override
  String toString() {
    return """"[UUID "$uuid", InstanceId "$instanceId"]""";
  }

  protos.BluetoothCharacteristicIdentifier get toProto {
    return protos.BluetoothCharacteristicIdentifier.create()
      ..uuid = this.uuid.toString()
      ..instanceId = this.instanceId
    ;
  }

  static int _calcHashCode(Uuid uuid, int instanceId) {
    final List<int> bytes = List.from(uuid.toList())..add(instanceId);
    const equality = const ListEquality<int>();
    return equality.hash(bytes);
  }

  int get hashCode => _hashCode;

  operator ==(other) =>
      other is BluetoothCharacteristicIdentifier &&
      this.hashCode == other.hashCode;
}

class BluetoothCharacteristic {
  final BluetoothCharacteristicIdentifier id;
  final Uuid serviceUuid; // The service that this characteristic belongs to.
  final Uuid
      secondaryServiceUuid; // The nested service that this characteristic belongs to.
  final CharacteristicProperties properties;
  final List<BluetoothDescriptor> descriptors;
  bool get isNotifying {
    try {
      var cccd =
          descriptors.singleWhere((d) => d.uuid == BluetoothDescriptor.CCCD);
      return ((cccd.value[0] & 0x01) > 0 || (cccd.value[0] & 0x02) > 0);
    } catch (e) {
      return false;
    }
  }

  List<int> value;

  BluetoothCharacteristic(
      {@required this.id,
      @required this.serviceUuid,
      this.secondaryServiceUuid,
      @required this.descriptors,
      @required this.properties});

  BluetoothCharacteristic.fromProto(protos.BluetoothCharacteristic p)
      : id = BluetoothCharacteristicIdentifier.fromProto(p.identifier),
        serviceUuid = Uuid.fromString(p.serviceUuid),
        secondaryServiceUuid = (p.secondaryServiceUuid.length > 0)
            ? Uuid.fromString(p.secondaryServiceUuid)
            : null,
        descriptors = p.descriptors
            .map((d) => new BluetoothDescriptor.fromProto(d))
            .toList(),
        properties = new CharacteristicProperties.fromProto(p.properties),
        value = p.value;

  void updateDescriptors(List<BluetoothDescriptor> newDescriptors) {
    for (var d in descriptors) {
      for (var newD in newDescriptors) {
        if (d.uuid == newD.uuid) {
          d.value = newD.value;
        }
      }
    }
  }
}

enum CharacteristicWriteType { withResponse, withoutResponse }

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

  CharacteristicProperties.fromProto(protos.CharacteristicProperties p)
      : broadcast = p.broadcast,
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
