///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: library_prefixes
library flutterblue;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

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

