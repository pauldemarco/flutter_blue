
part of flutter_blue;

class AdvertisingMode {
  int value;
  AdvertisingMode._internal(this.value);

  factory AdvertisingMode.balanced() {
    return AdvertisingModeBalanced();
  }

  factory AdvertisingMode.lowLatency() {
    return AdvertisingModeLowLatency();
  }

  factory AdvertisingMode.lowPower() {
    return AdvertisingModeLowPower();
  }
}

class AdvertisingModeBalanced extends AdvertisingMode {
  AdvertisingModeBalanced() : super._internal(1);
}

class AdvertisingModeLowLatency extends AdvertisingMode {
  AdvertisingModeLowLatency() : super._internal(2);
}

class AdvertisingModeLowPower extends AdvertisingMode {
  AdvertisingModeLowPower() : super._internal(0);
}
