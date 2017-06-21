import 'package:flutter_blue/utils/guid.dart';

class KnownCharacteristic {
  final String name;
  final Guid id;

  const KnownCharacteristic(this.name, this.id);
}