///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: library_prefixes
library flutterblue_pbjson;

const BluetoothState$json = const {
  '1': 'BluetoothState',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.BluetoothState.State', '10': 'state'},
  ],
  '4': const [BluetoothState_State$json],
};

const BluetoothState_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'UNAVAILABLE', '2': 1},
    const {'1': 'UNAUTHORIZED', '2': 2},
    const {'1': 'TURNING_ON', '2': 3},
    const {'1': 'ON', '2': 4},
    const {'1': 'TURNING_OFF', '2': 5},
    const {'1': 'OFF', '2': 6},
  ],
};

const AdvertisementData$json = const {
  '1': 'AdvertisementData',
  '2': const [
    const {'1': 'local_name', '3': 1, '4': 1, '5': 9, '10': 'localName'},
    const {'1': 'manufacturer_data', '3': 2, '4': 1, '5': 12, '10': 'manufacturerData'},
    const {'1': 'service_data', '3': 3, '4': 3, '5': 11, '6': '.AdvertisementData.ServiceDataEntry', '10': 'serviceData'},
    const {'1': 'tx_power_level', '3': 4, '4': 1, '5': 5, '10': 'txPowerLevel'},
    const {'1': 'connectable', '3': 5, '4': 1, '5': 8, '10': 'connectable'},
  ],
  '3': const [AdvertisementData_ServiceDataEntry$json],
};

const AdvertisementData_ServiceDataEntry$json = const {
  '1': 'ServiceDataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

const ScanSettings$json = const {
  '1': 'ScanSettings',
  '2': const [
    const {'1': 'android_scan_mode', '3': 1, '4': 1, '5': 5, '10': 'androidScanMode'},
    const {'1': 'service_uuids', '3': 2, '4': 3, '5': 9, '10': 'serviceUuids'},
  ],
};

const ScanResult$json = const {
  '1': 'ScanResult',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rssi', '3': 3, '4': 1, '5': 5, '10': 'rssi'},
    const {'1': 'advertisement_data', '3': 4, '4': 1, '5': 11, '6': '.AdvertisementData', '10': 'advertisementData'},
  ],
};

const ConnectOptions$json = const {
  '1': 'ConnectOptions',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'android_auto_connect', '3': 2, '4': 1, '5': 8, '10': 'androidAutoConnect'},
  ],
};

const BluetoothDevice$json = const {
  '1': 'BluetoothDevice',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.BluetoothDevice.Type', '10': 'type'},
  ],
  '4': const [BluetoothDevice_Type$json],
};

const BluetoothDevice_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CLASSIC', '2': 1},
    const {'1': 'LE', '2': 2},
    const {'1': 'DUAL', '2': 3},
  ],
};

const BluetoothService$json = const {
  '1': 'BluetoothService',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'remote_id', '3': 2, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'is_primary', '3': 3, '4': 1, '5': 8, '10': 'isPrimary'},
    const {'1': 'characteristics', '3': 4, '4': 3, '5': 11, '6': '.BluetoothCharacteristic', '10': 'characteristics'},
    const {'1': 'included_services', '3': 5, '4': 3, '5': 11, '6': '.BluetoothService', '10': 'includedServices'},
  ],
};

const BluetoothCharacteristic$json = const {
  '1': 'BluetoothCharacteristic',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'serviceUuid', '3': 2, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'descriptors', '3': 3, '4': 3, '5': 11, '6': '.BluetoothDescriptor', '10': 'descriptors'},
    const {'1': 'properties', '3': 4, '4': 1, '5': 11, '6': '.CharacteristicProperties', '10': 'properties'},
    const {'1': 'is_notifying', '3': 5, '4': 1, '5': 8, '10': 'isNotifying'},
    const {'1': 'value', '3': 6, '4': 1, '5': 12, '10': 'value'},
  ],
};

const BluetoothDescriptor$json = const {
  '1': 'BluetoothDescriptor',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'characteristicUuid', '3': 2, '4': 1, '5': 9, '10': 'characteristicUuid'},
    const {'1': 'value', '3': 3, '4': 1, '5': 12, '10': 'value'},
  ],
};

const CharacteristicProperties$json = const {
  '1': 'CharacteristicProperties',
  '2': const [
    const {'1': 'broadcast', '3': 1, '4': 1, '5': 8, '10': 'broadcast'},
    const {'1': 'read', '3': 2, '4': 1, '5': 8, '10': 'read'},
    const {'1': 'write_without_response', '3': 3, '4': 1, '5': 8, '10': 'writeWithoutResponse'},
    const {'1': 'write', '3': 4, '4': 1, '5': 8, '10': 'write'},
    const {'1': 'notify', '3': 5, '4': 1, '5': 8, '10': 'notify'},
    const {'1': 'indicate', '3': 6, '4': 1, '5': 8, '10': 'indicate'},
    const {'1': 'authenticated_signed_writes', '3': 7, '4': 1, '5': 8, '10': 'authenticatedSignedWrites'},
    const {'1': 'extended_properties', '3': 8, '4': 1, '5': 8, '10': 'extendedProperties'},
    const {'1': 'notify_encryption_required', '3': 9, '4': 1, '5': 8, '10': 'notifyEncryptionRequired'},
    const {'1': 'indicate_encryption_required', '3': 10, '4': 1, '5': 8, '10': 'indicateEncryptionRequired'},
  ],
};

const DiscoverServicesResult$json = const {
  '1': 'DiscoverServicesResult',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'services', '3': 2, '4': 3, '5': 11, '6': '.BluetoothService', '10': 'services'},
  ],
};

const ReadAttributeRequest$json = const {
  '1': 'ReadAttributeRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
  ],
};

const ReadAttributeResponse$json = const {
  '1': 'ReadAttributeResponse',
  '2': const [
    const {'1': 'request', '3': 1, '4': 1, '5': 11, '6': '.ReadAttributeRequest', '10': 'request'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

const WriteCharacteristicRequest$json = const {
  '1': 'WriteCharacteristicRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.WriteCharacteristicRequest.WriteType', '10': 'type'},
    const {'1': 'value', '3': 6, '4': 1, '5': 12, '10': 'value'},
  ],
  '4': const [WriteCharacteristicRequest_WriteType$json],
};

const WriteCharacteristicRequest_WriteType$json = const {
  '1': 'WriteType',
  '2': const [
    const {'1': 'WITH_RESPONSE', '2': 0},
    const {'1': 'WITHOUT_RESPONSE', '2': 1},
  ],
};

const WriteDescriptorRequest$json = const {
  '1': 'WriteDescriptorRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'uuid', '3': 2, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'value', '3': 5, '4': 1, '5': 12, '10': 'value'},
  ],
};
