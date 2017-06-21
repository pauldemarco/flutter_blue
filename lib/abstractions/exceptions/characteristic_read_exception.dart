class CharacteristicReadException implements Exception {
  final String msg;
  const CharacteristicReadException(this.msg);
  String toString() => 'CharacteristicReadException: $msg';
}