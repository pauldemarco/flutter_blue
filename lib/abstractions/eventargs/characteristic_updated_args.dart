import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';

class CharacteristicUpdatedEventArgs {
  final ICharacteristic characteristic;

  const CharacteristicUpdatedEventArgs(this.characteristic);
}
