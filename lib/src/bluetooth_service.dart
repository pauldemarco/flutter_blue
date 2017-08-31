part of flutter_blue;

class BluetoothService {
  final Guid uuid;
  final DeviceIdentifier deviceId;
  final bool isPrimary;
  final List<BluetoothCharacteristic> characteristics;
  final List<BluetoothService> includedServices;

  BluetoothService(
      {@required this.uuid,
      @required this.deviceId,
      @required this.isPrimary,
      @required this.characteristics,
      @required this.includedServices});

  BluetoothService.fromProto(protos.BluetoothService p)
      : uuid = new Guid(p.uuid),
        deviceId = new DeviceIdentifier(p.remoteId),
        isPrimary = p.isPrimary,
        characteristics = p.characteristics
            .map((c) => new BluetoothCharacteristic.fromProto(c)),
        includedServices =
            p.includedServices.map((s) => new BluetoothService.fromProto(s));
}
