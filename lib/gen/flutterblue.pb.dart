///
//  Generated code. Do not modify.
//  source: flutterblue.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'flutterblue.pbenum.dart';

export 'flutterblue.pbenum.dart';

class Int32Value extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Int32Value', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Int32Value._() : super();
  factory Int32Value({
    $core.int? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory Int32Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int32Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Int32Value clone() => Int32Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Int32Value copyWith(void Function(Int32Value) updates) => super.copyWith((message) => updates(message as Int32Value)) as Int32Value; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  Int32Value createEmptyInstance() => create();
  static $pb.PbList<Int32Value> createRepeated() => $pb.PbList<Int32Value>();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class BluetoothState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BluetoothState', createEmptyInstance: create)
    ..e<BluetoothState_State>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: BluetoothState_State.UNKNOWN, valueOf: BluetoothState_State.valueOf, enumValues: BluetoothState_State.values)
    ..hasRequiredFields = false
  ;

  BluetoothState._() : super();
  factory BluetoothState({
    BluetoothState_State? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory BluetoothState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothState clone() => BluetoothState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothState copyWith(void Function(BluetoothState) updates) => super.copyWith((message) => updates(message as BluetoothState)) as BluetoothState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothState create() => BluetoothState._();
  BluetoothState createEmptyInstance() => create();
  static $pb.PbList<BluetoothState> createRepeated() => $pb.PbList<BluetoothState>();
  @$core.pragma('dart2js:noInline')
  static BluetoothState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothState>(create);
  static BluetoothState? _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothState_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(BluetoothState_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

class AdvertisementData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AdvertisementData', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'localName')
    ..aOM<Int32Value>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txPowerLevel', subBuilder: Int32Value.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectable')
    ..m<$core.int, $core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'manufacturerData', entryClassName: 'AdvertisementData.ManufacturerDataEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceData', entryClassName: 'AdvertisementData.ServiceDataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OY)
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuids')
    ..hasRequiredFields = false
  ;

  AdvertisementData._() : super();
  factory AdvertisementData({
    $core.String? localName,
    Int32Value? txPowerLevel,
    $core.bool? connectable,
    $core.Map<$core.int, $core.List<$core.int>>? manufacturerData,
    $core.Map<$core.String, $core.List<$core.int>>? serviceData,
    $core.Iterable<$core.String>? serviceUuids,
  }) {
    final _result = create();
    if (localName != null) {
      _result.localName = localName;
    }
    if (txPowerLevel != null) {
      _result.txPowerLevel = txPowerLevel;
    }
    if (connectable != null) {
      _result.connectable = connectable;
    }
    if (manufacturerData != null) {
      _result.manufacturerData.addAll(manufacturerData);
    }
    if (serviceData != null) {
      _result.serviceData.addAll(serviceData);
    }
    if (serviceUuids != null) {
      _result.serviceUuids.addAll(serviceUuids);
    }
    return _result;
  }
  factory AdvertisementData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdvertisementData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdvertisementData clone() => AdvertisementData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdvertisementData copyWith(void Function(AdvertisementData) updates) => super.copyWith((message) => updates(message as AdvertisementData)) as AdvertisementData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdvertisementData create() => AdvertisementData._();
  AdvertisementData createEmptyInstance() => create();
  static $pb.PbList<AdvertisementData> createRepeated() => $pb.PbList<AdvertisementData>();
  @$core.pragma('dart2js:noInline')
  static AdvertisementData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdvertisementData>(create);
  static AdvertisementData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localName => $_getSZ(0);
  @$pb.TagNumber(1)
  set localName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalName() => clearField(1);

  @$pb.TagNumber(2)
  Int32Value get txPowerLevel => $_getN(1);
  @$pb.TagNumber(2)
  set txPowerLevel(Int32Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxPowerLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxPowerLevel() => clearField(2);
  @$pb.TagNumber(2)
  Int32Value ensureTxPowerLevel() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get connectable => $_getBF(2);
  @$pb.TagNumber(3)
  set connectable($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectable() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectable() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.int, $core.List<$core.int>> get manufacturerData => $_getMap(3);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.List<$core.int>> get serviceData => $_getMap(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get serviceUuids => $_getList(5);
}

class ScanSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScanSettings', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'androidScanMode', $pb.PbFieldType.O3)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuids')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowDuplicates')
    ..hasRequiredFields = false
  ;

  ScanSettings._() : super();
  factory ScanSettings({
    $core.int? androidScanMode,
    $core.Iterable<$core.String>? serviceUuids,
    $core.bool? allowDuplicates,
  }) {
    final _result = create();
    if (androidScanMode != null) {
      _result.androidScanMode = androidScanMode;
    }
    if (serviceUuids != null) {
      _result.serviceUuids.addAll(serviceUuids);
    }
    if (allowDuplicates != null) {
      _result.allowDuplicates = allowDuplicates;
    }
    return _result;
  }
  factory ScanSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScanSettings clone() => ScanSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScanSettings copyWith(void Function(ScanSettings) updates) => super.copyWith((message) => updates(message as ScanSettings)) as ScanSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanSettings create() => ScanSettings._();
  ScanSettings createEmptyInstance() => create();
  static $pb.PbList<ScanSettings> createRepeated() => $pb.PbList<ScanSettings>();
  @$core.pragma('dart2js:noInline')
  static ScanSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanSettings>(create);
  static ScanSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get androidScanMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set androidScanMode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAndroidScanMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAndroidScanMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get serviceUuids => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get allowDuplicates => $_getBF(2);
  @$pb.TagNumber(3)
  set allowDuplicates($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAllowDuplicates() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowDuplicates() => clearField(3);
}

class ScanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScanResult', createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: BluetoothDevice.create)
    ..aOM<AdvertisementData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'advertisementData', subBuilder: AdvertisementData.create)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rssi', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ScanResult._() : super();
  factory ScanResult({
    BluetoothDevice? device,
    AdvertisementData? advertisementData,
    $core.int? rssi,
  }) {
    final _result = create();
    if (device != null) {
      _result.device = device;
    }
    if (advertisementData != null) {
      _result.advertisementData = advertisementData;
    }
    if (rssi != null) {
      _result.rssi = rssi;
    }
    return _result;
  }
  factory ScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScanResult clone() => ScanResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScanResult copyWith(void Function(ScanResult) updates) => super.copyWith((message) => updates(message as ScanResult)) as ScanResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanResult create() => ScanResult._();
  ScanResult createEmptyInstance() => create();
  static $pb.PbList<ScanResult> createRepeated() => $pb.PbList<ScanResult>();
  @$core.pragma('dart2js:noInline')
  static ScanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanResult>(create);
  static ScanResult? _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothDevice get device => $_getN(0);
  @$pb.TagNumber(1)
  set device(BluetoothDevice v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  BluetoothDevice ensureDevice() => $_ensure(0);

  @$pb.TagNumber(2)
  AdvertisementData get advertisementData => $_getN(1);
  @$pb.TagNumber(2)
  set advertisementData(AdvertisementData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdvertisementData() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdvertisementData() => clearField(2);
  @$pb.TagNumber(2)
  AdvertisementData ensureAdvertisementData() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get rssi => $_getIZ(2);
  @$pb.TagNumber(3)
  set rssi($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRssi() => $_has(2);
  @$pb.TagNumber(3)
  void clearRssi() => clearField(3);
}

class ConnectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'androidAutoConnect')
    ..hasRequiredFields = false
  ;

  ConnectRequest._() : super();
  factory ConnectRequest({
    $core.String? remoteId,
    $core.bool? androidAutoConnect,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (androidAutoConnect != null) {
      _result.androidAutoConnect = androidAutoConnect;
    }
    return _result;
  }
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest)) as ConnectRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get androidAutoConnect => $_getBF(1);
  @$pb.TagNumber(2)
  set androidAutoConnect($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAndroidAutoConnect() => $_has(1);
  @$pb.TagNumber(2)
  void clearAndroidAutoConnect() => clearField(2);
}

class BluetoothDevice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BluetoothDevice', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<BluetoothDevice_Type>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: BluetoothDevice_Type.UNKNOWN, valueOf: BluetoothDevice_Type.valueOf, enumValues: BluetoothDevice_Type.values)
    ..hasRequiredFields = false
  ;

  BluetoothDevice._() : super();
  factory BluetoothDevice({
    $core.String? remoteId,
    $core.String? name,
    BluetoothDevice_Type? type,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory BluetoothDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothDevice clone() => BluetoothDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothDevice copyWith(void Function(BluetoothDevice) updates) => super.copyWith((message) => updates(message as BluetoothDevice)) as BluetoothDevice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice create() => BluetoothDevice._();
  BluetoothDevice createEmptyInstance() => create();
  static $pb.PbList<BluetoothDevice> createRepeated() => $pb.PbList<BluetoothDevice>();
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothDevice>(create);
  static BluetoothDevice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  BluetoothDevice_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(BluetoothDevice_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class BluetoothService extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BluetoothService', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isPrimary')
    ..pc<BluetoothCharacteristic>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristics', $pb.PbFieldType.PM, subBuilder: BluetoothCharacteristic.create)
    ..pc<BluetoothService>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'includedServices', $pb.PbFieldType.PM, subBuilder: BluetoothService.create)
    ..hasRequiredFields = false
  ;

  BluetoothService._() : super();
  factory BluetoothService({
    $core.String? uuid,
    $core.String? remoteId,
    $core.bool? isPrimary,
    $core.Iterable<BluetoothCharacteristic>? characteristics,
    $core.Iterable<BluetoothService>? includedServices,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (isPrimary != null) {
      _result.isPrimary = isPrimary;
    }
    if (characteristics != null) {
      _result.characteristics.addAll(characteristics);
    }
    if (includedServices != null) {
      _result.includedServices.addAll(includedServices);
    }
    return _result;
  }
  factory BluetoothService.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothService.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothService clone() => BluetoothService()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothService copyWith(void Function(BluetoothService) updates) => super.copyWith((message) => updates(message as BluetoothService)) as BluetoothService; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothService create() => BluetoothService._();
  BluetoothService createEmptyInstance() => create();
  static $pb.PbList<BluetoothService> createRepeated() => $pb.PbList<BluetoothService>();
  @$core.pragma('dart2js:noInline')
  static BluetoothService getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothService>(create);
  static BluetoothService? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isPrimary => $_getBF(2);
  @$pb.TagNumber(3)
  set isPrimary($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsPrimary() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsPrimary() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<BluetoothCharacteristic> get characteristics => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<BluetoothService> get includedServices => $_getList(4);
}

class BluetoothCharacteristic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BluetoothCharacteristic', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondaryServiceUuid', protoName: 'secondaryServiceUuid')
    ..pc<BluetoothDescriptor>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descriptors', $pb.PbFieldType.PM, subBuilder: BluetoothDescriptor.create)
    ..aOM<CharacteristicProperties>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'properties', subBuilder: CharacteristicProperties.create)
    ..a<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BluetoothCharacteristic._() : super();
  factory BluetoothCharacteristic({
    $core.String? uuid,
    $core.String? remoteId,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.Iterable<BluetoothDescriptor>? descriptors,
    CharacteristicProperties? properties,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      _result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (descriptors != null) {
      _result.descriptors.addAll(descriptors);
    }
    if (properties != null) {
      _result.properties = properties;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory BluetoothCharacteristic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothCharacteristic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothCharacteristic clone() => BluetoothCharacteristic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothCharacteristic copyWith(void Function(BluetoothCharacteristic) updates) => super.copyWith((message) => updates(message as BluetoothCharacteristic)) as BluetoothCharacteristic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothCharacteristic create() => BluetoothCharacteristic._();
  BluetoothCharacteristic createEmptyInstance() => create();
  static $pb.PbList<BluetoothCharacteristic> createRepeated() => $pb.PbList<BluetoothCharacteristic>();
  @$core.pragma('dart2js:noInline')
  static BluetoothCharacteristic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothCharacteristic>(create);
  static BluetoothCharacteristic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secondaryServiceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set secondaryServiceUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecondaryServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondaryServiceUuid() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<BluetoothDescriptor> get descriptors => $_getList(4);

  @$pb.TagNumber(6)
  CharacteristicProperties get properties => $_getN(5);
  @$pb.TagNumber(6)
  set properties(CharacteristicProperties v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasProperties() => $_has(5);
  @$pb.TagNumber(6)
  void clearProperties() => clearField(6);
  @$pb.TagNumber(6)
  CharacteristicProperties ensureProperties() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get value => $_getN(6);
  @$pb.TagNumber(7)
  set value($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearValue() => clearField(7);
}

class BluetoothDescriptor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BluetoothDescriptor', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristicUuid', protoName: 'characteristicUuid')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BluetoothDescriptor._() : super();
  factory BluetoothDescriptor({
    $core.String? uuid,
    $core.String? remoteId,
    $core.String? serviceUuid,
    $core.String? characteristicUuid,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (characteristicUuid != null) {
      _result.characteristicUuid = characteristicUuid;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory BluetoothDescriptor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDescriptor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothDescriptor clone() => BluetoothDescriptor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothDescriptor copyWith(void Function(BluetoothDescriptor) updates) => super.copyWith((message) => updates(message as BluetoothDescriptor)) as BluetoothDescriptor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothDescriptor create() => BluetoothDescriptor._();
  BluetoothDescriptor createEmptyInstance() => create();
  static $pb.PbList<BluetoothDescriptor> createRepeated() => $pb.PbList<BluetoothDescriptor>();
  @$core.pragma('dart2js:noInline')
  static BluetoothDescriptor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothDescriptor>(create);
  static BluetoothDescriptor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get characteristicUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set characteristicUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCharacteristicUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCharacteristicUuid() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get value => $_getN(4);
  @$pb.TagNumber(5)
  set value($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);
}

class CharacteristicProperties extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacteristicProperties', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'broadcast')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'read')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'writeWithoutResponse')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'write')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notify')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indicate')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenticatedSignedWrites')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extendedProperties')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notifyEncryptionRequired')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indicateEncryptionRequired')
    ..hasRequiredFields = false
  ;

  CharacteristicProperties._() : super();
  factory CharacteristicProperties({
    $core.bool? broadcast,
    $core.bool? read,
    $core.bool? writeWithoutResponse,
    $core.bool? write,
    $core.bool? notify,
    $core.bool? indicate,
    $core.bool? authenticatedSignedWrites,
    $core.bool? extendedProperties,
    $core.bool? notifyEncryptionRequired,
    $core.bool? indicateEncryptionRequired,
  }) {
    final _result = create();
    if (broadcast != null) {
      _result.broadcast = broadcast;
    }
    if (read != null) {
      _result.read = read;
    }
    if (writeWithoutResponse != null) {
      _result.writeWithoutResponse = writeWithoutResponse;
    }
    if (write != null) {
      _result.write = write;
    }
    if (notify != null) {
      _result.notify = notify;
    }
    if (indicate != null) {
      _result.indicate = indicate;
    }
    if (authenticatedSignedWrites != null) {
      _result.authenticatedSignedWrites = authenticatedSignedWrites;
    }
    if (extendedProperties != null) {
      _result.extendedProperties = extendedProperties;
    }
    if (notifyEncryptionRequired != null) {
      _result.notifyEncryptionRequired = notifyEncryptionRequired;
    }
    if (indicateEncryptionRequired != null) {
      _result.indicateEncryptionRequired = indicateEncryptionRequired;
    }
    return _result;
  }
  factory CharacteristicProperties.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacteristicProperties.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacteristicProperties clone() => CharacteristicProperties()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacteristicProperties copyWith(void Function(CharacteristicProperties) updates) => super.copyWith((message) => updates(message as CharacteristicProperties)) as CharacteristicProperties; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacteristicProperties create() => CharacteristicProperties._();
  CharacteristicProperties createEmptyInstance() => create();
  static $pb.PbList<CharacteristicProperties> createRepeated() => $pb.PbList<CharacteristicProperties>();
  @$core.pragma('dart2js:noInline')
  static CharacteristicProperties getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacteristicProperties>(create);
  static CharacteristicProperties? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get broadcast => $_getBF(0);
  @$pb.TagNumber(1)
  set broadcast($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBroadcast() => $_has(0);
  @$pb.TagNumber(1)
  void clearBroadcast() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get read => $_getBF(1);
  @$pb.TagNumber(2)
  set read($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRead() => $_has(1);
  @$pb.TagNumber(2)
  void clearRead() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get writeWithoutResponse => $_getBF(2);
  @$pb.TagNumber(3)
  set writeWithoutResponse($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWriteWithoutResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearWriteWithoutResponse() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get write => $_getBF(3);
  @$pb.TagNumber(4)
  set write($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWrite() => $_has(3);
  @$pb.TagNumber(4)
  void clearWrite() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get notify => $_getBF(4);
  @$pb.TagNumber(5)
  set notify($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotify() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotify() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get indicate => $_getBF(5);
  @$pb.TagNumber(6)
  set indicate($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIndicate() => $_has(5);
  @$pb.TagNumber(6)
  void clearIndicate() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get authenticatedSignedWrites => $_getBF(6);
  @$pb.TagNumber(7)
  set authenticatedSignedWrites($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAuthenticatedSignedWrites() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthenticatedSignedWrites() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get extendedProperties => $_getBF(7);
  @$pb.TagNumber(8)
  set extendedProperties($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasExtendedProperties() => $_has(7);
  @$pb.TagNumber(8)
  void clearExtendedProperties() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get notifyEncryptionRequired => $_getBF(8);
  @$pb.TagNumber(9)
  set notifyEncryptionRequired($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNotifyEncryptionRequired() => $_has(8);
  @$pb.TagNumber(9)
  void clearNotifyEncryptionRequired() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get indicateEncryptionRequired => $_getBF(9);
  @$pb.TagNumber(10)
  set indicateEncryptionRequired($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIndicateEncryptionRequired() => $_has(9);
  @$pb.TagNumber(10)
  void clearIndicateEncryptionRequired() => clearField(10);
}

class DiscoverServicesResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiscoverServicesResult', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..pc<BluetoothService>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'services', $pb.PbFieldType.PM, subBuilder: BluetoothService.create)
    ..hasRequiredFields = false
  ;

  DiscoverServicesResult._() : super();
  factory DiscoverServicesResult({
    $core.String? remoteId,
    $core.Iterable<BluetoothService>? services,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (services != null) {
      _result.services.addAll(services);
    }
    return _result;
  }
  factory DiscoverServicesResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoverServicesResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscoverServicesResult clone() => DiscoverServicesResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscoverServicesResult copyWith(void Function(DiscoverServicesResult) updates) => super.copyWith((message) => updates(message as DiscoverServicesResult)) as DiscoverServicesResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoverServicesResult create() => DiscoverServicesResult._();
  DiscoverServicesResult createEmptyInstance() => create();
  static $pb.PbList<DiscoverServicesResult> createRepeated() => $pb.PbList<DiscoverServicesResult>();
  @$core.pragma('dart2js:noInline')
  static DiscoverServicesResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoverServicesResult>(create);
  static DiscoverServicesResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<BluetoothService> get services => $_getList(1);
}

class ReadCharacteristicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadCharacteristicRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristicUuid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondaryServiceUuid')
    ..hasRequiredFields = false
  ;

  ReadCharacteristicRequest._() : super();
  factory ReadCharacteristicRequest({
    $core.String? remoteId,
    $core.String? characteristicUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (characteristicUuid != null) {
      _result.characteristicUuid = characteristicUuid;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      _result.secondaryServiceUuid = secondaryServiceUuid;
    }
    return _result;
  }
  factory ReadCharacteristicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCharacteristicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadCharacteristicRequest clone() => ReadCharacteristicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadCharacteristicRequest copyWith(void Function(ReadCharacteristicRequest) updates) => super.copyWith((message) => updates(message as ReadCharacteristicRequest)) as ReadCharacteristicRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicRequest create() => ReadCharacteristicRequest._();
  ReadCharacteristicRequest createEmptyInstance() => create();
  static $pb.PbList<ReadCharacteristicRequest> createRepeated() => $pb.PbList<ReadCharacteristicRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadCharacteristicRequest>(create);
  static ReadCharacteristicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get characteristicUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set characteristicUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharacteristicUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacteristicUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secondaryServiceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set secondaryServiceUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecondaryServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondaryServiceUuid() => clearField(4);
}

class ReadCharacteristicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadCharacteristicResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  ReadCharacteristicResponse._() : super();
  factory ReadCharacteristicResponse({
    $core.String? remoteId,
    BluetoothCharacteristic? characteristic,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (characteristic != null) {
      _result.characteristic = characteristic;
    }
    return _result;
  }
  factory ReadCharacteristicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCharacteristicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadCharacteristicResponse clone() => ReadCharacteristicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadCharacteristicResponse copyWith(void Function(ReadCharacteristicResponse) updates) => super.copyWith((message) => updates(message as ReadCharacteristicResponse)) as ReadCharacteristicResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicResponse create() => ReadCharacteristicResponse._();
  ReadCharacteristicResponse createEmptyInstance() => create();
  static $pb.PbList<ReadCharacteristicResponse> createRepeated() => $pb.PbList<ReadCharacteristicResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadCharacteristicResponse>(create);
  static ReadCharacteristicResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  BluetoothCharacteristic get characteristic => $_getN(1);
  @$pb.TagNumber(2)
  set characteristic(BluetoothCharacteristic v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharacteristic() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacteristic() => clearField(2);
  @$pb.TagNumber(2)
  BluetoothCharacteristic ensureCharacteristic() => $_ensure(1);
}

class ReadDescriptorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadDescriptorRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descriptorUuid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondaryServiceUuid')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristicUuid')
    ..hasRequiredFields = false
  ;

  ReadDescriptorRequest._() : super();
  factory ReadDescriptorRequest({
    $core.String? remoteId,
    $core.String? descriptorUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.String? characteristicUuid,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (descriptorUuid != null) {
      _result.descriptorUuid = descriptorUuid;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      _result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (characteristicUuid != null) {
      _result.characteristicUuid = characteristicUuid;
    }
    return _result;
  }
  factory ReadDescriptorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDescriptorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadDescriptorRequest clone() => ReadDescriptorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadDescriptorRequest copyWith(void Function(ReadDescriptorRequest) updates) => super.copyWith((message) => updates(message as ReadDescriptorRequest)) as ReadDescriptorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorRequest create() => ReadDescriptorRequest._();
  ReadDescriptorRequest createEmptyInstance() => create();
  static $pb.PbList<ReadDescriptorRequest> createRepeated() => $pb.PbList<ReadDescriptorRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadDescriptorRequest>(create);
  static ReadDescriptorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get descriptorUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set descriptorUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescriptorUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescriptorUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secondaryServiceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set secondaryServiceUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecondaryServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondaryServiceUuid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get characteristicUuid => $_getSZ(4);
  @$pb.TagNumber(5)
  set characteristicUuid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCharacteristicUuid() => $_has(4);
  @$pb.TagNumber(5)
  void clearCharacteristicUuid() => clearField(5);
}

class ReadDescriptorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReadDescriptorResponse', createEmptyInstance: create)
    ..aOM<ReadDescriptorRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'request', subBuilder: ReadDescriptorRequest.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ReadDescriptorResponse._() : super();
  factory ReadDescriptorResponse({
    ReadDescriptorRequest? request,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (request != null) {
      _result.request = request;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ReadDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadDescriptorResponse clone() => ReadDescriptorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadDescriptorResponse copyWith(void Function(ReadDescriptorResponse) updates) => super.copyWith((message) => updates(message as ReadDescriptorResponse)) as ReadDescriptorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorResponse create() => ReadDescriptorResponse._();
  ReadDescriptorResponse createEmptyInstance() => create();
  static $pb.PbList<ReadDescriptorResponse> createRepeated() => $pb.PbList<ReadDescriptorResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadDescriptorResponse>(create);
  static ReadDescriptorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ReadDescriptorRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(ReadDescriptorRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => clearField(1);
  @$pb.TagNumber(1)
  ReadDescriptorRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class WriteCharacteristicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WriteCharacteristicRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristicUuid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondaryServiceUuid')
    ..e<WriteCharacteristicRequest_WriteType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'writeType', $pb.PbFieldType.OE, defaultOrMaker: WriteCharacteristicRequest_WriteType.WITH_RESPONSE, valueOf: WriteCharacteristicRequest_WriteType.valueOf, enumValues: WriteCharacteristicRequest_WriteType.values)
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WriteCharacteristicRequest._() : super();
  factory WriteCharacteristicRequest({
    $core.String? remoteId,
    $core.String? characteristicUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    WriteCharacteristicRequest_WriteType? writeType,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (characteristicUuid != null) {
      _result.characteristicUuid = characteristicUuid;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      _result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (writeType != null) {
      _result.writeType = writeType;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory WriteCharacteristicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacteristicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteCharacteristicRequest clone() => WriteCharacteristicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteCharacteristicRequest copyWith(void Function(WriteCharacteristicRequest) updates) => super.copyWith((message) => updates(message as WriteCharacteristicRequest)) as WriteCharacteristicRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicRequest create() => WriteCharacteristicRequest._();
  WriteCharacteristicRequest createEmptyInstance() => create();
  static $pb.PbList<WriteCharacteristicRequest> createRepeated() => $pb.PbList<WriteCharacteristicRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteCharacteristicRequest>(create);
  static WriteCharacteristicRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get characteristicUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set characteristicUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharacteristicUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacteristicUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secondaryServiceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set secondaryServiceUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecondaryServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondaryServiceUuid() => clearField(4);

  @$pb.TagNumber(5)
  WriteCharacteristicRequest_WriteType get writeType => $_getN(4);
  @$pb.TagNumber(5)
  set writeType(WriteCharacteristicRequest_WriteType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasWriteType() => $_has(4);
  @$pb.TagNumber(5)
  void clearWriteType() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get value => $_getN(5);
  @$pb.TagNumber(6)
  set value($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearValue() => clearField(6);
}

class WriteCharacteristicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WriteCharacteristicResponse', createEmptyInstance: create)
    ..aOM<WriteCharacteristicRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'request', subBuilder: WriteCharacteristicRequest.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  WriteCharacteristicResponse._() : super();
  factory WriteCharacteristicResponse({
    WriteCharacteristicRequest? request,
    $core.bool? success,
  }) {
    final _result = create();
    if (request != null) {
      _result.request = request;
    }
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory WriteCharacteristicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacteristicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteCharacteristicResponse clone() => WriteCharacteristicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteCharacteristicResponse copyWith(void Function(WriteCharacteristicResponse) updates) => super.copyWith((message) => updates(message as WriteCharacteristicResponse)) as WriteCharacteristicResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicResponse create() => WriteCharacteristicResponse._();
  WriteCharacteristicResponse createEmptyInstance() => create();
  static $pb.PbList<WriteCharacteristicResponse> createRepeated() => $pb.PbList<WriteCharacteristicResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteCharacteristicResponse>(create);
  static WriteCharacteristicResponse? _defaultInstance;

  @$pb.TagNumber(1)
  WriteCharacteristicRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(WriteCharacteristicRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => clearField(1);
  @$pb.TagNumber(1)
  WriteCharacteristicRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class WriteDescriptorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WriteDescriptorRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descriptorUuid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondaryServiceUuid')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristicUuid')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WriteDescriptorRequest._() : super();
  factory WriteDescriptorRequest({
    $core.String? remoteId,
    $core.String? descriptorUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.String? characteristicUuid,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (descriptorUuid != null) {
      _result.descriptorUuid = descriptorUuid;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      _result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (characteristicUuid != null) {
      _result.characteristicUuid = characteristicUuid;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory WriteDescriptorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteDescriptorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteDescriptorRequest clone() => WriteDescriptorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteDescriptorRequest copyWith(void Function(WriteDescriptorRequest) updates) => super.copyWith((message) => updates(message as WriteDescriptorRequest)) as WriteDescriptorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorRequest create() => WriteDescriptorRequest._();
  WriteDescriptorRequest createEmptyInstance() => create();
  static $pb.PbList<WriteDescriptorRequest> createRepeated() => $pb.PbList<WriteDescriptorRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteDescriptorRequest>(create);
  static WriteDescriptorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get descriptorUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set descriptorUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescriptorUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescriptorUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get serviceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set serviceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secondaryServiceUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set secondaryServiceUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecondaryServiceUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondaryServiceUuid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get characteristicUuid => $_getSZ(4);
  @$pb.TagNumber(5)
  set characteristicUuid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCharacteristicUuid() => $_has(4);
  @$pb.TagNumber(5)
  void clearCharacteristicUuid() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get value => $_getN(5);
  @$pb.TagNumber(6)
  set value($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearValue() => clearField(6);
}

class WriteDescriptorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WriteDescriptorResponse', createEmptyInstance: create)
    ..aOM<WriteDescriptorRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'request', subBuilder: WriteDescriptorRequest.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  WriteDescriptorResponse._() : super();
  factory WriteDescriptorResponse({
    WriteDescriptorRequest? request,
    $core.bool? success,
  }) {
    final _result = create();
    if (request != null) {
      _result.request = request;
    }
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory WriteDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteDescriptorResponse clone() => WriteDescriptorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteDescriptorResponse copyWith(void Function(WriteDescriptorResponse) updates) => super.copyWith((message) => updates(message as WriteDescriptorResponse)) as WriteDescriptorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorResponse create() => WriteDescriptorResponse._();
  WriteDescriptorResponse createEmptyInstance() => create();
  static $pb.PbList<WriteDescriptorResponse> createRepeated() => $pb.PbList<WriteDescriptorResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteDescriptorResponse>(create);
  static WriteDescriptorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  WriteDescriptorRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request(WriteDescriptorRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => clearField(1);
  @$pb.TagNumber(1)
  WriteDescriptorRequest ensureRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class SetNotificationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetNotificationRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serviceUuid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secondaryServiceUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristicUuid')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enable')
    ..hasRequiredFields = false
  ;

  SetNotificationRequest._() : super();
  factory SetNotificationRequest({
    $core.String? remoteId,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.String? characteristicUuid,
    $core.bool? enable,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (serviceUuid != null) {
      _result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      _result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (characteristicUuid != null) {
      _result.characteristicUuid = characteristicUuid;
    }
    if (enable != null) {
      _result.enable = enable;
    }
    return _result;
  }
  factory SetNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetNotificationRequest clone() => SetNotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetNotificationRequest copyWith(void Function(SetNotificationRequest) updates) => super.copyWith((message) => updates(message as SetNotificationRequest)) as SetNotificationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetNotificationRequest create() => SetNotificationRequest._();
  SetNotificationRequest createEmptyInstance() => create();
  static $pb.PbList<SetNotificationRequest> createRepeated() => $pb.PbList<SetNotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static SetNotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetNotificationRequest>(create);
  static SetNotificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serviceUuid => $_getSZ(1);
  @$pb.TagNumber(2)
  set serviceUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServiceUuid() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceUuid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secondaryServiceUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set secondaryServiceUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecondaryServiceUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecondaryServiceUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get characteristicUuid => $_getSZ(3);
  @$pb.TagNumber(4)
  set characteristicUuid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCharacteristicUuid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCharacteristicUuid() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get enable => $_getBF(4);
  @$pb.TagNumber(5)
  set enable($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEnable() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnable() => clearField(5);
}

class SetNotificationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetNotificationResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  SetNotificationResponse._() : super();
  factory SetNotificationResponse({
    $core.String? remoteId,
    BluetoothCharacteristic? characteristic,
    $core.bool? success,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (characteristic != null) {
      _result.characteristic = characteristic;
    }
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory SetNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetNotificationResponse clone() => SetNotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetNotificationResponse copyWith(void Function(SetNotificationResponse) updates) => super.copyWith((message) => updates(message as SetNotificationResponse)) as SetNotificationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetNotificationResponse create() => SetNotificationResponse._();
  SetNotificationResponse createEmptyInstance() => create();
  static $pb.PbList<SetNotificationResponse> createRepeated() => $pb.PbList<SetNotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static SetNotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetNotificationResponse>(create);
  static SetNotificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  BluetoothCharacteristic get characteristic => $_getN(1);
  @$pb.TagNumber(2)
  set characteristic(BluetoothCharacteristic v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharacteristic() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacteristic() => clearField(2);
  @$pb.TagNumber(2)
  BluetoothCharacteristic ensureCharacteristic() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class OnCharacteristicChanged extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OnCharacteristicChanged', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  OnCharacteristicChanged._() : super();
  factory OnCharacteristicChanged({
    $core.String? remoteId,
    BluetoothCharacteristic? characteristic,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (characteristic != null) {
      _result.characteristic = characteristic;
    }
    return _result;
  }
  factory OnCharacteristicChanged.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnCharacteristicChanged.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnCharacteristicChanged clone() => OnCharacteristicChanged()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnCharacteristicChanged copyWith(void Function(OnCharacteristicChanged) updates) => super.copyWith((message) => updates(message as OnCharacteristicChanged)) as OnCharacteristicChanged; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OnCharacteristicChanged create() => OnCharacteristicChanged._();
  OnCharacteristicChanged createEmptyInstance() => create();
  static $pb.PbList<OnCharacteristicChanged> createRepeated() => $pb.PbList<OnCharacteristicChanged>();
  @$core.pragma('dart2js:noInline')
  static OnCharacteristicChanged getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnCharacteristicChanged>(create);
  static OnCharacteristicChanged? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  BluetoothCharacteristic get characteristic => $_getN(1);
  @$pb.TagNumber(2)
  set characteristic(BluetoothCharacteristic v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCharacteristic() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharacteristic() => clearField(2);
  @$pb.TagNumber(2)
  BluetoothCharacteristic ensureCharacteristic() => $_ensure(1);
}

class DeviceStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeviceStateResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..e<DeviceStateResponse_BluetoothDeviceState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: DeviceStateResponse_BluetoothDeviceState.DISCONNECTED, valueOf: DeviceStateResponse_BluetoothDeviceState.valueOf, enumValues: DeviceStateResponse_BluetoothDeviceState.values)
    ..hasRequiredFields = false
  ;

  DeviceStateResponse._() : super();
  factory DeviceStateResponse({
    $core.String? remoteId,
    DeviceStateResponse_BluetoothDeviceState? state,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory DeviceStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceStateResponse clone() => DeviceStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceStateResponse copyWith(void Function(DeviceStateResponse) updates) => super.copyWith((message) => updates(message as DeviceStateResponse)) as DeviceStateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceStateResponse create() => DeviceStateResponse._();
  DeviceStateResponse createEmptyInstance() => create();
  static $pb.PbList<DeviceStateResponse> createRepeated() => $pb.PbList<DeviceStateResponse>();
  @$core.pragma('dart2js:noInline')
  static DeviceStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceStateResponse>(create);
  static DeviceStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  DeviceStateResponse_BluetoothDeviceState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(DeviceStateResponse_BluetoothDeviceState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class ConnectedDevicesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectedDevicesResponse', createEmptyInstance: create)
    ..pc<BluetoothDevice>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: BluetoothDevice.create)
    ..hasRequiredFields = false
  ;

  ConnectedDevicesResponse._() : super();
  factory ConnectedDevicesResponse({
    $core.Iterable<BluetoothDevice>? devices,
  }) {
    final _result = create();
    if (devices != null) {
      _result.devices.addAll(devices);
    }
    return _result;
  }
  factory ConnectedDevicesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectedDevicesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectedDevicesResponse clone() => ConnectedDevicesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectedDevicesResponse copyWith(void Function(ConnectedDevicesResponse) updates) => super.copyWith((message) => updates(message as ConnectedDevicesResponse)) as ConnectedDevicesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectedDevicesResponse create() => ConnectedDevicesResponse._();
  ConnectedDevicesResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectedDevicesResponse> createRepeated() => $pb.PbList<ConnectedDevicesResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectedDevicesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectedDevicesResponse>(create);
  static ConnectedDevicesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BluetoothDevice> get devices => $_getList(0);
}

class MtuSizeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MtuSizeRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mtu', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  MtuSizeRequest._() : super();
  factory MtuSizeRequest({
    $core.String? remoteId,
    $core.int? mtu,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (mtu != null) {
      _result.mtu = mtu;
    }
    return _result;
  }
  factory MtuSizeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MtuSizeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MtuSizeRequest clone() => MtuSizeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MtuSizeRequest copyWith(void Function(MtuSizeRequest) updates) => super.copyWith((message) => updates(message as MtuSizeRequest)) as MtuSizeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MtuSizeRequest create() => MtuSizeRequest._();
  MtuSizeRequest createEmptyInstance() => create();
  static $pb.PbList<MtuSizeRequest> createRepeated() => $pb.PbList<MtuSizeRequest>();
  @$core.pragma('dart2js:noInline')
  static MtuSizeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MtuSizeRequest>(create);
  static MtuSizeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mtu => $_getIZ(1);
  @$pb.TagNumber(2)
  set mtu($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMtu() => $_has(1);
  @$pb.TagNumber(2)
  void clearMtu() => clearField(2);
}

class MtuSizeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MtuSizeResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mtu', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  MtuSizeResponse._() : super();
  factory MtuSizeResponse({
    $core.String? remoteId,
    $core.int? mtu,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (mtu != null) {
      _result.mtu = mtu;
    }
    return _result;
  }
  factory MtuSizeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MtuSizeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MtuSizeResponse clone() => MtuSizeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MtuSizeResponse copyWith(void Function(MtuSizeResponse) updates) => super.copyWith((message) => updates(message as MtuSizeResponse)) as MtuSizeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MtuSizeResponse create() => MtuSizeResponse._();
  MtuSizeResponse createEmptyInstance() => create();
  static $pb.PbList<MtuSizeResponse> createRepeated() => $pb.PbList<MtuSizeResponse>();
  @$core.pragma('dart2js:noInline')
  static MtuSizeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MtuSizeResponse>(create);
  static MtuSizeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mtu => $_getIZ(1);
  @$pb.TagNumber(2)
  set mtu($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMtu() => $_has(1);
  @$pb.TagNumber(2)
  void clearMtu() => clearField(2);
}

