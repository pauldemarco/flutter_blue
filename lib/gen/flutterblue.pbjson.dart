///
//  Generated code. Do not modify.
//  source: flutterblue.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use int32ValueDescriptor instead')
const Int32Value$json = const {
  '1': 'Int32Value',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `Int32Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List int32ValueDescriptor = $convert.base64Decode('CgpJbnQzMlZhbHVlEhQKBXZhbHVlGAEgASgFUgV2YWx1ZQ==');
@$core.Deprecated('Use bluetoothStateDescriptor instead')
const BluetoothState$json = const {
  '1': 'BluetoothState',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.BluetoothState.State', '10': 'state'},
  ],
  '4': const [BluetoothState_State$json],
};

@$core.Deprecated('Use bluetoothStateDescriptor instead')
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

/// Descriptor for `BluetoothState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bluetoothStateDescriptor = $convert.base64Decode('Cg5CbHVldG9vdGhTdGF0ZRIrCgVzdGF0ZRgBIAEoDjIVLkJsdWV0b290aFN0YXRlLlN0YXRlUgVzdGF0ZSJpCgVTdGF0ZRILCgdVTktOT1dOEAASDwoLVU5BVkFJTEFCTEUQARIQCgxVTkFVVEhPUklaRUQQAhIOCgpUVVJOSU5HX09OEAMSBgoCT04QBBIPCgtUVVJOSU5HX09GRhAFEgcKA09GRhAG');
@$core.Deprecated('Use advertisementDataDescriptor instead')
const AdvertisementData$json = const {
  '1': 'AdvertisementData',
  '2': const [
    const {'1': 'local_name', '3': 1, '4': 1, '5': 9, '10': 'localName'},
    const {'1': 'tx_power_level', '3': 2, '4': 1, '5': 11, '6': '.Int32Value', '10': 'txPowerLevel'},
    const {'1': 'connectable', '3': 3, '4': 1, '5': 8, '10': 'connectable'},
    const {'1': 'manufacturer_data', '3': 4, '4': 3, '5': 11, '6': '.AdvertisementData.ManufacturerDataEntry', '10': 'manufacturerData'},
    const {'1': 'service_data', '3': 5, '4': 3, '5': 11, '6': '.AdvertisementData.ServiceDataEntry', '10': 'serviceData'},
    const {'1': 'service_uuids', '3': 6, '4': 3, '5': 9, '10': 'serviceUuids'},
  ],
  '3': const [AdvertisementData_ManufacturerDataEntry$json, AdvertisementData_ServiceDataEntry$json],
};

@$core.Deprecated('Use advertisementDataDescriptor instead')
const AdvertisementData_ManufacturerDataEntry$json = const {
  '1': 'ManufacturerDataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use advertisementDataDescriptor instead')
const AdvertisementData_ServiceDataEntry$json = const {
  '1': 'ServiceDataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `AdvertisementData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List advertisementDataDescriptor = $convert.base64Decode('ChFBZHZlcnRpc2VtZW50RGF0YRIdCgpsb2NhbF9uYW1lGAEgASgJUglsb2NhbE5hbWUSMQoOdHhfcG93ZXJfbGV2ZWwYAiABKAsyCy5JbnQzMlZhbHVlUgx0eFBvd2VyTGV2ZWwSIAoLY29ubmVjdGFibGUYAyABKAhSC2Nvbm5lY3RhYmxlElUKEW1hbnVmYWN0dXJlcl9kYXRhGAQgAygLMiguQWR2ZXJ0aXNlbWVudERhdGEuTWFudWZhY3R1cmVyRGF0YUVudHJ5UhBtYW51ZmFjdHVyZXJEYXRhEkYKDHNlcnZpY2VfZGF0YRgFIAMoCzIjLkFkdmVydGlzZW1lbnREYXRhLlNlcnZpY2VEYXRhRW50cnlSC3NlcnZpY2VEYXRhEiMKDXNlcnZpY2VfdXVpZHMYBiADKAlSDHNlcnZpY2VVdWlkcxpDChVNYW51ZmFjdHVyZXJEYXRhRW50cnkSEAoDa2V5GAEgASgFUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVlOgI4ARo+ChBTZXJ2aWNlRGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgMUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use scanSettingsDescriptor instead')
const ScanSettings$json = const {
  '1': 'ScanSettings',
  '2': const [
    const {'1': 'android_scan_mode', '3': 1, '4': 1, '5': 5, '10': 'androidScanMode'},
    const {'1': 'service_uuids', '3': 2, '4': 3, '5': 9, '10': 'serviceUuids'},
    const {'1': 'allow_duplicates', '3': 3, '4': 1, '5': 8, '10': 'allowDuplicates'},
  ],
};

/// Descriptor for `ScanSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scanSettingsDescriptor = $convert.base64Decode('CgxTY2FuU2V0dGluZ3MSKgoRYW5kcm9pZF9zY2FuX21vZGUYASABKAVSD2FuZHJvaWRTY2FuTW9kZRIjCg1zZXJ2aWNlX3V1aWRzGAIgAygJUgxzZXJ2aWNlVXVpZHMSKQoQYWxsb3dfZHVwbGljYXRlcxgDIAEoCFIPYWxsb3dEdXBsaWNhdGVz');
@$core.Deprecated('Use scanResultDescriptor instead')
const ScanResult$json = const {
  '1': 'ScanResult',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.BluetoothDevice', '10': 'device'},
    const {'1': 'advertisement_data', '3': 2, '4': 1, '5': 11, '6': '.AdvertisementData', '10': 'advertisementData'},
    const {'1': 'rssi', '3': 3, '4': 1, '5': 5, '10': 'rssi'},
  ],
};

/// Descriptor for `ScanResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scanResultDescriptor = $convert.base64Decode('CgpTY2FuUmVzdWx0EigKBmRldmljZRgBIAEoCzIQLkJsdWV0b290aERldmljZVIGZGV2aWNlEkEKEmFkdmVydGlzZW1lbnRfZGF0YRgCIAEoCzISLkFkdmVydGlzZW1lbnREYXRhUhFhZHZlcnRpc2VtZW50RGF0YRISCgRyc3NpGAMgASgFUgRyc3Np');
@$core.Deprecated('Use connectRequestDescriptor instead')
const ConnectRequest$json = const {
  '1': 'ConnectRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'android_auto_connect', '3': 2, '4': 1, '5': 8, '10': 'androidAutoConnect'},
  ],
};

/// Descriptor for `ConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectRequestDescriptor = $convert.base64Decode('Cg5Db25uZWN0UmVxdWVzdBIbCglyZW1vdGVfaWQYASABKAlSCHJlbW90ZUlkEjAKFGFuZHJvaWRfYXV0b19jb25uZWN0GAIgASgIUhJhbmRyb2lkQXV0b0Nvbm5lY3Q=');
@$core.Deprecated('Use bluetoothDeviceDescriptor instead')
const BluetoothDevice$json = const {
  '1': 'BluetoothDevice',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.BluetoothDevice.Type', '10': 'type'},
  ],
  '4': const [BluetoothDevice_Type$json],
};

@$core.Deprecated('Use bluetoothDeviceDescriptor instead')
const BluetoothDevice_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CLASSIC', '2': 1},
    const {'1': 'LE', '2': 2},
    const {'1': 'DUAL', '2': 3},
  ],
};

/// Descriptor for `BluetoothDevice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bluetoothDeviceDescriptor = $convert.base64Decode('Cg9CbHVldG9vdGhEZXZpY2USGwoJcmVtb3RlX2lkGAEgASgJUghyZW1vdGVJZBISCgRuYW1lGAIgASgJUgRuYW1lEikKBHR5cGUYAyABKA4yFS5CbHVldG9vdGhEZXZpY2UuVHlwZVIEdHlwZSIyCgRUeXBlEgsKB1VOS05PV04QABILCgdDTEFTU0lDEAESBgoCTEUQAhIICgREVUFMEAM=');
@$core.Deprecated('Use bluetoothServiceDescriptor instead')
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

/// Descriptor for `BluetoothService`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bluetoothServiceDescriptor = $convert.base64Decode('ChBCbHVldG9vdGhTZXJ2aWNlEhIKBHV1aWQYASABKAlSBHV1aWQSGwoJcmVtb3RlX2lkGAIgASgJUghyZW1vdGVJZBIdCgppc19wcmltYXJ5GAMgASgIUglpc1ByaW1hcnkSQgoPY2hhcmFjdGVyaXN0aWNzGAQgAygLMhguQmx1ZXRvb3RoQ2hhcmFjdGVyaXN0aWNSD2NoYXJhY3RlcmlzdGljcxI+ChFpbmNsdWRlZF9zZXJ2aWNlcxgFIAMoCzIRLkJsdWV0b290aFNlcnZpY2VSEGluY2x1ZGVkU2VydmljZXM=');
@$core.Deprecated('Use bluetoothCharacteristicDescriptor instead')
const BluetoothCharacteristic$json = const {
  '1': 'BluetoothCharacteristic',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'remote_id', '3': 2, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'serviceUuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondaryServiceUuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'descriptors', '3': 5, '4': 3, '5': 11, '6': '.BluetoothDescriptor', '10': 'descriptors'},
    const {'1': 'properties', '3': 6, '4': 1, '5': 11, '6': '.CharacteristicProperties', '10': 'properties'},
    const {'1': 'value', '3': 7, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `BluetoothCharacteristic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bluetoothCharacteristicDescriptor = $convert.base64Decode('ChdCbHVldG9vdGhDaGFyYWN0ZXJpc3RpYxISCgR1dWlkGAEgASgJUgR1dWlkEhsKCXJlbW90ZV9pZBgCIAEoCVIIcmVtb3RlSWQSIAoLc2VydmljZVV1aWQYAyABKAlSC3NlcnZpY2VVdWlkEjIKFHNlY29uZGFyeVNlcnZpY2VVdWlkGAQgASgJUhRzZWNvbmRhcnlTZXJ2aWNlVXVpZBI2CgtkZXNjcmlwdG9ycxgFIAMoCzIULkJsdWV0b290aERlc2NyaXB0b3JSC2Rlc2NyaXB0b3JzEjkKCnByb3BlcnRpZXMYBiABKAsyGS5DaGFyYWN0ZXJpc3RpY1Byb3BlcnRpZXNSCnByb3BlcnRpZXMSFAoFdmFsdWUYByABKAxSBXZhbHVl');
@$core.Deprecated('Use bluetoothDescriptorDescriptor instead')
const BluetoothDescriptor$json = const {
  '1': 'BluetoothDescriptor',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'remote_id', '3': 2, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'serviceUuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'characteristicUuid', '3': 4, '4': 1, '5': 9, '10': 'characteristicUuid'},
    const {'1': 'value', '3': 5, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `BluetoothDescriptor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bluetoothDescriptorDescriptor = $convert.base64Decode('ChNCbHVldG9vdGhEZXNjcmlwdG9yEhIKBHV1aWQYASABKAlSBHV1aWQSGwoJcmVtb3RlX2lkGAIgASgJUghyZW1vdGVJZBIgCgtzZXJ2aWNlVXVpZBgDIAEoCVILc2VydmljZVV1aWQSLgoSY2hhcmFjdGVyaXN0aWNVdWlkGAQgASgJUhJjaGFyYWN0ZXJpc3RpY1V1aWQSFAoFdmFsdWUYBSABKAxSBXZhbHVl');
@$core.Deprecated('Use characteristicPropertiesDescriptor instead')
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

/// Descriptor for `CharacteristicProperties`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characteristicPropertiesDescriptor = $convert.base64Decode('ChhDaGFyYWN0ZXJpc3RpY1Byb3BlcnRpZXMSHAoJYnJvYWRjYXN0GAEgASgIUglicm9hZGNhc3QSEgoEcmVhZBgCIAEoCFIEcmVhZBI0ChZ3cml0ZV93aXRob3V0X3Jlc3BvbnNlGAMgASgIUhR3cml0ZVdpdGhvdXRSZXNwb25zZRIUCgV3cml0ZRgEIAEoCFIFd3JpdGUSFgoGbm90aWZ5GAUgASgIUgZub3RpZnkSGgoIaW5kaWNhdGUYBiABKAhSCGluZGljYXRlEj4KG2F1dGhlbnRpY2F0ZWRfc2lnbmVkX3dyaXRlcxgHIAEoCFIZYXV0aGVudGljYXRlZFNpZ25lZFdyaXRlcxIvChNleHRlbmRlZF9wcm9wZXJ0aWVzGAggASgIUhJleHRlbmRlZFByb3BlcnRpZXMSPAoabm90aWZ5X2VuY3J5cHRpb25fcmVxdWlyZWQYCSABKAhSGG5vdGlmeUVuY3J5cHRpb25SZXF1aXJlZBJAChxpbmRpY2F0ZV9lbmNyeXB0aW9uX3JlcXVpcmVkGAogASgIUhppbmRpY2F0ZUVuY3J5cHRpb25SZXF1aXJlZA==');
@$core.Deprecated('Use discoverServicesResultDescriptor instead')
const DiscoverServicesResult$json = const {
  '1': 'DiscoverServicesResult',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'services', '3': 2, '4': 3, '5': 11, '6': '.BluetoothService', '10': 'services'},
  ],
};

/// Descriptor for `DiscoverServicesResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoverServicesResultDescriptor = $convert.base64Decode('ChZEaXNjb3ZlclNlcnZpY2VzUmVzdWx0EhsKCXJlbW90ZV9pZBgBIAEoCVIIcmVtb3RlSWQSLQoIc2VydmljZXMYAiADKAsyES5CbHVldG9vdGhTZXJ2aWNlUghzZXJ2aWNlcw==');
@$core.Deprecated('Use readCharacteristicRequestDescriptor instead')
const ReadCharacteristicRequest$json = const {
  '1': 'ReadCharacteristicRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'characteristic_uuid', '3': 2, '4': 1, '5': 9, '10': 'characteristicUuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
  ],
};

/// Descriptor for `ReadCharacteristicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readCharacteristicRequestDescriptor = $convert.base64Decode('ChlSZWFkQ2hhcmFjdGVyaXN0aWNSZXF1ZXN0EhsKCXJlbW90ZV9pZBgBIAEoCVIIcmVtb3RlSWQSLwoTY2hhcmFjdGVyaXN0aWNfdXVpZBgCIAEoCVISY2hhcmFjdGVyaXN0aWNVdWlkEiEKDHNlcnZpY2VfdXVpZBgDIAEoCVILc2VydmljZVV1aWQSNAoWc2Vjb25kYXJ5X3NlcnZpY2VfdXVpZBgEIAEoCVIUc2Vjb25kYXJ5U2VydmljZVV1aWQ=');
@$core.Deprecated('Use readCharacteristicResponseDescriptor instead')
const ReadCharacteristicResponse$json = const {
  '1': 'ReadCharacteristicResponse',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'characteristic', '3': 2, '4': 1, '5': 11, '6': '.BluetoothCharacteristic', '10': 'characteristic'},
  ],
};

/// Descriptor for `ReadCharacteristicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readCharacteristicResponseDescriptor = $convert.base64Decode('ChpSZWFkQ2hhcmFjdGVyaXN0aWNSZXNwb25zZRIbCglyZW1vdGVfaWQYASABKAlSCHJlbW90ZUlkEkAKDmNoYXJhY3RlcmlzdGljGAIgASgLMhguQmx1ZXRvb3RoQ2hhcmFjdGVyaXN0aWNSDmNoYXJhY3RlcmlzdGlj');
@$core.Deprecated('Use readDescriptorRequestDescriptor instead')
const ReadDescriptorRequest$json = const {
  '1': 'ReadDescriptorRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'descriptor_uuid', '3': 2, '4': 1, '5': 9, '10': 'descriptorUuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'characteristic_uuid', '3': 5, '4': 1, '5': 9, '10': 'characteristicUuid'},
  ],
};

/// Descriptor for `ReadDescriptorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readDescriptorRequestDescriptor = $convert.base64Decode('ChVSZWFkRGVzY3JpcHRvclJlcXVlc3QSGwoJcmVtb3RlX2lkGAEgASgJUghyZW1vdGVJZBInCg9kZXNjcmlwdG9yX3V1aWQYAiABKAlSDmRlc2NyaXB0b3JVdWlkEiEKDHNlcnZpY2VfdXVpZBgDIAEoCVILc2VydmljZVV1aWQSNAoWc2Vjb25kYXJ5X3NlcnZpY2VfdXVpZBgEIAEoCVIUc2Vjb25kYXJ5U2VydmljZVV1aWQSLwoTY2hhcmFjdGVyaXN0aWNfdXVpZBgFIAEoCVISY2hhcmFjdGVyaXN0aWNVdWlk');
@$core.Deprecated('Use readDescriptorResponseDescriptor instead')
const ReadDescriptorResponse$json = const {
  '1': 'ReadDescriptorResponse',
  '2': const [
    const {'1': 'request', '3': 1, '4': 1, '5': 11, '6': '.ReadDescriptorRequest', '10': 'request'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `ReadDescriptorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readDescriptorResponseDescriptor = $convert.base64Decode('ChZSZWFkRGVzY3JpcHRvclJlc3BvbnNlEjAKB3JlcXVlc3QYASABKAsyFi5SZWFkRGVzY3JpcHRvclJlcXVlc3RSB3JlcXVlc3QSFAoFdmFsdWUYAiABKAxSBXZhbHVl');
@$core.Deprecated('Use writeCharacteristicRequestDescriptor instead')
const WriteCharacteristicRequest$json = const {
  '1': 'WriteCharacteristicRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'characteristic_uuid', '3': 2, '4': 1, '5': 9, '10': 'characteristicUuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'write_type', '3': 5, '4': 1, '5': 14, '6': '.WriteCharacteristicRequest.WriteType', '10': 'writeType'},
    const {'1': 'value', '3': 6, '4': 1, '5': 12, '10': 'value'},
  ],
  '4': const [WriteCharacteristicRequest_WriteType$json],
};

@$core.Deprecated('Use writeCharacteristicRequestDescriptor instead')
const WriteCharacteristicRequest_WriteType$json = const {
  '1': 'WriteType',
  '2': const [
    const {'1': 'WITH_RESPONSE', '2': 0},
    const {'1': 'WITHOUT_RESPONSE', '2': 1},
  ],
};

/// Descriptor for `WriteCharacteristicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeCharacteristicRequestDescriptor = $convert.base64Decode('ChpXcml0ZUNoYXJhY3RlcmlzdGljUmVxdWVzdBIbCglyZW1vdGVfaWQYASABKAlSCHJlbW90ZUlkEi8KE2NoYXJhY3RlcmlzdGljX3V1aWQYAiABKAlSEmNoYXJhY3RlcmlzdGljVXVpZBIhCgxzZXJ2aWNlX3V1aWQYAyABKAlSC3NlcnZpY2VVdWlkEjQKFnNlY29uZGFyeV9zZXJ2aWNlX3V1aWQYBCABKAlSFHNlY29uZGFyeVNlcnZpY2VVdWlkEkQKCndyaXRlX3R5cGUYBSABKA4yJS5Xcml0ZUNoYXJhY3RlcmlzdGljUmVxdWVzdC5Xcml0ZVR5cGVSCXdyaXRlVHlwZRIUCgV2YWx1ZRgGIAEoDFIFdmFsdWUiNAoJV3JpdGVUeXBlEhEKDVdJVEhfUkVTUE9OU0UQABIUChBXSVRIT1VUX1JFU1BPTlNFEAE=');
@$core.Deprecated('Use writeCharacteristicResponseDescriptor instead')
const WriteCharacteristicResponse$json = const {
  '1': 'WriteCharacteristicResponse',
  '2': const [
    const {'1': 'request', '3': 1, '4': 1, '5': 11, '6': '.WriteCharacteristicRequest', '10': 'request'},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `WriteCharacteristicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeCharacteristicResponseDescriptor = $convert.base64Decode('ChtXcml0ZUNoYXJhY3RlcmlzdGljUmVzcG9uc2USNQoHcmVxdWVzdBgBIAEoCzIbLldyaXRlQ2hhcmFjdGVyaXN0aWNSZXF1ZXN0UgdyZXF1ZXN0EhgKB3N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use writeDescriptorRequestDescriptor instead')
const WriteDescriptorRequest$json = const {
  '1': 'WriteDescriptorRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'descriptor_uuid', '3': 2, '4': 1, '5': 9, '10': 'descriptorUuid'},
    const {'1': 'service_uuid', '3': 3, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 4, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'characteristic_uuid', '3': 5, '4': 1, '5': 9, '10': 'characteristicUuid'},
    const {'1': 'value', '3': 6, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `WriteDescriptorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeDescriptorRequestDescriptor = $convert.base64Decode('ChZXcml0ZURlc2NyaXB0b3JSZXF1ZXN0EhsKCXJlbW90ZV9pZBgBIAEoCVIIcmVtb3RlSWQSJwoPZGVzY3JpcHRvcl91dWlkGAIgASgJUg5kZXNjcmlwdG9yVXVpZBIhCgxzZXJ2aWNlX3V1aWQYAyABKAlSC3NlcnZpY2VVdWlkEjQKFnNlY29uZGFyeV9zZXJ2aWNlX3V1aWQYBCABKAlSFHNlY29uZGFyeVNlcnZpY2VVdWlkEi8KE2NoYXJhY3RlcmlzdGljX3V1aWQYBSABKAlSEmNoYXJhY3RlcmlzdGljVXVpZBIUCgV2YWx1ZRgGIAEoDFIFdmFsdWU=');
@$core.Deprecated('Use writeDescriptorResponseDescriptor instead')
const WriteDescriptorResponse$json = const {
  '1': 'WriteDescriptorResponse',
  '2': const [
    const {'1': 'request', '3': 1, '4': 1, '5': 11, '6': '.WriteDescriptorRequest', '10': 'request'},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `WriteDescriptorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeDescriptorResponseDescriptor = $convert.base64Decode('ChdXcml0ZURlc2NyaXB0b3JSZXNwb25zZRIxCgdyZXF1ZXN0GAEgASgLMhcuV3JpdGVEZXNjcmlwdG9yUmVxdWVzdFIHcmVxdWVzdBIYCgdzdWNjZXNzGAIgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use setNotificationRequestDescriptor instead')
const SetNotificationRequest$json = const {
  '1': 'SetNotificationRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'service_uuid', '3': 2, '4': 1, '5': 9, '10': 'serviceUuid'},
    const {'1': 'secondary_service_uuid', '3': 3, '4': 1, '5': 9, '10': 'secondaryServiceUuid'},
    const {'1': 'characteristic_uuid', '3': 4, '4': 1, '5': 9, '10': 'characteristicUuid'},
    const {'1': 'enable', '3': 5, '4': 1, '5': 8, '10': 'enable'},
  ],
};

/// Descriptor for `SetNotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setNotificationRequestDescriptor = $convert.base64Decode('ChZTZXROb3RpZmljYXRpb25SZXF1ZXN0EhsKCXJlbW90ZV9pZBgBIAEoCVIIcmVtb3RlSWQSIQoMc2VydmljZV91dWlkGAIgASgJUgtzZXJ2aWNlVXVpZBI0ChZzZWNvbmRhcnlfc2VydmljZV91dWlkGAMgASgJUhRzZWNvbmRhcnlTZXJ2aWNlVXVpZBIvChNjaGFyYWN0ZXJpc3RpY191dWlkGAQgASgJUhJjaGFyYWN0ZXJpc3RpY1V1aWQSFgoGZW5hYmxlGAUgASgIUgZlbmFibGU=');
@$core.Deprecated('Use setNotificationResponseDescriptor instead')
const SetNotificationResponse$json = const {
  '1': 'SetNotificationResponse',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'characteristic', '3': 2, '4': 1, '5': 11, '6': '.BluetoothCharacteristic', '10': 'characteristic'},
    const {'1': 'success', '3': 3, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SetNotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setNotificationResponseDescriptor = $convert.base64Decode('ChdTZXROb3RpZmljYXRpb25SZXNwb25zZRIbCglyZW1vdGVfaWQYASABKAlSCHJlbW90ZUlkEkAKDmNoYXJhY3RlcmlzdGljGAIgASgLMhguQmx1ZXRvb3RoQ2hhcmFjdGVyaXN0aWNSDmNoYXJhY3RlcmlzdGljEhgKB3N1Y2Nlc3MYAyABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use onCharacteristicChangedDescriptor instead')
const OnCharacteristicChanged$json = const {
  '1': 'OnCharacteristicChanged',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'characteristic', '3': 2, '4': 1, '5': 11, '6': '.BluetoothCharacteristic', '10': 'characteristic'},
  ],
};

/// Descriptor for `OnCharacteristicChanged`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onCharacteristicChangedDescriptor = $convert.base64Decode('ChdPbkNoYXJhY3RlcmlzdGljQ2hhbmdlZBIbCglyZW1vdGVfaWQYASABKAlSCHJlbW90ZUlkEkAKDmNoYXJhY3RlcmlzdGljGAIgASgLMhguQmx1ZXRvb3RoQ2hhcmFjdGVyaXN0aWNSDmNoYXJhY3RlcmlzdGlj');
@$core.Deprecated('Use deviceStateResponseDescriptor instead')
const DeviceStateResponse$json = const {
  '1': 'DeviceStateResponse',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.DeviceStateResponse.BluetoothDeviceState', '10': 'state'},
  ],
  '4': const [DeviceStateResponse_BluetoothDeviceState$json],
};

@$core.Deprecated('Use deviceStateResponseDescriptor instead')
const DeviceStateResponse_BluetoothDeviceState$json = const {
  '1': 'BluetoothDeviceState',
  '2': const [
    const {'1': 'DISCONNECTED', '2': 0},
    const {'1': 'CONNECTING', '2': 1},
    const {'1': 'CONNECTED', '2': 2},
    const {'1': 'DISCONNECTING', '2': 3},
  ],
};

/// Descriptor for `DeviceStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceStateResponseDescriptor = $convert.base64Decode('ChNEZXZpY2VTdGF0ZVJlc3BvbnNlEhsKCXJlbW90ZV9pZBgBIAEoCVIIcmVtb3RlSWQSPwoFc3RhdGUYAiABKA4yKS5EZXZpY2VTdGF0ZVJlc3BvbnNlLkJsdWV0b290aERldmljZVN0YXRlUgVzdGF0ZSJaChRCbHVldG9vdGhEZXZpY2VTdGF0ZRIQCgxESVNDT05ORUNURUQQABIOCgpDT05ORUNUSU5HEAESDQoJQ09OTkVDVEVEEAISEQoNRElTQ09OTkVDVElORxAD');
@$core.Deprecated('Use connectedDevicesResponseDescriptor instead')
const ConnectedDevicesResponse$json = const {
  '1': 'ConnectedDevicesResponse',
  '2': const [
    const {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.BluetoothDevice', '10': 'devices'},
  ],
};

/// Descriptor for `ConnectedDevicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectedDevicesResponseDescriptor = $convert.base64Decode('ChhDb25uZWN0ZWREZXZpY2VzUmVzcG9uc2USKgoHZGV2aWNlcxgBIAMoCzIQLkJsdWV0b290aERldmljZVIHZGV2aWNlcw==');
@$core.Deprecated('Use mtuSizeRequestDescriptor instead')
const MtuSizeRequest$json = const {
  '1': 'MtuSizeRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'mtu', '3': 2, '4': 1, '5': 13, '10': 'mtu'},
  ],
};

/// Descriptor for `MtuSizeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mtuSizeRequestDescriptor = $convert.base64Decode('Cg5NdHVTaXplUmVxdWVzdBIbCglyZW1vdGVfaWQYASABKAlSCHJlbW90ZUlkEhAKA210dRgCIAEoDVIDbXR1');
@$core.Deprecated('Use mtuSizeResponseDescriptor instead')
const MtuSizeResponse$json = const {
  '1': 'MtuSizeResponse',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'mtu', '3': 2, '4': 1, '5': 13, '10': 'mtu'},
  ],
};

/// Descriptor for `MtuSizeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mtuSizeResponseDescriptor = $convert.base64Decode('Cg9NdHVTaXplUmVzcG9uc2USGwoJcmVtb3RlX2lkGAEgASgJUghyZW1vdGVJZBIQCgNtdHUYAiABKA1SA210dQ==');
