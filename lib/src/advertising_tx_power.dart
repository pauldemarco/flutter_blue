
part of flutter_blue;

class AdvertisingTxPower {
  int value;
  AdvertisingTxPower._internal(this.value);

  factory AdvertisingTxPower.txPowerHigh() {
    return AdvertisingTxPowerHigh();
  }

  factory AdvertisingTxPower.txPowerLow() {
    return AdvertisingTxPowerLow();
  }

  factory AdvertisingTxPower.txPowerMedium() {
    return AdvertisingTxPowerMedium();
  }

  factory AdvertisingTxPower.txPowerUltraLow() {
    return AdvertisingTxPowerUltraLow();
  }
}

class AdvertisingTxPowerHigh extends AdvertisingTxPower {
  AdvertisingTxPowerHigh() : super._internal(3);
}

class AdvertisingTxPowerLow extends AdvertisingTxPower {
  AdvertisingTxPowerLow() : super._internal(1);
}

class AdvertisingTxPowerMedium extends AdvertisingTxPower {
  AdvertisingTxPowerMedium() : super._internal(2);
}

class AdvertisingTxPowerUltraLow extends AdvertisingTxPower {
  AdvertisingTxPowerUltraLow() : super._internal(0);
}