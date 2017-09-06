## 0.2.2
* BREAKING CHANGE: `ScanResult` now returns a `BluetoothDevice`

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
