import 'package:guid/guid.dart';

class DeviceConnectionException implements Exception {
  final Guid deviceId;
  final String deviceName;
  const DeviceConnectionException(this.deviceId, this.deviceName);
  String toString() => 'DeviceConnectionException: $deviceId $deviceName';
}