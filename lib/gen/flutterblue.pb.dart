///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: library_prefixes
library flutterblue;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

import 'flutterblue.pbenum.dart';

export 'flutterblue.pbenum.dart';

class BluetoothState extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('BluetoothState')
    ..e<BluetoothState_State>(1, 'state', PbFieldType.OE, BluetoothState_State.UNKNOWN, BluetoothState_State.valueOf)
    ..hasRequiredFields = false
  ;

  BluetoothState() : super();
  BluetoothState.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BluetoothState.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BluetoothState clone() => new BluetoothState()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static BluetoothState create() => new BluetoothState();
  static PbList<BluetoothState> createRepeated() => new PbList<BluetoothState>();
  static BluetoothState getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBluetoothState();
    return _defaultInstance;
  }
  static BluetoothState _defaultInstance;
  static void $checkItem(BluetoothState v) {
    if (v is! BluetoothState) checkItemFailed(v, 'BluetoothState');
  }

  BluetoothState_State get state => $_get(0, 1, null);
  set state(BluetoothState_State v) { setField(1, v); }
  bool hasState() => $_has(0, 1);
  void clearState() => clearField(1);
}

class _ReadonlyBluetoothState extends BluetoothState with ReadonlyMessageMixin {}

class AdvertisementData_ServiceDataEntry extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('AdvertisementData_ServiceDataEntry')
    ..a<String>(1, 'key', PbFieldType.OS)
    ..a<List<int>>(2, 'value', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AdvertisementData_ServiceDataEntry() : super();
  AdvertisementData_ServiceDataEntry.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AdvertisementData_ServiceDataEntry.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AdvertisementData_ServiceDataEntry clone() => new AdvertisementData_ServiceDataEntry()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static AdvertisementData_ServiceDataEntry create() => new AdvertisementData_ServiceDataEntry();
  static PbList<AdvertisementData_ServiceDataEntry> createRepeated() => new PbList<AdvertisementData_ServiceDataEntry>();
  static AdvertisementData_ServiceDataEntry getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAdvertisementData_ServiceDataEntry();
    return _defaultInstance;
  }
  static AdvertisementData_ServiceDataEntry _defaultInstance;
  static void $checkItem(AdvertisementData_ServiceDataEntry v) {
    if (v is! AdvertisementData_ServiceDataEntry) checkItemFailed(v, 'AdvertisementData_ServiceDataEntry');
  }

  String get key => $_get(0, 1, '');
  set key(String v) { $_setString(0, 1, v); }
  bool hasKey() => $_has(0, 1);
  void clearKey() => clearField(1);

  List<int> get value => $_get(1, 2, null);
  set value(List<int> v) { $_setBytes(1, 2, v); }
  bool hasValue() => $_has(1, 2);
  void clearValue() => clearField(2);
}

class _ReadonlyAdvertisementData_ServiceDataEntry extends AdvertisementData_ServiceDataEntry with ReadonlyMessageMixin {}

class AdvertisementData extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('AdvertisementData')
    ..a<String>(1, 'localName', PbFieldType.OS)
    ..a<List<int>>(2, 'manufacturerData', PbFieldType.OY)
    ..pp<AdvertisementData_ServiceDataEntry>(3, 'serviceData', PbFieldType.PM, AdvertisementData_ServiceDataEntry.$checkItem, AdvertisementData_ServiceDataEntry.create)
    ..a<int>(4, 'txPowerLevel', PbFieldType.O3)
    ..a<bool>(5, 'connectable', PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  AdvertisementData() : super();
  AdvertisementData.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AdvertisementData.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AdvertisementData clone() => new AdvertisementData()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static AdvertisementData create() => new AdvertisementData();
  static PbList<AdvertisementData> createRepeated() => new PbList<AdvertisementData>();
  static AdvertisementData getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAdvertisementData();
    return _defaultInstance;
  }
  static AdvertisementData _defaultInstance;
  static void $checkItem(AdvertisementData v) {
    if (v is! AdvertisementData) checkItemFailed(v, 'AdvertisementData');
  }

  String get localName => $_get(0, 1, '');
  set localName(String v) { $_setString(0, 1, v); }
  bool hasLocalName() => $_has(0, 1);
  void clearLocalName() => clearField(1);

  List<int> get manufacturerData => $_get(1, 2, null);
  set manufacturerData(List<int> v) { $_setBytes(1, 2, v); }
  bool hasManufacturerData() => $_has(1, 2);
  void clearManufacturerData() => clearField(2);

  List<AdvertisementData_ServiceDataEntry> get serviceData => $_get(2, 3, null);

  int get txPowerLevel => $_get(3, 4, 0);
  set txPowerLevel(int v) { $_setUnsignedInt32(3, 4, v); }
  bool hasTxPowerLevel() => $_has(3, 4);
  void clearTxPowerLevel() => clearField(4);

  bool get connectable => $_get(4, 5, false);
  set connectable(bool v) { $_setBool(4, 5, v); }
  bool hasConnectable() => $_has(4, 5);
  void clearConnectable() => clearField(5);
}

class _ReadonlyAdvertisementData extends AdvertisementData with ReadonlyMessageMixin {}

class ScanSettings extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ScanSettings')
    ..a<int>(1, 'androidScanMode', PbFieldType.O3)
    ..p<String>(2, 'serviceUuids', PbFieldType.PS)
    ..hasRequiredFields = false
  ;

  ScanSettings() : super();
  ScanSettings.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ScanSettings.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ScanSettings clone() => new ScanSettings()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ScanSettings create() => new ScanSettings();
  static PbList<ScanSettings> createRepeated() => new PbList<ScanSettings>();
  static ScanSettings getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyScanSettings();
    return _defaultInstance;
  }
  static ScanSettings _defaultInstance;
  static void $checkItem(ScanSettings v) {
    if (v is! ScanSettings) checkItemFailed(v, 'ScanSettings');
  }

  int get androidScanMode => $_get(0, 1, 0);
  set androidScanMode(int v) { $_setUnsignedInt32(0, 1, v); }
  bool hasAndroidScanMode() => $_has(0, 1);
  void clearAndroidScanMode() => clearField(1);

  List<String> get serviceUuids => $_get(1, 2, null);
}

class _ReadonlyScanSettings extends ScanSettings with ReadonlyMessageMixin {}

class ScanResult extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ScanResult')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'name', PbFieldType.OS)
    ..a<int>(3, 'rssi', PbFieldType.O3)
    ..a<AdvertisementData>(4, 'advertisementData', PbFieldType.OM, AdvertisementData.getDefault, AdvertisementData.create)
    ..hasRequiredFields = false
  ;

  ScanResult() : super();
  ScanResult.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ScanResult.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ScanResult clone() => new ScanResult()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ScanResult create() => new ScanResult();
  static PbList<ScanResult> createRepeated() => new PbList<ScanResult>();
  static ScanResult getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyScanResult();
    return _defaultInstance;
  }
  static ScanResult _defaultInstance;
  static void $checkItem(ScanResult v) {
    if (v is! ScanResult) checkItemFailed(v, 'ScanResult');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get name => $_get(1, 2, '');
  set name(String v) { $_setString(1, 2, v); }
  bool hasName() => $_has(1, 2);
  void clearName() => clearField(2);

  int get rssi => $_get(2, 3, 0);
  set rssi(int v) { $_setUnsignedInt32(2, 3, v); }
  bool hasRssi() => $_has(2, 3);
  void clearRssi() => clearField(3);

  AdvertisementData get advertisementData => $_get(3, 4, null);
  set advertisementData(AdvertisementData v) { setField(4, v); }
  bool hasAdvertisementData() => $_has(3, 4);
  void clearAdvertisementData() => clearField(4);
}

class _ReadonlyScanResult extends ScanResult with ReadonlyMessageMixin {}

class ConnectOptions extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ConnectOptions')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<bool>(2, 'androidAutoConnect', PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  ConnectOptions() : super();
  ConnectOptions.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ConnectOptions.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ConnectOptions clone() => new ConnectOptions()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ConnectOptions create() => new ConnectOptions();
  static PbList<ConnectOptions> createRepeated() => new PbList<ConnectOptions>();
  static ConnectOptions getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyConnectOptions();
    return _defaultInstance;
  }
  static ConnectOptions _defaultInstance;
  static void $checkItem(ConnectOptions v) {
    if (v is! ConnectOptions) checkItemFailed(v, 'ConnectOptions');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  bool get androidAutoConnect => $_get(1, 2, false);
  set androidAutoConnect(bool v) { $_setBool(1, 2, v); }
  bool hasAndroidAutoConnect() => $_has(1, 2);
  void clearAndroidAutoConnect() => clearField(2);
}

class _ReadonlyConnectOptions extends ConnectOptions with ReadonlyMessageMixin {}

class BluetoothDevice extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('BluetoothDevice')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'name', PbFieldType.OS)
    ..e<BluetoothDevice_Type>(3, 'type', PbFieldType.OE, BluetoothDevice_Type.UNKNOWN, BluetoothDevice_Type.valueOf)
    ..hasRequiredFields = false
  ;

  BluetoothDevice() : super();
  BluetoothDevice.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BluetoothDevice.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BluetoothDevice clone() => new BluetoothDevice()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static BluetoothDevice create() => new BluetoothDevice();
  static PbList<BluetoothDevice> createRepeated() => new PbList<BluetoothDevice>();
  static BluetoothDevice getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBluetoothDevice();
    return _defaultInstance;
  }
  static BluetoothDevice _defaultInstance;
  static void $checkItem(BluetoothDevice v) {
    if (v is! BluetoothDevice) checkItemFailed(v, 'BluetoothDevice');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get name => $_get(1, 2, '');
  set name(String v) { $_setString(1, 2, v); }
  bool hasName() => $_has(1, 2);
  void clearName() => clearField(2);

  BluetoothDevice_Type get type => $_get(2, 3, null);
  set type(BluetoothDevice_Type v) { setField(3, v); }
  bool hasType() => $_has(2, 3);
  void clearType() => clearField(3);
}

class _ReadonlyBluetoothDevice extends BluetoothDevice with ReadonlyMessageMixin {}

class BluetoothService extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('BluetoothService')
    ..a<String>(1, 'uuid', PbFieldType.OS)
    ..a<String>(2, 'remoteId', PbFieldType.OS)
    ..a<bool>(3, 'isPrimary', PbFieldType.OB)
    ..pp<BluetoothCharacteristic>(4, 'characteristics', PbFieldType.PM, BluetoothCharacteristic.$checkItem, BluetoothCharacteristic.create)
    ..pp<BluetoothService>(5, 'includedServices', PbFieldType.PM, BluetoothService.$checkItem, BluetoothService.create)
    ..hasRequiredFields = false
  ;

  BluetoothService() : super();
  BluetoothService.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BluetoothService.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BluetoothService clone() => new BluetoothService()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static BluetoothService create() => new BluetoothService();
  static PbList<BluetoothService> createRepeated() => new PbList<BluetoothService>();
  static BluetoothService getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBluetoothService();
    return _defaultInstance;
  }
  static BluetoothService _defaultInstance;
  static void $checkItem(BluetoothService v) {
    if (v is! BluetoothService) checkItemFailed(v, 'BluetoothService');
  }

  String get uuid => $_get(0, 1, '');
  set uuid(String v) { $_setString(0, 1, v); }
  bool hasUuid() => $_has(0, 1);
  void clearUuid() => clearField(1);

  String get remoteId => $_get(1, 2, '');
  set remoteId(String v) { $_setString(1, 2, v); }
  bool hasRemoteId() => $_has(1, 2);
  void clearRemoteId() => clearField(2);

  bool get isPrimary => $_get(2, 3, false);
  set isPrimary(bool v) { $_setBool(2, 3, v); }
  bool hasIsPrimary() => $_has(2, 3);
  void clearIsPrimary() => clearField(3);

  List<BluetoothCharacteristic> get characteristics => $_get(3, 4, null);

  List<BluetoothService> get includedServices => $_get(4, 5, null);
}

class _ReadonlyBluetoothService extends BluetoothService with ReadonlyMessageMixin {}

class BluetoothCharacteristic extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('BluetoothCharacteristic')
    ..a<String>(1, 'uuid', PbFieldType.OS)
    ..a<String>(2, 'serviceUuid', PbFieldType.OS)
    ..a<String>(3, 'secondaryServiceUuid', PbFieldType.OS)
    ..pp<BluetoothDescriptor>(4, 'descriptors', PbFieldType.PM, BluetoothDescriptor.$checkItem, BluetoothDescriptor.create)
    ..a<CharacteristicProperties>(5, 'properties', PbFieldType.OM, CharacteristicProperties.getDefault, CharacteristicProperties.create)
    ..a<List<int>>(6, 'value', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BluetoothCharacteristic() : super();
  BluetoothCharacteristic.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BluetoothCharacteristic.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BluetoothCharacteristic clone() => new BluetoothCharacteristic()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static BluetoothCharacteristic create() => new BluetoothCharacteristic();
  static PbList<BluetoothCharacteristic> createRepeated() => new PbList<BluetoothCharacteristic>();
  static BluetoothCharacteristic getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBluetoothCharacteristic();
    return _defaultInstance;
  }
  static BluetoothCharacteristic _defaultInstance;
  static void $checkItem(BluetoothCharacteristic v) {
    if (v is! BluetoothCharacteristic) checkItemFailed(v, 'BluetoothCharacteristic');
  }

  String get uuid => $_get(0, 1, '');
  set uuid(String v) { $_setString(0, 1, v); }
  bool hasUuid() => $_has(0, 1);
  void clearUuid() => clearField(1);

  String get serviceUuid => $_get(1, 2, '');
  set serviceUuid(String v) { $_setString(1, 2, v); }
  bool hasServiceUuid() => $_has(1, 2);
  void clearServiceUuid() => clearField(2);

  String get secondaryServiceUuid => $_get(2, 3, '');
  set secondaryServiceUuid(String v) { $_setString(2, 3, v); }
  bool hasSecondaryServiceUuid() => $_has(2, 3);
  void clearSecondaryServiceUuid() => clearField(3);

  List<BluetoothDescriptor> get descriptors => $_get(3, 4, null);

  CharacteristicProperties get properties => $_get(4, 5, null);
  set properties(CharacteristicProperties v) { setField(5, v); }
  bool hasProperties() => $_has(4, 5);
  void clearProperties() => clearField(5);

  List<int> get value => $_get(5, 6, null);
  set value(List<int> v) { $_setBytes(5, 6, v); }
  bool hasValue() => $_has(5, 6);
  void clearValue() => clearField(6);
}

class _ReadonlyBluetoothCharacteristic extends BluetoothCharacteristic with ReadonlyMessageMixin {}

class BluetoothDescriptor extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('BluetoothDescriptor')
    ..a<String>(1, 'uuid', PbFieldType.OS)
    ..a<String>(2, 'serviceUuid', PbFieldType.OS)
    ..a<String>(3, 'characteristicUuid', PbFieldType.OS)
    ..a<List<int>>(4, 'value', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BluetoothDescriptor() : super();
  BluetoothDescriptor.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BluetoothDescriptor.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BluetoothDescriptor clone() => new BluetoothDescriptor()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static BluetoothDescriptor create() => new BluetoothDescriptor();
  static PbList<BluetoothDescriptor> createRepeated() => new PbList<BluetoothDescriptor>();
  static BluetoothDescriptor getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBluetoothDescriptor();
    return _defaultInstance;
  }
  static BluetoothDescriptor _defaultInstance;
  static void $checkItem(BluetoothDescriptor v) {
    if (v is! BluetoothDescriptor) checkItemFailed(v, 'BluetoothDescriptor');
  }

  String get uuid => $_get(0, 1, '');
  set uuid(String v) { $_setString(0, 1, v); }
  bool hasUuid() => $_has(0, 1);
  void clearUuid() => clearField(1);

  String get serviceUuid => $_get(1, 2, '');
  set serviceUuid(String v) { $_setString(1, 2, v); }
  bool hasServiceUuid() => $_has(1, 2);
  void clearServiceUuid() => clearField(2);

  String get characteristicUuid => $_get(2, 3, '');
  set characteristicUuid(String v) { $_setString(2, 3, v); }
  bool hasCharacteristicUuid() => $_has(2, 3);
  void clearCharacteristicUuid() => clearField(3);

  List<int> get value => $_get(3, 4, null);
  set value(List<int> v) { $_setBytes(3, 4, v); }
  bool hasValue() => $_has(3, 4);
  void clearValue() => clearField(4);
}

class _ReadonlyBluetoothDescriptor extends BluetoothDescriptor with ReadonlyMessageMixin {}

class CharacteristicProperties extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('CharacteristicProperties')
    ..a<bool>(1, 'broadcast', PbFieldType.OB)
    ..a<bool>(2, 'read', PbFieldType.OB)
    ..a<bool>(3, 'writeWithoutResponse', PbFieldType.OB)
    ..a<bool>(4, 'write', PbFieldType.OB)
    ..a<bool>(5, 'notify', PbFieldType.OB)
    ..a<bool>(6, 'indicate', PbFieldType.OB)
    ..a<bool>(7, 'authenticatedSignedWrites', PbFieldType.OB)
    ..a<bool>(8, 'extendedProperties', PbFieldType.OB)
    ..a<bool>(9, 'notifyEncryptionRequired', PbFieldType.OB)
    ..a<bool>(10, 'indicateEncryptionRequired', PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  CharacteristicProperties() : super();
  CharacteristicProperties.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CharacteristicProperties.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CharacteristicProperties clone() => new CharacteristicProperties()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static CharacteristicProperties create() => new CharacteristicProperties();
  static PbList<CharacteristicProperties> createRepeated() => new PbList<CharacteristicProperties>();
  static CharacteristicProperties getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCharacteristicProperties();
    return _defaultInstance;
  }
  static CharacteristicProperties _defaultInstance;
  static void $checkItem(CharacteristicProperties v) {
    if (v is! CharacteristicProperties) checkItemFailed(v, 'CharacteristicProperties');
  }

  bool get broadcast => $_get(0, 1, false);
  set broadcast(bool v) { $_setBool(0, 1, v); }
  bool hasBroadcast() => $_has(0, 1);
  void clearBroadcast() => clearField(1);

  bool get read => $_get(1, 2, false);
  set read(bool v) { $_setBool(1, 2, v); }
  bool hasRead() => $_has(1, 2);
  void clearRead() => clearField(2);

  bool get writeWithoutResponse => $_get(2, 3, false);
  set writeWithoutResponse(bool v) { $_setBool(2, 3, v); }
  bool hasWriteWithoutResponse() => $_has(2, 3);
  void clearWriteWithoutResponse() => clearField(3);

  bool get write => $_get(3, 4, false);
  set write(bool v) { $_setBool(3, 4, v); }
  bool hasWrite() => $_has(3, 4);
  void clearWrite() => clearField(4);

  bool get notify => $_get(4, 5, false);
  set notify(bool v) { $_setBool(4, 5, v); }
  bool hasNotify() => $_has(4, 5);
  void clearNotify() => clearField(5);

  bool get indicate => $_get(5, 6, false);
  set indicate(bool v) { $_setBool(5, 6, v); }
  bool hasIndicate() => $_has(5, 6);
  void clearIndicate() => clearField(6);

  bool get authenticatedSignedWrites => $_get(6, 7, false);
  set authenticatedSignedWrites(bool v) { $_setBool(6, 7, v); }
  bool hasAuthenticatedSignedWrites() => $_has(6, 7);
  void clearAuthenticatedSignedWrites() => clearField(7);

  bool get extendedProperties => $_get(7, 8, false);
  set extendedProperties(bool v) { $_setBool(7, 8, v); }
  bool hasExtendedProperties() => $_has(7, 8);
  void clearExtendedProperties() => clearField(8);

  bool get notifyEncryptionRequired => $_get(8, 9, false);
  set notifyEncryptionRequired(bool v) { $_setBool(8, 9, v); }
  bool hasNotifyEncryptionRequired() => $_has(8, 9);
  void clearNotifyEncryptionRequired() => clearField(9);

  bool get indicateEncryptionRequired => $_get(9, 10, false);
  set indicateEncryptionRequired(bool v) { $_setBool(9, 10, v); }
  bool hasIndicateEncryptionRequired() => $_has(9, 10);
  void clearIndicateEncryptionRequired() => clearField(10);
}

class _ReadonlyCharacteristicProperties extends CharacteristicProperties with ReadonlyMessageMixin {}

class DiscoverServicesResult extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DiscoverServicesResult')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..pp<BluetoothService>(2, 'services', PbFieldType.PM, BluetoothService.$checkItem, BluetoothService.create)
    ..hasRequiredFields = false
  ;

  DiscoverServicesResult() : super();
  DiscoverServicesResult.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DiscoverServicesResult.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DiscoverServicesResult clone() => new DiscoverServicesResult()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DiscoverServicesResult create() => new DiscoverServicesResult();
  static PbList<DiscoverServicesResult> createRepeated() => new PbList<DiscoverServicesResult>();
  static DiscoverServicesResult getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDiscoverServicesResult();
    return _defaultInstance;
  }
  static DiscoverServicesResult _defaultInstance;
  static void $checkItem(DiscoverServicesResult v) {
    if (v is! DiscoverServicesResult) checkItemFailed(v, 'DiscoverServicesResult');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  List<BluetoothService> get services => $_get(1, 2, null);
}

class _ReadonlyDiscoverServicesResult extends DiscoverServicesResult with ReadonlyMessageMixin {}

class ReadCharacteristicRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ReadCharacteristicRequest')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'characteristicUuid', PbFieldType.OS)
    ..a<String>(3, 'serviceUuid', PbFieldType.OS)
    ..a<String>(4, 'secondaryServiceUuid', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  ReadCharacteristicRequest() : super();
  ReadCharacteristicRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReadCharacteristicRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReadCharacteristicRequest clone() => new ReadCharacteristicRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ReadCharacteristicRequest create() => new ReadCharacteristicRequest();
  static PbList<ReadCharacteristicRequest> createRepeated() => new PbList<ReadCharacteristicRequest>();
  static ReadCharacteristicRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReadCharacteristicRequest();
    return _defaultInstance;
  }
  static ReadCharacteristicRequest _defaultInstance;
  static void $checkItem(ReadCharacteristicRequest v) {
    if (v is! ReadCharacteristicRequest) checkItemFailed(v, 'ReadCharacteristicRequest');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get characteristicUuid => $_get(1, 2, '');
  set characteristicUuid(String v) { $_setString(1, 2, v); }
  bool hasCharacteristicUuid() => $_has(1, 2);
  void clearCharacteristicUuid() => clearField(2);

  String get serviceUuid => $_get(2, 3, '');
  set serviceUuid(String v) { $_setString(2, 3, v); }
  bool hasServiceUuid() => $_has(2, 3);
  void clearServiceUuid() => clearField(3);

  String get secondaryServiceUuid => $_get(3, 4, '');
  set secondaryServiceUuid(String v) { $_setString(3, 4, v); }
  bool hasSecondaryServiceUuid() => $_has(3, 4);
  void clearSecondaryServiceUuid() => clearField(4);
}

class _ReadonlyReadCharacteristicRequest extends ReadCharacteristicRequest with ReadonlyMessageMixin {}

class ReadCharacteristicResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ReadCharacteristicResponse')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<BluetoothCharacteristic>(2, 'characteristic', PbFieldType.OM, BluetoothCharacteristic.getDefault, BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  ReadCharacteristicResponse() : super();
  ReadCharacteristicResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReadCharacteristicResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReadCharacteristicResponse clone() => new ReadCharacteristicResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ReadCharacteristicResponse create() => new ReadCharacteristicResponse();
  static PbList<ReadCharacteristicResponse> createRepeated() => new PbList<ReadCharacteristicResponse>();
  static ReadCharacteristicResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReadCharacteristicResponse();
    return _defaultInstance;
  }
  static ReadCharacteristicResponse _defaultInstance;
  static void $checkItem(ReadCharacteristicResponse v) {
    if (v is! ReadCharacteristicResponse) checkItemFailed(v, 'ReadCharacteristicResponse');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  BluetoothCharacteristic get characteristic => $_get(1, 2, null);
  set characteristic(BluetoothCharacteristic v) { setField(2, v); }
  bool hasCharacteristic() => $_has(1, 2);
  void clearCharacteristic() => clearField(2);
}

class _ReadonlyReadCharacteristicResponse extends ReadCharacteristicResponse with ReadonlyMessageMixin {}

class ReadDescriptorRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ReadDescriptorRequest')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'descriptorUuid', PbFieldType.OS)
    ..a<String>(3, 'serviceUuid', PbFieldType.OS)
    ..a<String>(4, 'secondaryServiceUuid', PbFieldType.OS)
    ..a<String>(5, 'characteristicUuid', PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  ReadDescriptorRequest() : super();
  ReadDescriptorRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReadDescriptorRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReadDescriptorRequest clone() => new ReadDescriptorRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ReadDescriptorRequest create() => new ReadDescriptorRequest();
  static PbList<ReadDescriptorRequest> createRepeated() => new PbList<ReadDescriptorRequest>();
  static ReadDescriptorRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReadDescriptorRequest();
    return _defaultInstance;
  }
  static ReadDescriptorRequest _defaultInstance;
  static void $checkItem(ReadDescriptorRequest v) {
    if (v is! ReadDescriptorRequest) checkItemFailed(v, 'ReadDescriptorRequest');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get descriptorUuid => $_get(1, 2, '');
  set descriptorUuid(String v) { $_setString(1, 2, v); }
  bool hasDescriptorUuid() => $_has(1, 2);
  void clearDescriptorUuid() => clearField(2);

  String get serviceUuid => $_get(2, 3, '');
  set serviceUuid(String v) { $_setString(2, 3, v); }
  bool hasServiceUuid() => $_has(2, 3);
  void clearServiceUuid() => clearField(3);

  String get secondaryServiceUuid => $_get(3, 4, '');
  set secondaryServiceUuid(String v) { $_setString(3, 4, v); }
  bool hasSecondaryServiceUuid() => $_has(3, 4);
  void clearSecondaryServiceUuid() => clearField(4);

  String get characteristicUuid => $_get(4, 5, '');
  set characteristicUuid(String v) { $_setString(4, 5, v); }
  bool hasCharacteristicUuid() => $_has(4, 5);
  void clearCharacteristicUuid() => clearField(5);
}

class _ReadonlyReadDescriptorRequest extends ReadDescriptorRequest with ReadonlyMessageMixin {}

class ReadDescriptorResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ReadDescriptorResponse')
    ..a<ReadDescriptorRequest>(1, 'request', PbFieldType.OM, ReadDescriptorRequest.getDefault, ReadDescriptorRequest.create)
    ..a<List<int>>(2, 'value', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ReadDescriptorResponse() : super();
  ReadDescriptorResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReadDescriptorResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReadDescriptorResponse clone() => new ReadDescriptorResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ReadDescriptorResponse create() => new ReadDescriptorResponse();
  static PbList<ReadDescriptorResponse> createRepeated() => new PbList<ReadDescriptorResponse>();
  static ReadDescriptorResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReadDescriptorResponse();
    return _defaultInstance;
  }
  static ReadDescriptorResponse _defaultInstance;
  static void $checkItem(ReadDescriptorResponse v) {
    if (v is! ReadDescriptorResponse) checkItemFailed(v, 'ReadDescriptorResponse');
  }

  ReadDescriptorRequest get request => $_get(0, 1, null);
  set request(ReadDescriptorRequest v) { setField(1, v); }
  bool hasRequest() => $_has(0, 1);
  void clearRequest() => clearField(1);

  List<int> get value => $_get(1, 2, null);
  set value(List<int> v) { $_setBytes(1, 2, v); }
  bool hasValue() => $_has(1, 2);
  void clearValue() => clearField(2);
}

class _ReadonlyReadDescriptorResponse extends ReadDescriptorResponse with ReadonlyMessageMixin {}

class WriteCharacteristicRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('WriteCharacteristicRequest')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'characteristicUuid', PbFieldType.OS)
    ..a<String>(3, 'serviceUuid', PbFieldType.OS)
    ..a<String>(4, 'secondaryServiceUuid', PbFieldType.OS)
    ..e<WriteCharacteristicRequest_WriteType>(5, 'writeType', PbFieldType.OE, WriteCharacteristicRequest_WriteType.WITH_RESPONSE, WriteCharacteristicRequest_WriteType.valueOf)
    ..a<List<int>>(6, 'value', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WriteCharacteristicRequest() : super();
  WriteCharacteristicRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  WriteCharacteristicRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  WriteCharacteristicRequest clone() => new WriteCharacteristicRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static WriteCharacteristicRequest create() => new WriteCharacteristicRequest();
  static PbList<WriteCharacteristicRequest> createRepeated() => new PbList<WriteCharacteristicRequest>();
  static WriteCharacteristicRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyWriteCharacteristicRequest();
    return _defaultInstance;
  }
  static WriteCharacteristicRequest _defaultInstance;
  static void $checkItem(WriteCharacteristicRequest v) {
    if (v is! WriteCharacteristicRequest) checkItemFailed(v, 'WriteCharacteristicRequest');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get characteristicUuid => $_get(1, 2, '');
  set characteristicUuid(String v) { $_setString(1, 2, v); }
  bool hasCharacteristicUuid() => $_has(1, 2);
  void clearCharacteristicUuid() => clearField(2);

  String get serviceUuid => $_get(2, 3, '');
  set serviceUuid(String v) { $_setString(2, 3, v); }
  bool hasServiceUuid() => $_has(2, 3);
  void clearServiceUuid() => clearField(3);

  String get secondaryServiceUuid => $_get(3, 4, '');
  set secondaryServiceUuid(String v) { $_setString(3, 4, v); }
  bool hasSecondaryServiceUuid() => $_has(3, 4);
  void clearSecondaryServiceUuid() => clearField(4);

  WriteCharacteristicRequest_WriteType get writeType => $_get(4, 5, null);
  set writeType(WriteCharacteristicRequest_WriteType v) { setField(5, v); }
  bool hasWriteType() => $_has(4, 5);
  void clearWriteType() => clearField(5);

  List<int> get value => $_get(5, 6, null);
  set value(List<int> v) { $_setBytes(5, 6, v); }
  bool hasValue() => $_has(5, 6);
  void clearValue() => clearField(6);
}

class _ReadonlyWriteCharacteristicRequest extends WriteCharacteristicRequest with ReadonlyMessageMixin {}

class WriteCharacteristicResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('WriteCharacteristicResponse')
    ..a<WriteCharacteristicRequest>(1, 'request', PbFieldType.OM, WriteCharacteristicRequest.getDefault, WriteCharacteristicRequest.create)
    ..a<bool>(2, 'success', PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  WriteCharacteristicResponse() : super();
  WriteCharacteristicResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  WriteCharacteristicResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  WriteCharacteristicResponse clone() => new WriteCharacteristicResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static WriteCharacteristicResponse create() => new WriteCharacteristicResponse();
  static PbList<WriteCharacteristicResponse> createRepeated() => new PbList<WriteCharacteristicResponse>();
  static WriteCharacteristicResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyWriteCharacteristicResponse();
    return _defaultInstance;
  }
  static WriteCharacteristicResponse _defaultInstance;
  static void $checkItem(WriteCharacteristicResponse v) {
    if (v is! WriteCharacteristicResponse) checkItemFailed(v, 'WriteCharacteristicResponse');
  }

  WriteCharacteristicRequest get request => $_get(0, 1, null);
  set request(WriteCharacteristicRequest v) { setField(1, v); }
  bool hasRequest() => $_has(0, 1);
  void clearRequest() => clearField(1);

  bool get success => $_get(1, 2, false);
  set success(bool v) { $_setBool(1, 2, v); }
  bool hasSuccess() => $_has(1, 2);
  void clearSuccess() => clearField(2);
}

class _ReadonlyWriteCharacteristicResponse extends WriteCharacteristicResponse with ReadonlyMessageMixin {}

class WriteDescriptorRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('WriteDescriptorRequest')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'descriptorUuid', PbFieldType.OS)
    ..a<String>(3, 'serviceUuid', PbFieldType.OS)
    ..a<String>(4, 'secondaryServiceUuid', PbFieldType.OS)
    ..a<String>(5, 'characteristicUuid', PbFieldType.OS)
    ..a<List<int>>(6, 'value', PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WriteDescriptorRequest() : super();
  WriteDescriptorRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  WriteDescriptorRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  WriteDescriptorRequest clone() => new WriteDescriptorRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static WriteDescriptorRequest create() => new WriteDescriptorRequest();
  static PbList<WriteDescriptorRequest> createRepeated() => new PbList<WriteDescriptorRequest>();
  static WriteDescriptorRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyWriteDescriptorRequest();
    return _defaultInstance;
  }
  static WriteDescriptorRequest _defaultInstance;
  static void $checkItem(WriteDescriptorRequest v) {
    if (v is! WriteDescriptorRequest) checkItemFailed(v, 'WriteDescriptorRequest');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get descriptorUuid => $_get(1, 2, '');
  set descriptorUuid(String v) { $_setString(1, 2, v); }
  bool hasDescriptorUuid() => $_has(1, 2);
  void clearDescriptorUuid() => clearField(2);

  String get serviceUuid => $_get(2, 3, '');
  set serviceUuid(String v) { $_setString(2, 3, v); }
  bool hasServiceUuid() => $_has(2, 3);
  void clearServiceUuid() => clearField(3);

  String get secondaryServiceUuid => $_get(3, 4, '');
  set secondaryServiceUuid(String v) { $_setString(3, 4, v); }
  bool hasSecondaryServiceUuid() => $_has(3, 4);
  void clearSecondaryServiceUuid() => clearField(4);

  String get characteristicUuid => $_get(4, 5, '');
  set characteristicUuid(String v) { $_setString(4, 5, v); }
  bool hasCharacteristicUuid() => $_has(4, 5);
  void clearCharacteristicUuid() => clearField(5);

  List<int> get value => $_get(5, 6, null);
  set value(List<int> v) { $_setBytes(5, 6, v); }
  bool hasValue() => $_has(5, 6);
  void clearValue() => clearField(6);
}

class _ReadonlyWriteDescriptorRequest extends WriteDescriptorRequest with ReadonlyMessageMixin {}

class WriteDescriptorResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('WriteDescriptorResponse')
    ..a<WriteDescriptorRequest>(1, 'request', PbFieldType.OM, WriteDescriptorRequest.getDefault, WriteDescriptorRequest.create)
    ..a<bool>(2, 'success', PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  WriteDescriptorResponse() : super();
  WriteDescriptorResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  WriteDescriptorResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  WriteDescriptorResponse clone() => new WriteDescriptorResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static WriteDescriptorResponse create() => new WriteDescriptorResponse();
  static PbList<WriteDescriptorResponse> createRepeated() => new PbList<WriteDescriptorResponse>();
  static WriteDescriptorResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyWriteDescriptorResponse();
    return _defaultInstance;
  }
  static WriteDescriptorResponse _defaultInstance;
  static void $checkItem(WriteDescriptorResponse v) {
    if (v is! WriteDescriptorResponse) checkItemFailed(v, 'WriteDescriptorResponse');
  }

  WriteDescriptorRequest get request => $_get(0, 1, null);
  set request(WriteDescriptorRequest v) { setField(1, v); }
  bool hasRequest() => $_has(0, 1);
  void clearRequest() => clearField(1);

  bool get success => $_get(1, 2, false);
  set success(bool v) { $_setBool(1, 2, v); }
  bool hasSuccess() => $_has(1, 2);
  void clearSuccess() => clearField(2);
}

class _ReadonlyWriteDescriptorResponse extends WriteDescriptorResponse with ReadonlyMessageMixin {}

class SetNotificationRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SetNotificationRequest')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<String>(2, 'serviceUuid', PbFieldType.OS)
    ..a<String>(3, 'secondaryServiceUuid', PbFieldType.OS)
    ..a<String>(4, 'characteristicUuid', PbFieldType.OS)
    ..a<bool>(5, 'enable', PbFieldType.OB)
    ..hasRequiredFields = false
  ;

  SetNotificationRequest() : super();
  SetNotificationRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetNotificationRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetNotificationRequest clone() => new SetNotificationRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SetNotificationRequest create() => new SetNotificationRequest();
  static PbList<SetNotificationRequest> createRepeated() => new PbList<SetNotificationRequest>();
  static SetNotificationRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetNotificationRequest();
    return _defaultInstance;
  }
  static SetNotificationRequest _defaultInstance;
  static void $checkItem(SetNotificationRequest v) {
    if (v is! SetNotificationRequest) checkItemFailed(v, 'SetNotificationRequest');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  String get serviceUuid => $_get(1, 2, '');
  set serviceUuid(String v) { $_setString(1, 2, v); }
  bool hasServiceUuid() => $_has(1, 2);
  void clearServiceUuid() => clearField(2);

  String get secondaryServiceUuid => $_get(2, 3, '');
  set secondaryServiceUuid(String v) { $_setString(2, 3, v); }
  bool hasSecondaryServiceUuid() => $_has(2, 3);
  void clearSecondaryServiceUuid() => clearField(3);

  String get characteristicUuid => $_get(3, 4, '');
  set characteristicUuid(String v) { $_setString(3, 4, v); }
  bool hasCharacteristicUuid() => $_has(3, 4);
  void clearCharacteristicUuid() => clearField(4);

  bool get enable => $_get(4, 5, false);
  set enable(bool v) { $_setBool(4, 5, v); }
  bool hasEnable() => $_has(4, 5);
  void clearEnable() => clearField(5);
}

class _ReadonlySetNotificationRequest extends SetNotificationRequest with ReadonlyMessageMixin {}

class OnNotificationResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('OnNotificationResponse')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..a<BluetoothCharacteristic>(2, 'characteristic', PbFieldType.OM, BluetoothCharacteristic.getDefault, BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  OnNotificationResponse() : super();
  OnNotificationResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  OnNotificationResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  OnNotificationResponse clone() => new OnNotificationResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static OnNotificationResponse create() => new OnNotificationResponse();
  static PbList<OnNotificationResponse> createRepeated() => new PbList<OnNotificationResponse>();
  static OnNotificationResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyOnNotificationResponse();
    return _defaultInstance;
  }
  static OnNotificationResponse _defaultInstance;
  static void $checkItem(OnNotificationResponse v) {
    if (v is! OnNotificationResponse) checkItemFailed(v, 'OnNotificationResponse');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  BluetoothCharacteristic get characteristic => $_get(1, 2, null);
  set characteristic(BluetoothCharacteristic v) { setField(2, v); }
  bool hasCharacteristic() => $_has(1, 2);
  void clearCharacteristic() => clearField(2);
}

class _ReadonlyOnNotificationResponse extends OnNotificationResponse with ReadonlyMessageMixin {}

class DeviceStateResponse extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DeviceStateResponse')
    ..a<String>(1, 'remoteId', PbFieldType.OS)
    ..e<DeviceStateResponse_BluetoothDeviceState>(2, 'state', PbFieldType.OE, DeviceStateResponse_BluetoothDeviceState.DISCONNECTED, DeviceStateResponse_BluetoothDeviceState.valueOf)
    ..hasRequiredFields = false
  ;

  DeviceStateResponse() : super();
  DeviceStateResponse.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeviceStateResponse.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeviceStateResponse clone() => new DeviceStateResponse()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DeviceStateResponse create() => new DeviceStateResponse();
  static PbList<DeviceStateResponse> createRepeated() => new PbList<DeviceStateResponse>();
  static DeviceStateResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeviceStateResponse();
    return _defaultInstance;
  }
  static DeviceStateResponse _defaultInstance;
  static void $checkItem(DeviceStateResponse v) {
    if (v is! DeviceStateResponse) checkItemFailed(v, 'DeviceStateResponse');
  }

  String get remoteId => $_get(0, 1, '');
  set remoteId(String v) { $_setString(0, 1, v); }
  bool hasRemoteId() => $_has(0, 1);
  void clearRemoteId() => clearField(1);

  DeviceStateResponse_BluetoothDeviceState get state => $_get(1, 2, null);
  set state(DeviceStateResponse_BluetoothDeviceState v) { setField(2, v); }
  bool hasState() => $_has(1, 2);
  void clearState() => clearField(2);
}

class _ReadonlyDeviceStateResponse extends DeviceStateResponse with ReadonlyMessageMixin {}

