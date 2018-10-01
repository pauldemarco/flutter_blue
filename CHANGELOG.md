## 0.4.0
* **Breaking change**. Manufacturer Data is now a `Map` of manufacturer ID's.
* Service UUID's, service data, tx power level packets fixed in advertising data.
* Example app updated to show advertising data.
* Various other bug fixes.

## 0.3.4
* Updated to use the latest protobuf (^0.9.0+1)
* Updated other dependencies

## 0.3.3
* `scan` `withServices` to filter by service UUID's (iOS)
* Error handled when trying to scan with adapter off (Android)

## 0.3.2
* Runtime permissions for Android
* `scan` `withServices` to filter by service UUID's (Android)
* Scan mode can be specified (Android)
* Now targets the latest android SDK
* Dart 2 compatibility

## 0.3.1
* Now allows simultaneous notifications of characteristics
* Fixed bug on iOS that was returning `discoverServices` too early

## 0.3.0
* iOS support added
* Bug fixed in example causing discoverServices to be called multiple times
* Various other bug fixes

## 0.2.4
* **Breaking change**. Upgraded to Gradle 4.1 and Android Studio Gradle plugin
  3.0.1. Older Flutter projects need to upgrade their Gradle setup as well in
  order to use this version of the plugin. Instructions can be found
  [here](https://github.com/flutter/flutter/wiki/Updating-Flutter-projects-to-Gradle-4.1-and-Android-Studio-Gradle-plugin-3.0.1).

## 0.2.3
* Bug fixes

## 0.2.2
* **Breaking changes**:
* `startScan` renamed to `scan`
* `ScanResult` now returns a `BluetoothDevice`
* `connect` now takes a `BluetoothDevice` and returns Stream<BluetoothDeviceState>
* Added parameter `timeout` to `connect`
* Automatic disconnect on deviceConnection.cancel()

## 0.2.1
* **Breaking change**. Removed `stopScan` from API, use `scanSubscription.cancel()` instead
* Automatically stops scan when `startScan` subscription is canceled (thanks to @brianegan)
* Added `timeout` parameter to `startScan`
* Updated example app to show new scan functionality

## 0.2.0

* Added state and onStateChanged for BluetoothDevice
* Updated example to show new functionality

## 0.1.1

* Fixed image for pub.dartlang.org

## 0.1.0

* Characteristic notifications/indications.
* Merged in Guid library, removed from pubspec.yaml.

## 0.0.1 - September 1st, 2017

* Initial Release.