# FlutterBlue
## Bluetooth plugin for flutter

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