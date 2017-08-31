part of flutter_blue;

class BluetoothDescriptor {
  final Guid uuid;
  final Guid characteristicUuid; // The characteristic that this descriptor belongs to.
  Uint8List value;

  BluetoothDescriptor({@required this.uuid, @required this.characteristicUuid});

  BluetoothDescriptor.fromProto(protos.BluetoothDescriptor p) :
      uuid = new Guid(p.uuid),
      characteristicUuid = new Guid(p.characteristicUuid);
}