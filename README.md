<p align="center">
<img alt="FlutterBlue" src="site/flutterblue.png" />
</p>


## Introduction

FlutterBlue is a bluetooth plugin for [Flutter](http://www.flutter.io), a new mobile SDK to help developers build modern apps for iOS and Android.

## Cross-Platform Bluetooth LE
FlutterBlue aims to offer the most from both platforms (iOS and Android).

Using the FlutterBlue instance, you can scan for and connect to nearby devices ([BluetoothDevice](lib/src/bluetooth_device.dart)). Once connected to a device, the BluetoothDevice object can discover services ([BluetoothService](lib/src/bluetooth_service.dart)), characteristics ([BluetoothCharacteristic](lib/src/bluetooth_characteristic.dart)), and descriptors ([BluetoothDescriptor](lib/src/bluetooth_descriptor.dart)).  The BluetoothDevice can then be used to interact directly with characteristics and descriptors.

### FlutterBlue API
|                  |      Android       |         iOS          |             Description            |
| :--------------- | :----------------: | :------------------: |  :-------------------------------: |
| startScan        | :white_check_mark: | :white_large_square: | Starts a scan for Bluetooth Low Energy devices. |
| stopScan         | :white_check_mark: | :white_large_square: | Stops a scan for Bluetooth Low Energy devices. |
| connect          | :white_check_mark: | :white_large_square: | Establishes a connection to the Bluetooth Device. |
| cancelConnection | :white_check_mark: | :white_large_square: | Cancels a connection to the Bluetooth Device. |
| state            | :white_check_mark: | :white_large_square: | Gets the current state of the Bluetooth Adapter. |
| onStateChanged   | :white_check_mark: | :white_large_square: | Stream of state changes for the Bluetooth Adapter. |

### BluetoothDevice API
|                             |       Android        |         iOS          |             Description            |
| :-------------------------- | :------------------: | :------------------: |  :-------------------------------: |
| discoverServices            |  :white_check_mark:  | :white_large_square: | Discovers services offered by the remote device as well as their characteristics and descriptors. |
| services                    |  :white_check_mark:  | :white_large_square: | Gets a list of services. Requires that discoverServices() has completed. |
| readCharacteristic          |  :white_check_mark:  | :white_large_square: | Retrieves the value of a specified characteristic.  |
| readDescriptor              |  :white_check_mark:  | :white_large_square: | Retrieves the value of a specified descriptor.  |
| writeCharacteristic         |  :white_check_mark:  | :white_large_square: | Writes the value of a characteristic. |
| writeDescriptor             |  :white_check_mark:  | :white_large_square: | Writes the value of a descriptor. |
| setNotifyValue              | :white_large_square: | :white_large_square: | Sets notifications or indications for the value of a specified characteristic. |
| canSendWriteWithoutResponse | :white_large_square: | :white_large_square: | Indicates whether the Bluetooth Device can send a write without response. |
| state                       | :white_large_square: | :white_large_square: | Gets the current state of the Bluetooth Device. |
| onStateChanged              | :white_large_square: | :white_large_square: | Stream of state changes for the Bluetooth Device. |