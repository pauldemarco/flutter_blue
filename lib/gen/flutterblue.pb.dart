//
//  Generated code. Do not modify.
//  source: flutterblue.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'flutterblue.pbenum.dart';

export 'flutterblue.pbenum.dart';

///  Wrapper message for `int32`.
///
///  Allows for nullability of fields in messages
class Int32Value extends $pb.GeneratedMessage {
  factory Int32Value({
    $core.int? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  Int32Value._() : super();
  factory Int32Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int32Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Int32Value', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Int32Value clone() => Int32Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Int32Value copyWith(void Function(Int32Value) updates) => super.copyWith((message) => updates(message as Int32Value)) as Int32Value;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  Int32Value createEmptyInstance() => create();
  static $pb.PbList<Int32Value> createRepeated() => $pb.PbList<Int32Value>();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value? _defaultInstance;

  /// The int32 value.
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
  factory BluetoothState({
    BluetoothState_State? state,
  }) {
    final $result = create();
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  BluetoothState._() : super();
  factory BluetoothState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BluetoothState', createEmptyInstance: create)
    ..e<BluetoothState_State>(1, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: BluetoothState_State.UNKNOWN, valueOf: BluetoothState_State.valueOf, enumValues: BluetoothState_State.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothState clone() => BluetoothState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothState copyWith(void Function(BluetoothState) updates) => super.copyWith((message) => updates(message as BluetoothState)) as BluetoothState;

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
  factory AdvertisementData({
    $core.String? localName,
    Int32Value? txPowerLevel,
    $core.bool? connectable,
    $core.Map<$core.int, $core.List<$core.int>>? manufacturerData,
    $core.Map<$core.String, $core.List<$core.int>>? serviceData,
    $core.Iterable<$core.String>? serviceUuids,
  }) {
    final $result = create();
    if (localName != null) {
      $result.localName = localName;
    }
    if (txPowerLevel != null) {
      $result.txPowerLevel = txPowerLevel;
    }
    if (connectable != null) {
      $result.connectable = connectable;
    }
    if (manufacturerData != null) {
      $result.manufacturerData.addAll(manufacturerData);
    }
    if (serviceData != null) {
      $result.serviceData.addAll(serviceData);
    }
    if (serviceUuids != null) {
      $result.serviceUuids.addAll(serviceUuids);
    }
    return $result;
  }
  AdvertisementData._() : super();
  factory AdvertisementData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdvertisementData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdvertisementData', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localName')
    ..aOM<Int32Value>(2, _omitFieldNames ? '' : 'txPowerLevel', subBuilder: Int32Value.create)
    ..aOB(3, _omitFieldNames ? '' : 'connectable')
    ..m<$core.int, $core.List<$core.int>>(4, _omitFieldNames ? '' : 'manufacturerData', entryClassName: 'AdvertisementData.ManufacturerDataEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(5, _omitFieldNames ? '' : 'serviceData', entryClassName: 'AdvertisementData.ServiceDataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OY)
    ..pPS(6, _omitFieldNames ? '' : 'serviceUuids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdvertisementData clone() => AdvertisementData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdvertisementData copyWith(void Function(AdvertisementData) updates) => super.copyWith((message) => updates(message as AdvertisementData)) as AdvertisementData;

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
  factory ScanSettings({
    $core.int? androidScanMode,
    $core.Iterable<$core.String>? serviceUuids,
    $core.bool? allowDuplicates,
  }) {
    final $result = create();
    if (androidScanMode != null) {
      $result.androidScanMode = androidScanMode;
    }
    if (serviceUuids != null) {
      $result.serviceUuids.addAll(serviceUuids);
    }
    if (allowDuplicates != null) {
      $result.allowDuplicates = allowDuplicates;
    }
    return $result;
  }
  ScanSettings._() : super();
  factory ScanSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScanSettings', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'androidScanMode', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'serviceUuids')
    ..aOB(3, _omitFieldNames ? '' : 'allowDuplicates')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScanSettings clone() => ScanSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScanSettings copyWith(void Function(ScanSettings) updates) => super.copyWith((message) => updates(message as ScanSettings)) as ScanSettings;

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

class AdvertisingSettings extends $pb.GeneratedMessage {
  factory AdvertisingSettings({
    $core.int? advertisingMode,
    $core.int? advertisingTxPower,
    $core.int? manufacturerId,
    $core.List<$core.int>? manufacturerData,
    $core.String? serviceUuid,
  }) {
    final $result = create();
    if (advertisingMode != null) {
      $result.advertisingMode = advertisingMode;
    }
    if (advertisingTxPower != null) {
      $result.advertisingTxPower = advertisingTxPower;
    }
    if (manufacturerId != null) {
      $result.manufacturerId = manufacturerId;
    }
    if (manufacturerData != null) {
      $result.manufacturerData = manufacturerData;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    return $result;
  }
  AdvertisingSettings._() : super();
  factory AdvertisingSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdvertisingSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdvertisingSettings', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'advertisingMode', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'advertisingTxPower', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'manufacturerId', $pb.PbFieldType.O3, protoName: 'manufacturerId')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'manufacturerData', $pb.PbFieldType.OY, protoName: 'manufacturerData')
    ..aOS(5, _omitFieldNames ? '' : 'serviceUuid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdvertisingSettings clone() => AdvertisingSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdvertisingSettings copyWith(void Function(AdvertisingSettings) updates) => super.copyWith((message) => updates(message as AdvertisingSettings)) as AdvertisingSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdvertisingSettings create() => AdvertisingSettings._();
  AdvertisingSettings createEmptyInstance() => create();
  static $pb.PbList<AdvertisingSettings> createRepeated() => $pb.PbList<AdvertisingSettings>();
  @$core.pragma('dart2js:noInline')
  static AdvertisingSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdvertisingSettings>(create);
  static AdvertisingSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get advertisingMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set advertisingMode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdvertisingMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdvertisingMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get advertisingTxPower => $_getIZ(1);
  @$pb.TagNumber(2)
  set advertisingTxPower($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdvertisingTxPower() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdvertisingTxPower() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get manufacturerId => $_getIZ(2);
  @$pb.TagNumber(3)
  set manufacturerId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasManufacturerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManufacturerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get manufacturerData => $_getN(3);
  @$pb.TagNumber(4)
  set manufacturerData($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasManufacturerData() => $_has(3);
  @$pb.TagNumber(4)
  void clearManufacturerData() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get serviceUuid => $_getSZ(4);
  @$pb.TagNumber(5)
  set serviceUuid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasServiceUuid() => $_has(4);
  @$pb.TagNumber(5)
  void clearServiceUuid() => clearField(5);
}

class ScanResult extends $pb.GeneratedMessage {
  factory ScanResult({
    BluetoothDevice? device,
    AdvertisementData? advertisementData,
    $core.int? rssi,
  }) {
    final $result = create();
    if (device != null) {
      $result.device = device;
    }
    if (advertisementData != null) {
      $result.advertisementData = advertisementData;
    }
    if (rssi != null) {
      $result.rssi = rssi;
    }
    return $result;
  }
  ScanResult._() : super();
  factory ScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ScanResult', createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, _omitFieldNames ? '' : 'device', subBuilder: BluetoothDevice.create)
    ..aOM<AdvertisementData>(2, _omitFieldNames ? '' : 'advertisementData', subBuilder: AdvertisementData.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'rssi', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScanResult clone() => ScanResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScanResult copyWith(void Function(ScanResult) updates) => super.copyWith((message) => updates(message as ScanResult)) as ScanResult;

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
  factory ConnectRequest({
    $core.String? remoteId,
    $core.bool? androidAutoConnect,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (androidAutoConnect != null) {
      $result.androidAutoConnect = androidAutoConnect;
    }
    return $result;
  }
  ConnectRequest._() : super();
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOB(2, _omitFieldNames ? '' : 'androidAutoConnect')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest)) as ConnectRequest;

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
  factory BluetoothDevice({
    $core.String? remoteId,
    $core.String? name,
    BluetoothDevice_Type? type,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  BluetoothDevice._() : super();
  factory BluetoothDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BluetoothDevice', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..e<BluetoothDevice_Type>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: BluetoothDevice_Type.UNKNOWN, valueOf: BluetoothDevice_Type.valueOf, enumValues: BluetoothDevice_Type.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothDevice clone() => BluetoothDevice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothDevice copyWith(void Function(BluetoothDevice) updates) => super.copyWith((message) => updates(message as BluetoothDevice)) as BluetoothDevice;

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
  factory BluetoothService({
    $core.String? uuid,
    $core.String? remoteId,
    $core.bool? isPrimary,
    $core.Iterable<BluetoothCharacteristic>? characteristics,
    $core.Iterable<BluetoothService>? includedServices,
  }) {
    final $result = create();
    if (uuid != null) {
      $result.uuid = uuid;
    }
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (isPrimary != null) {
      $result.isPrimary = isPrimary;
    }
    if (characteristics != null) {
      $result.characteristics.addAll(characteristics);
    }
    if (includedServices != null) {
      $result.includedServices.addAll(includedServices);
    }
    return $result;
  }
  BluetoothService._() : super();
  factory BluetoothService.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothService.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BluetoothService', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'remoteId')
    ..aOB(3, _omitFieldNames ? '' : 'isPrimary')
    ..pc<BluetoothCharacteristic>(4, _omitFieldNames ? '' : 'characteristics', $pb.PbFieldType.PM, subBuilder: BluetoothCharacteristic.create)
    ..pc<BluetoothService>(5, _omitFieldNames ? '' : 'includedServices', $pb.PbFieldType.PM, subBuilder: BluetoothService.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothService clone() => BluetoothService()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothService copyWith(void Function(BluetoothService) updates) => super.copyWith((message) => updates(message as BluetoothService)) as BluetoothService;

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
  factory BluetoothCharacteristic({
    $core.String? uuid,
    $core.String? remoteId,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.Iterable<BluetoothDescriptor>? descriptors,
    CharacteristicProperties? properties,
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (uuid != null) {
      $result.uuid = uuid;
    }
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      $result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (descriptors != null) {
      $result.descriptors.addAll(descriptors);
    }
    if (properties != null) {
      $result.properties = properties;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  BluetoothCharacteristic._() : super();
  factory BluetoothCharacteristic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothCharacteristic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BluetoothCharacteristic', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'remoteId')
    ..aOS(3, _omitFieldNames ? '' : 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'secondaryServiceUuid', protoName: 'secondaryServiceUuid')
    ..pc<BluetoothDescriptor>(5, _omitFieldNames ? '' : 'descriptors', $pb.PbFieldType.PM, subBuilder: BluetoothDescriptor.create)
    ..aOM<CharacteristicProperties>(6, _omitFieldNames ? '' : 'properties', subBuilder: CharacteristicProperties.create)
    ..a<$core.List<$core.int>>(7, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothCharacteristic clone() => BluetoothCharacteristic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothCharacteristic copyWith(void Function(BluetoothCharacteristic) updates) => super.copyWith((message) => updates(message as BluetoothCharacteristic)) as BluetoothCharacteristic;

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
  factory BluetoothDescriptor({
    $core.String? uuid,
    $core.String? remoteId,
    $core.String? serviceUuid,
    $core.String? characteristicUuid,
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (uuid != null) {
      $result.uuid = uuid;
    }
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (characteristicUuid != null) {
      $result.characteristicUuid = characteristicUuid;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  BluetoothDescriptor._() : super();
  factory BluetoothDescriptor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDescriptor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BluetoothDescriptor', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'remoteId')
    ..aOS(3, _omitFieldNames ? '' : 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'characteristicUuid', protoName: 'characteristicUuid')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BluetoothDescriptor clone() => BluetoothDescriptor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BluetoothDescriptor copyWith(void Function(BluetoothDescriptor) updates) => super.copyWith((message) => updates(message as BluetoothDescriptor)) as BluetoothDescriptor;

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
    final $result = create();
    if (broadcast != null) {
      $result.broadcast = broadcast;
    }
    if (read != null) {
      $result.read = read;
    }
    if (writeWithoutResponse != null) {
      $result.writeWithoutResponse = writeWithoutResponse;
    }
    if (write != null) {
      $result.write = write;
    }
    if (notify != null) {
      $result.notify = notify;
    }
    if (indicate != null) {
      $result.indicate = indicate;
    }
    if (authenticatedSignedWrites != null) {
      $result.authenticatedSignedWrites = authenticatedSignedWrites;
    }
    if (extendedProperties != null) {
      $result.extendedProperties = extendedProperties;
    }
    if (notifyEncryptionRequired != null) {
      $result.notifyEncryptionRequired = notifyEncryptionRequired;
    }
    if (indicateEncryptionRequired != null) {
      $result.indicateEncryptionRequired = indicateEncryptionRequired;
    }
    return $result;
  }
  CharacteristicProperties._() : super();
  factory CharacteristicProperties.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacteristicProperties.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CharacteristicProperties', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'broadcast')
    ..aOB(2, _omitFieldNames ? '' : 'read')
    ..aOB(3, _omitFieldNames ? '' : 'writeWithoutResponse')
    ..aOB(4, _omitFieldNames ? '' : 'write')
    ..aOB(5, _omitFieldNames ? '' : 'notify')
    ..aOB(6, _omitFieldNames ? '' : 'indicate')
    ..aOB(7, _omitFieldNames ? '' : 'authenticatedSignedWrites')
    ..aOB(8, _omitFieldNames ? '' : 'extendedProperties')
    ..aOB(9, _omitFieldNames ? '' : 'notifyEncryptionRequired')
    ..aOB(10, _omitFieldNames ? '' : 'indicateEncryptionRequired')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacteristicProperties clone() => CharacteristicProperties()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacteristicProperties copyWith(void Function(CharacteristicProperties) updates) => super.copyWith((message) => updates(message as CharacteristicProperties)) as CharacteristicProperties;

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
  factory DiscoverServicesResult({
    $core.String? remoteId,
    $core.Iterable<BluetoothService>? services,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (services != null) {
      $result.services.addAll(services);
    }
    return $result;
  }
  DiscoverServicesResult._() : super();
  factory DiscoverServicesResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoverServicesResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DiscoverServicesResult', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..pc<BluetoothService>(2, _omitFieldNames ? '' : 'services', $pb.PbFieldType.PM, subBuilder: BluetoothService.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscoverServicesResult clone() => DiscoverServicesResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscoverServicesResult copyWith(void Function(DiscoverServicesResult) updates) => super.copyWith((message) => updates(message as DiscoverServicesResult)) as DiscoverServicesResult;

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
  factory ReadCharacteristicRequest({
    $core.String? remoteId,
    $core.String? characteristicUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (characteristicUuid != null) {
      $result.characteristicUuid = characteristicUuid;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      $result.secondaryServiceUuid = secondaryServiceUuid;
    }
    return $result;
  }
  ReadCharacteristicRequest._() : super();
  factory ReadCharacteristicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCharacteristicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadCharacteristicRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOS(2, _omitFieldNames ? '' : 'characteristicUuid')
    ..aOS(3, _omitFieldNames ? '' : 'serviceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'secondaryServiceUuid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadCharacteristicRequest clone() => ReadCharacteristicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadCharacteristicRequest copyWith(void Function(ReadCharacteristicRequest) updates) => super.copyWith((message) => updates(message as ReadCharacteristicRequest)) as ReadCharacteristicRequest;

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
  factory ReadCharacteristicResponse({
    $core.String? remoteId,
    BluetoothCharacteristic? characteristic,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (characteristic != null) {
      $result.characteristic = characteristic;
    }
    return $result;
  }
  ReadCharacteristicResponse._() : super();
  factory ReadCharacteristicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCharacteristicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadCharacteristicResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, _omitFieldNames ? '' : 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadCharacteristicResponse clone() => ReadCharacteristicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadCharacteristicResponse copyWith(void Function(ReadCharacteristicResponse) updates) => super.copyWith((message) => updates(message as ReadCharacteristicResponse)) as ReadCharacteristicResponse;

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
  factory ReadDescriptorRequest({
    $core.String? remoteId,
    $core.String? descriptorUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.String? characteristicUuid,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (descriptorUuid != null) {
      $result.descriptorUuid = descriptorUuid;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      $result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (characteristicUuid != null) {
      $result.characteristicUuid = characteristicUuid;
    }
    return $result;
  }
  ReadDescriptorRequest._() : super();
  factory ReadDescriptorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDescriptorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadDescriptorRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOS(2, _omitFieldNames ? '' : 'descriptorUuid')
    ..aOS(3, _omitFieldNames ? '' : 'serviceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'secondaryServiceUuid')
    ..aOS(5, _omitFieldNames ? '' : 'characteristicUuid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadDescriptorRequest clone() => ReadDescriptorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadDescriptorRequest copyWith(void Function(ReadDescriptorRequest) updates) => super.copyWith((message) => updates(message as ReadDescriptorRequest)) as ReadDescriptorRequest;

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
  factory ReadDescriptorResponse({
    ReadDescriptorRequest? request,
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (request != null) {
      $result.request = request;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ReadDescriptorResponse._() : super();
  factory ReadDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReadDescriptorResponse', createEmptyInstance: create)
    ..aOM<ReadDescriptorRequest>(1, _omitFieldNames ? '' : 'request', subBuilder: ReadDescriptorRequest.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReadDescriptorResponse clone() => ReadDescriptorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReadDescriptorResponse copyWith(void Function(ReadDescriptorResponse) updates) => super.copyWith((message) => updates(message as ReadDescriptorResponse)) as ReadDescriptorResponse;

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
  factory WriteCharacteristicRequest({
    $core.String? remoteId,
    $core.String? characteristicUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    WriteCharacteristicRequest_WriteType? writeType,
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (characteristicUuid != null) {
      $result.characteristicUuid = characteristicUuid;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      $result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (writeType != null) {
      $result.writeType = writeType;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  WriteCharacteristicRequest._() : super();
  factory WriteCharacteristicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacteristicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteCharacteristicRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOS(2, _omitFieldNames ? '' : 'characteristicUuid')
    ..aOS(3, _omitFieldNames ? '' : 'serviceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'secondaryServiceUuid')
    ..e<WriteCharacteristicRequest_WriteType>(5, _omitFieldNames ? '' : 'writeType', $pb.PbFieldType.OE, defaultOrMaker: WriteCharacteristicRequest_WriteType.WITH_RESPONSE, valueOf: WriteCharacteristicRequest_WriteType.valueOf, enumValues: WriteCharacteristicRequest_WriteType.values)
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteCharacteristicRequest clone() => WriteCharacteristicRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteCharacteristicRequest copyWith(void Function(WriteCharacteristicRequest) updates) => super.copyWith((message) => updates(message as WriteCharacteristicRequest)) as WriteCharacteristicRequest;

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
  factory WriteCharacteristicResponse({
    WriteCharacteristicRequest? request,
    $core.bool? success,
  }) {
    final $result = create();
    if (request != null) {
      $result.request = request;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  WriteCharacteristicResponse._() : super();
  factory WriteCharacteristicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacteristicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteCharacteristicResponse', createEmptyInstance: create)
    ..aOM<WriteCharacteristicRequest>(1, _omitFieldNames ? '' : 'request', subBuilder: WriteCharacteristicRequest.create)
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteCharacteristicResponse clone() => WriteCharacteristicResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteCharacteristicResponse copyWith(void Function(WriteCharacteristicResponse) updates) => super.copyWith((message) => updates(message as WriteCharacteristicResponse)) as WriteCharacteristicResponse;

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
  factory WriteDescriptorRequest({
    $core.String? remoteId,
    $core.String? descriptorUuid,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.String? characteristicUuid,
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (descriptorUuid != null) {
      $result.descriptorUuid = descriptorUuid;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      $result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (characteristicUuid != null) {
      $result.characteristicUuid = characteristicUuid;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  WriteDescriptorRequest._() : super();
  factory WriteDescriptorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteDescriptorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteDescriptorRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOS(2, _omitFieldNames ? '' : 'descriptorUuid')
    ..aOS(3, _omitFieldNames ? '' : 'serviceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'secondaryServiceUuid')
    ..aOS(5, _omitFieldNames ? '' : 'characteristicUuid')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteDescriptorRequest clone() => WriteDescriptorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteDescriptorRequest copyWith(void Function(WriteDescriptorRequest) updates) => super.copyWith((message) => updates(message as WriteDescriptorRequest)) as WriteDescriptorRequest;

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
  factory WriteDescriptorResponse({
    WriteDescriptorRequest? request,
    $core.bool? success,
  }) {
    final $result = create();
    if (request != null) {
      $result.request = request;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  WriteDescriptorResponse._() : super();
  factory WriteDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WriteDescriptorResponse', createEmptyInstance: create)
    ..aOM<WriteDescriptorRequest>(1, _omitFieldNames ? '' : 'request', subBuilder: WriteDescriptorRequest.create)
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WriteDescriptorResponse clone() => WriteDescriptorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WriteDescriptorResponse copyWith(void Function(WriteDescriptorResponse) updates) => super.copyWith((message) => updates(message as WriteDescriptorResponse)) as WriteDescriptorResponse;

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
  factory SetNotificationRequest({
    $core.String? remoteId,
    $core.String? serviceUuid,
    $core.String? secondaryServiceUuid,
    $core.String? characteristicUuid,
    $core.bool? enable,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (serviceUuid != null) {
      $result.serviceUuid = serviceUuid;
    }
    if (secondaryServiceUuid != null) {
      $result.secondaryServiceUuid = secondaryServiceUuid;
    }
    if (characteristicUuid != null) {
      $result.characteristicUuid = characteristicUuid;
    }
    if (enable != null) {
      $result.enable = enable;
    }
    return $result;
  }
  SetNotificationRequest._() : super();
  factory SetNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetNotificationRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOS(2, _omitFieldNames ? '' : 'serviceUuid')
    ..aOS(3, _omitFieldNames ? '' : 'secondaryServiceUuid')
    ..aOS(4, _omitFieldNames ? '' : 'characteristicUuid')
    ..aOB(5, _omitFieldNames ? '' : 'enable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetNotificationRequest clone() => SetNotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetNotificationRequest copyWith(void Function(SetNotificationRequest) updates) => super.copyWith((message) => updates(message as SetNotificationRequest)) as SetNotificationRequest;

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
  factory SetNotificationResponse({
    $core.String? remoteId,
    BluetoothCharacteristic? characteristic,
    $core.bool? success,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (characteristic != null) {
      $result.characteristic = characteristic;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  SetNotificationResponse._() : super();
  factory SetNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetNotificationResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, _omitFieldNames ? '' : 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetNotificationResponse clone() => SetNotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetNotificationResponse copyWith(void Function(SetNotificationResponse) updates) => super.copyWith((message) => updates(message as SetNotificationResponse)) as SetNotificationResponse;

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
  factory OnCharacteristicChanged({
    $core.String? remoteId,
    BluetoothCharacteristic? characteristic,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (characteristic != null) {
      $result.characteristic = characteristic;
    }
    return $result;
  }
  OnCharacteristicChanged._() : super();
  factory OnCharacteristicChanged.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnCharacteristicChanged.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnCharacteristicChanged', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, _omitFieldNames ? '' : 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnCharacteristicChanged clone() => OnCharacteristicChanged()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnCharacteristicChanged copyWith(void Function(OnCharacteristicChanged) updates) => super.copyWith((message) => updates(message as OnCharacteristicChanged)) as OnCharacteristicChanged;

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
  factory DeviceStateResponse({
    $core.String? remoteId,
    DeviceStateResponse_BluetoothDeviceState? state,
    $core.int? status,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (state != null) {
      $result.state = state;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  DeviceStateResponse._() : super();
  factory DeviceStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceStateResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..e<DeviceStateResponse_BluetoothDeviceState>(2, _omitFieldNames ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: DeviceStateResponse_BluetoothDeviceState.DISCONNECTED, valueOf: DeviceStateResponse_BluetoothDeviceState.valueOf, enumValues: DeviceStateResponse_BluetoothDeviceState.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceStateResponse clone() => DeviceStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceStateResponse copyWith(void Function(DeviceStateResponse) updates) => super.copyWith((message) => updates(message as DeviceStateResponse)) as DeviceStateResponse;

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

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class ConnectedDevicesResponse extends $pb.GeneratedMessage {
  factory ConnectedDevicesResponse({
    $core.Iterable<BluetoothDevice>? devices,
  }) {
    final $result = create();
    if (devices != null) {
      $result.devices.addAll(devices);
    }
    return $result;
  }
  ConnectedDevicesResponse._() : super();
  factory ConnectedDevicesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectedDevicesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectedDevicesResponse', createEmptyInstance: create)
    ..pc<BluetoothDevice>(1, _omitFieldNames ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: BluetoothDevice.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectedDevicesResponse clone() => ConnectedDevicesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectedDevicesResponse copyWith(void Function(ConnectedDevicesResponse) updates) => super.copyWith((message) => updates(message as ConnectedDevicesResponse)) as ConnectedDevicesResponse;

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
  factory MtuSizeRequest({
    $core.String? remoteId,
    $core.int? mtu,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (mtu != null) {
      $result.mtu = mtu;
    }
    return $result;
  }
  MtuSizeRequest._() : super();
  factory MtuSizeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MtuSizeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MtuSizeRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'mtu', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MtuSizeRequest clone() => MtuSizeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MtuSizeRequest copyWith(void Function(MtuSizeRequest) updates) => super.copyWith((message) => updates(message as MtuSizeRequest)) as MtuSizeRequest;

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
  factory MtuSizeResponse({
    $core.String? remoteId,
    $core.int? mtu,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (mtu != null) {
      $result.mtu = mtu;
    }
    return $result;
  }
  MtuSizeResponse._() : super();
  factory MtuSizeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MtuSizeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MtuSizeResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'mtu', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MtuSizeResponse clone() => MtuSizeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MtuSizeResponse copyWith(void Function(MtuSizeResponse) updates) => super.copyWith((message) => updates(message as MtuSizeResponse)) as MtuSizeResponse;

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

class RSSIResponse extends $pb.GeneratedMessage {
  factory RSSIResponse({
    $core.String? remoteId,
    $core.int? rssi,
  }) {
    final $result = create();
    if (remoteId != null) {
      $result.remoteId = remoteId;
    }
    if (rssi != null) {
      $result.rssi = rssi;
    }
    return $result;
  }
  RSSIResponse._() : super();
  factory RSSIResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RSSIResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RSSIResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remoteId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'rssi', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RSSIResponse clone() => RSSIResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RSSIResponse copyWith(void Function(RSSIResponse) updates) => super.copyWith((message) => updates(message as RSSIResponse)) as RSSIResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RSSIResponse create() => RSSIResponse._();
  RSSIResponse createEmptyInstance() => create();
  static $pb.PbList<RSSIResponse> createRepeated() => $pb.PbList<RSSIResponse>();
  @$core.pragma('dart2js:noInline')
  static RSSIResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RSSIResponse>(create);
  static RSSIResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rssi => $_getIZ(1);
  @$pb.TagNumber(2)
  set rssi($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRssi() => $_has(1);
  @$pb.TagNumber(2)
  void clearRssi() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
