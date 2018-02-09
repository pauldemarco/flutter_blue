## 0.2.4
* **Breaking change**. Upgraded to Gradle 4.1 and Android Studio Gradle plugin
  3.0.1. Older Flutter projects need to upgrade their Gradle setup as well in
  order to use this version of the plugin. Instructions can be found
  [here](https://github.com/flutter/flutter/wiki/Updating-Flutter-projects-to-Gradle-4.1-and-Android-Studio-Gradle-plugin-3.0.1).

## 0.2.3
* Bug fixes

## 0.2.2
* BREAKING CHANGES
* `startScan` renamed to `scan`
* `ScanResult` now returns a `BluetoothDevice`
* `connect` now takes a `BluetoothDevice` and returns Stream<BluetoothDeviceState>
* Added parameter `timeout` to `connect`
* Automatic disconnect on deviceConnection.cancel()

## 0.2.1
* BREAKING CHANGE: removed `stopScan` from API, use `scanSubscription.cancel()` instead
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
