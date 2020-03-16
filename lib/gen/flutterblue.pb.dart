///
//  Generated code. Do not modify.
//  source: flutterblue.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'flutterblue.pbenum.dart';

export 'flutterblue.pbenum.dart';

class Int32Value extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Int32Value', createEmptyInstance: create)
    ..a<$core.int>(1, 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Int32Value._() : super();
  factory Int32Value() => create();
  factory Int32Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int32Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Int32Value clone() => Int32Value()..mergeFromMessage(this);
  Int32Value copyWith(void Function(Int32Value) updates) => super.copyWith((message) => updates(message as Int32Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  Int32Value createEmptyInstance() => create();
  static $pb.PbList<Int32Value> createRepeated() => $pb.PbList<Int32Value>();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothState', createEmptyInstance: create)
    ..e<BluetoothState_State>(1, 'state', $pb.PbFieldType.OE, defaultOrMaker: BluetoothState_State.UNKNOWN, valueOf: BluetoothState_State.valueOf, enumValues: BluetoothState_State.values)
    ..hasRequiredFields = false
  ;

  BluetoothState._() : super();
  factory BluetoothState() => create();
  factory BluetoothState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothState clone() => BluetoothState()..mergeFromMessage(this);
  BluetoothState copyWith(void Function(BluetoothState) updates) => super.copyWith((message) => updates(message as BluetoothState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothState create() => BluetoothState._();
  BluetoothState createEmptyInstance() => create();
  static $pb.PbList<BluetoothState> createRepeated() => $pb.PbList<BluetoothState>();
  @$core.pragma('dart2js:noInline')
  static BluetoothState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothState>(create);
  static BluetoothState _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AdvertisementData', createEmptyInstance: create)
    ..aOS(1, 'localName')
    ..aOM<Int32Value>(2, 'txPowerLevel', subBuilder: Int32Value.create)
    ..aOB(3, 'connectable')
    ..m<$core.int, $core.List<$core.int>>(4, 'manufacturerData', entryClassName: 'AdvertisementData.ManufacturerDataEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(5, 'serviceData', entryClassName: 'AdvertisementData.ServiceDataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OY)
    ..pPS(6, 'serviceUuids')
    ..hasRequiredFields = false
  ;

  AdvertisementData._() : super();
  factory AdvertisementData() => create();
  factory AdvertisementData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdvertisementData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AdvertisementData clone() => AdvertisementData()..mergeFromMessage(this);
  AdvertisementData copyWith(void Function(AdvertisementData) updates) => super.copyWith((message) => updates(message as AdvertisementData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdvertisementData create() => AdvertisementData._();
  AdvertisementData createEmptyInstance() => create();
  static $pb.PbList<AdvertisementData> createRepeated() => $pb.PbList<AdvertisementData>();
  @$core.pragma('dart2js:noInline')
  static AdvertisementData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdvertisementData>(create);
  static AdvertisementData _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ScanSettings', createEmptyInstance: create)
    ..a<$core.int>(1, 'androidScanMode', $pb.PbFieldType.O3)
    ..pPS(2, 'serviceUuids')
    ..hasRequiredFields = false
  ;

  ScanSettings._() : super();
  factory ScanSettings() => create();
  factory ScanSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ScanSettings clone() => ScanSettings()..mergeFromMessage(this);
  ScanSettings copyWith(void Function(ScanSettings) updates) => super.copyWith((message) => updates(message as ScanSettings));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanSettings create() => ScanSettings._();
  ScanSettings createEmptyInstance() => create();
  static $pb.PbList<ScanSettings> createRepeated() => $pb.PbList<ScanSettings>();
  @$core.pragma('dart2js:noInline')
  static ScanSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanSettings>(create);
  static ScanSettings _defaultInstance;

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
}

class ScanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ScanResult', createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, 'device', subBuilder: BluetoothDevice.create)
    ..aOM<AdvertisementData>(2, 'advertisementData', subBuilder: AdvertisementData.create)
    ..a<$core.int>(3, 'rssi', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ScanResult._() : super();
  factory ScanResult() => create();
  factory ScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ScanResult clone() => ScanResult()..mergeFromMessage(this);
  ScanResult copyWith(void Function(ScanResult) updates) => super.copyWith((message) => updates(message as ScanResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanResult create() => ScanResult._();
  ScanResult createEmptyInstance() => create();
  static $pb.PbList<ScanResult> createRepeated() => $pb.PbList<ScanResult>();
  @$core.pragma('dart2js:noInline')
  static ScanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanResult>(create);
  static ScanResult _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOB(2, 'androidAutoConnect')
    ..hasRequiredFields = false
  ;

  ConnectRequest._() : super();
  factory ConnectRequest() => create();
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothDevice', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'name')
    ..e<BluetoothDevice_Type>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: BluetoothDevice_Type.UNKNOWN, valueOf: BluetoothDevice_Type.valueOf, enumValues: BluetoothDevice_Type.values)
    ..hasRequiredFields = false
  ;

  BluetoothDevice._() : super();
  factory BluetoothDevice() => create();
  factory BluetoothDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothDevice clone() => BluetoothDevice()..mergeFromMessage(this);
  BluetoothDevice copyWith(void Function(BluetoothDevice) updates) => super.copyWith((message) => updates(message as BluetoothDevice));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice create() => BluetoothDevice._();
  BluetoothDevice createEmptyInstance() => create();
  static $pb.PbList<BluetoothDevice> createRepeated() => $pb.PbList<BluetoothDevice>();
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothDevice>(create);
  static BluetoothDevice _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothService', createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOS(2, 'remoteId')
    ..aOB(3, 'isPrimary')
    ..pc<BluetoothCharacteristic>(4, 'characteristics', $pb.PbFieldType.PM, subBuilder: BluetoothCharacteristic.create)
    ..pc<BluetoothService>(5, 'includedServices', $pb.PbFieldType.PM, subBuilder: BluetoothService.create)
    ..hasRequiredFields = false
  ;

  BluetoothService._() : super();
  factory BluetoothService() => create();
  factory BluetoothService.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothService.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothService clone() => BluetoothService()..mergeFromMessage(this);
  BluetoothService copyWith(void Function(BluetoothService) updates) => super.copyWith((message) => updates(message as BluetoothService));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothService create() => BluetoothService._();
  BluetoothService createEmptyInstance() => create();
  static $pb.PbList<BluetoothService> createRepeated() => $pb.PbList<BluetoothService>();
  @$core.pragma('dart2js:noInline')
  static BluetoothService getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothService>(create);
  static BluetoothService _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothCharacteristic', createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOS(2, 'remoteId')
    ..aOS(3, 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(4, 'secondaryServiceUuid', protoName: 'secondaryServiceUuid')
    ..pc<BluetoothDescriptor>(5, 'descriptors', $pb.PbFieldType.PM, subBuilder: BluetoothDescriptor.create)
    ..aOM<CharacteristicProperties>(6, 'properties', subBuilder: CharacteristicProperties.create)
    ..a<$core.List<$core.int>>(7, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BluetoothCharacteristic._() : super();
  factory BluetoothCharacteristic() => create();
  factory BluetoothCharacteristic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothCharacteristic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothCharacteristic clone() => BluetoothCharacteristic()..mergeFromMessage(this);
  BluetoothCharacteristic copyWith(void Function(BluetoothCharacteristic) updates) => super.copyWith((message) => updates(message as BluetoothCharacteristic));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothCharacteristic create() => BluetoothCharacteristic._();
  BluetoothCharacteristic createEmptyInstance() => create();
  static $pb.PbList<BluetoothCharacteristic> createRepeated() => $pb.PbList<BluetoothCharacteristic>();
  @$core.pragma('dart2js:noInline')
  static BluetoothCharacteristic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothCharacteristic>(create);
  static BluetoothCharacteristic _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothDescriptor', createEmptyInstance: create)
    ..aOS(1, 'uuid')
    ..aOS(2, 'remoteId')
    ..aOS(3, 'serviceUuid', protoName: 'serviceUuid')
    ..aOS(4, 'characteristicUuid', protoName: 'characteristicUuid')
    ..a<$core.List<$core.int>>(5, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BluetoothDescriptor._() : super();
  factory BluetoothDescriptor() => create();
  factory BluetoothDescriptor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDescriptor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothDescriptor clone() => BluetoothDescriptor()..mergeFromMessage(this);
  BluetoothDescriptor copyWith(void Function(BluetoothDescriptor) updates) => super.copyWith((message) => updates(message as BluetoothDescriptor));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothDescriptor create() => BluetoothDescriptor._();
  BluetoothDescriptor createEmptyInstance() => create();
  static $pb.PbList<BluetoothDescriptor> createRepeated() => $pb.PbList<BluetoothDescriptor>();
  @$core.pragma('dart2js:noInline')
  static BluetoothDescriptor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothDescriptor>(create);
  static BluetoothDescriptor _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CharacteristicProperties', createEmptyInstance: create)
    ..aOB(1, 'broadcast')
    ..aOB(2, 'read')
    ..aOB(3, 'writeWithoutResponse')
    ..aOB(4, 'write')
    ..aOB(5, 'notify')
    ..aOB(6, 'indicate')
    ..aOB(7, 'authenticatedSignedWrites')
    ..aOB(8, 'extendedProperties')
    ..aOB(9, 'notifyEncryptionRequired')
    ..aOB(10, 'indicateEncryptionRequired')
    ..hasRequiredFields = false
  ;

  CharacteristicProperties._() : super();
  factory CharacteristicProperties() => create();
  factory CharacteristicProperties.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacteristicProperties.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CharacteristicProperties clone() => CharacteristicProperties()..mergeFromMessage(this);
  CharacteristicProperties copyWith(void Function(CharacteristicProperties) updates) => super.copyWith((message) => updates(message as CharacteristicProperties));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacteristicProperties create() => CharacteristicProperties._();
  CharacteristicProperties createEmptyInstance() => create();
  static $pb.PbList<CharacteristicProperties> createRepeated() => $pb.PbList<CharacteristicProperties>();
  @$core.pragma('dart2js:noInline')
  static CharacteristicProperties getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacteristicProperties>(create);
  static CharacteristicProperties _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiscoverServicesResult', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..pc<BluetoothService>(2, 'services', $pb.PbFieldType.PM, subBuilder: BluetoothService.create)
    ..hasRequiredFields = false
  ;

  DiscoverServicesResult._() : super();
  factory DiscoverServicesResult() => create();
  factory DiscoverServicesResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoverServicesResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiscoverServicesResult clone() => DiscoverServicesResult()..mergeFromMessage(this);
  DiscoverServicesResult copyWith(void Function(DiscoverServicesResult) updates) => super.copyWith((message) => updates(message as DiscoverServicesResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoverServicesResult create() => DiscoverServicesResult._();
  DiscoverServicesResult createEmptyInstance() => create();
  static $pb.PbList<DiscoverServicesResult> createRepeated() => $pb.PbList<DiscoverServicesResult>();
  @$core.pragma('dart2js:noInline')
  static DiscoverServicesResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoverServicesResult>(create);
  static DiscoverServicesResult _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReadCharacteristicRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'characteristicUuid')
    ..aOS(3, 'serviceUuid')
    ..aOS(4, 'secondaryServiceUuid')
    ..hasRequiredFields = false
  ;

  ReadCharacteristicRequest._() : super();
  factory ReadCharacteristicRequest() => create();
  factory ReadCharacteristicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCharacteristicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReadCharacteristicRequest clone() => ReadCharacteristicRequest()..mergeFromMessage(this);
  ReadCharacteristicRequest copyWith(void Function(ReadCharacteristicRequest) updates) => super.copyWith((message) => updates(message as ReadCharacteristicRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicRequest create() => ReadCharacteristicRequest._();
  ReadCharacteristicRequest createEmptyInstance() => create();
  static $pb.PbList<ReadCharacteristicRequest> createRepeated() => $pb.PbList<ReadCharacteristicRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadCharacteristicRequest>(create);
  static ReadCharacteristicRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReadCharacteristicResponse', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  ReadCharacteristicResponse._() : super();
  factory ReadCharacteristicResponse() => create();
  factory ReadCharacteristicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadCharacteristicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReadCharacteristicResponse clone() => ReadCharacteristicResponse()..mergeFromMessage(this);
  ReadCharacteristicResponse copyWith(void Function(ReadCharacteristicResponse) updates) => super.copyWith((message) => updates(message as ReadCharacteristicResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicResponse create() => ReadCharacteristicResponse._();
  ReadCharacteristicResponse createEmptyInstance() => create();
  static $pb.PbList<ReadCharacteristicResponse> createRepeated() => $pb.PbList<ReadCharacteristicResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadCharacteristicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadCharacteristicResponse>(create);
  static ReadCharacteristicResponse _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReadDescriptorRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'descriptorUuid')
    ..aOS(3, 'serviceUuid')
    ..aOS(4, 'secondaryServiceUuid')
    ..aOS(5, 'characteristicUuid')
    ..hasRequiredFields = false
  ;

  ReadDescriptorRequest._() : super();
  factory ReadDescriptorRequest() => create();
  factory ReadDescriptorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDescriptorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReadDescriptorRequest clone() => ReadDescriptorRequest()..mergeFromMessage(this);
  ReadDescriptorRequest copyWith(void Function(ReadDescriptorRequest) updates) => super.copyWith((message) => updates(message as ReadDescriptorRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorRequest create() => ReadDescriptorRequest._();
  ReadDescriptorRequest createEmptyInstance() => create();
  static $pb.PbList<ReadDescriptorRequest> createRepeated() => $pb.PbList<ReadDescriptorRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadDescriptorRequest>(create);
  static ReadDescriptorRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReadDescriptorResponse', createEmptyInstance: create)
    ..aOM<ReadDescriptorRequest>(1, 'request', subBuilder: ReadDescriptorRequest.create)
    ..a<$core.List<$core.int>>(2, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ReadDescriptorResponse._() : super();
  factory ReadDescriptorResponse() => create();
  factory ReadDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReadDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReadDescriptorResponse clone() => ReadDescriptorResponse()..mergeFromMessage(this);
  ReadDescriptorResponse copyWith(void Function(ReadDescriptorResponse) updates) => super.copyWith((message) => updates(message as ReadDescriptorResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorResponse create() => ReadDescriptorResponse._();
  ReadDescriptorResponse createEmptyInstance() => create();
  static $pb.PbList<ReadDescriptorResponse> createRepeated() => $pb.PbList<ReadDescriptorResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadDescriptorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadDescriptorResponse>(create);
  static ReadDescriptorResponse _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WriteCharacteristicRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'characteristicUuid')
    ..aOS(3, 'serviceUuid')
    ..aOS(4, 'secondaryServiceUuid')
    ..e<WriteCharacteristicRequest_WriteType>(5, 'writeType', $pb.PbFieldType.OE, defaultOrMaker: WriteCharacteristicRequest_WriteType.WITH_RESPONSE, valueOf: WriteCharacteristicRequest_WriteType.valueOf, enumValues: WriteCharacteristicRequest_WriteType.values)
    ..a<$core.List<$core.int>>(6, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WriteCharacteristicRequest._() : super();
  factory WriteCharacteristicRequest() => create();
  factory WriteCharacteristicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacteristicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WriteCharacteristicRequest clone() => WriteCharacteristicRequest()..mergeFromMessage(this);
  WriteCharacteristicRequest copyWith(void Function(WriteCharacteristicRequest) updates) => super.copyWith((message) => updates(message as WriteCharacteristicRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicRequest create() => WriteCharacteristicRequest._();
  WriteCharacteristicRequest createEmptyInstance() => create();
  static $pb.PbList<WriteCharacteristicRequest> createRepeated() => $pb.PbList<WriteCharacteristicRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteCharacteristicRequest>(create);
  static WriteCharacteristicRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WriteCharacteristicResponse', createEmptyInstance: create)
    ..aOM<WriteCharacteristicRequest>(1, 'request', subBuilder: WriteCharacteristicRequest.create)
    ..aOB(2, 'success')
    ..hasRequiredFields = false
  ;

  WriteCharacteristicResponse._() : super();
  factory WriteCharacteristicResponse() => create();
  factory WriteCharacteristicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteCharacteristicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WriteCharacteristicResponse clone() => WriteCharacteristicResponse()..mergeFromMessage(this);
  WriteCharacteristicResponse copyWith(void Function(WriteCharacteristicResponse) updates) => super.copyWith((message) => updates(message as WriteCharacteristicResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicResponse create() => WriteCharacteristicResponse._();
  WriteCharacteristicResponse createEmptyInstance() => create();
  static $pb.PbList<WriteCharacteristicResponse> createRepeated() => $pb.PbList<WriteCharacteristicResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteCharacteristicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteCharacteristicResponse>(create);
  static WriteCharacteristicResponse _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WriteDescriptorRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'descriptorUuid')
    ..aOS(3, 'serviceUuid')
    ..aOS(4, 'secondaryServiceUuid')
    ..aOS(5, 'characteristicUuid')
    ..a<$core.List<$core.int>>(6, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WriteDescriptorRequest._() : super();
  factory WriteDescriptorRequest() => create();
  factory WriteDescriptorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteDescriptorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WriteDescriptorRequest clone() => WriteDescriptorRequest()..mergeFromMessage(this);
  WriteDescriptorRequest copyWith(void Function(WriteDescriptorRequest) updates) => super.copyWith((message) => updates(message as WriteDescriptorRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorRequest create() => WriteDescriptorRequest._();
  WriteDescriptorRequest createEmptyInstance() => create();
  static $pb.PbList<WriteDescriptorRequest> createRepeated() => $pb.PbList<WriteDescriptorRequest>();
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteDescriptorRequest>(create);
  static WriteDescriptorRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WriteDescriptorResponse', createEmptyInstance: create)
    ..aOM<WriteDescriptorRequest>(1, 'request', subBuilder: WriteDescriptorRequest.create)
    ..aOB(2, 'success')
    ..hasRequiredFields = false
  ;

  WriteDescriptorResponse._() : super();
  factory WriteDescriptorResponse() => create();
  factory WriteDescriptorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WriteDescriptorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WriteDescriptorResponse clone() => WriteDescriptorResponse()..mergeFromMessage(this);
  WriteDescriptorResponse copyWith(void Function(WriteDescriptorResponse) updates) => super.copyWith((message) => updates(message as WriteDescriptorResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorResponse create() => WriteDescriptorResponse._();
  WriteDescriptorResponse createEmptyInstance() => create();
  static $pb.PbList<WriteDescriptorResponse> createRepeated() => $pb.PbList<WriteDescriptorResponse>();
  @$core.pragma('dart2js:noInline')
  static WriteDescriptorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WriteDescriptorResponse>(create);
  static WriteDescriptorResponse _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetNotificationRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'serviceUuid')
    ..aOS(3, 'secondaryServiceUuid')
    ..aOS(4, 'characteristicUuid')
    ..aOB(5, 'enable')
    ..hasRequiredFields = false
  ;

  SetNotificationRequest._() : super();
  factory SetNotificationRequest() => create();
  factory SetNotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetNotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetNotificationRequest clone() => SetNotificationRequest()..mergeFromMessage(this);
  SetNotificationRequest copyWith(void Function(SetNotificationRequest) updates) => super.copyWith((message) => updates(message as SetNotificationRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetNotificationRequest create() => SetNotificationRequest._();
  SetNotificationRequest createEmptyInstance() => create();
  static $pb.PbList<SetNotificationRequest> createRepeated() => $pb.PbList<SetNotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static SetNotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetNotificationRequest>(create);
  static SetNotificationRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetNotificationResponse', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..aOB(3, 'success')
    ..hasRequiredFields = false
  ;

  SetNotificationResponse._() : super();
  factory SetNotificationResponse() => create();
  factory SetNotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetNotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetNotificationResponse clone() => SetNotificationResponse()..mergeFromMessage(this);
  SetNotificationResponse copyWith(void Function(SetNotificationResponse) updates) => super.copyWith((message) => updates(message as SetNotificationResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetNotificationResponse create() => SetNotificationResponse._();
  SetNotificationResponse createEmptyInstance() => create();
  static $pb.PbList<SetNotificationResponse> createRepeated() => $pb.PbList<SetNotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static SetNotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetNotificationResponse>(create);
  static SetNotificationResponse _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OnCharacteristicChanged', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOM<BluetoothCharacteristic>(2, 'characteristic', subBuilder: BluetoothCharacteristic.create)
    ..hasRequiredFields = false
  ;

  OnCharacteristicChanged._() : super();
  factory OnCharacteristicChanged() => create();
  factory OnCharacteristicChanged.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnCharacteristicChanged.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OnCharacteristicChanged clone() => OnCharacteristicChanged()..mergeFromMessage(this);
  OnCharacteristicChanged copyWith(void Function(OnCharacteristicChanged) updates) => super.copyWith((message) => updates(message as OnCharacteristicChanged));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OnCharacteristicChanged create() => OnCharacteristicChanged._();
  OnCharacteristicChanged createEmptyInstance() => create();
  static $pb.PbList<OnCharacteristicChanged> createRepeated() => $pb.PbList<OnCharacteristicChanged>();
  @$core.pragma('dart2js:noInline')
  static OnCharacteristicChanged getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnCharacteristicChanged>(create);
  static OnCharacteristicChanged _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeviceStateResponse', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..e<DeviceStateResponse_BluetoothDeviceState>(2, 'state', $pb.PbFieldType.OE, defaultOrMaker: DeviceStateResponse_BluetoothDeviceState.DISCONNECTED, valueOf: DeviceStateResponse_BluetoothDeviceState.valueOf, enumValues: DeviceStateResponse_BluetoothDeviceState.values)
    ..hasRequiredFields = false
  ;

  DeviceStateResponse._() : super();
  factory DeviceStateResponse() => create();
  factory DeviceStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeviceStateResponse clone() => DeviceStateResponse()..mergeFromMessage(this);
  DeviceStateResponse copyWith(void Function(DeviceStateResponse) updates) => super.copyWith((message) => updates(message as DeviceStateResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceStateResponse create() => DeviceStateResponse._();
  DeviceStateResponse createEmptyInstance() => create();
  static $pb.PbList<DeviceStateResponse> createRepeated() => $pb.PbList<DeviceStateResponse>();
  @$core.pragma('dart2js:noInline')
  static DeviceStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceStateResponse>(create);
  static DeviceStateResponse _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectedDevicesResponse', createEmptyInstance: create)
    ..pc<BluetoothDevice>(1, 'devices', $pb.PbFieldType.PM, subBuilder: BluetoothDevice.create)
    ..hasRequiredFields = false
  ;

  ConnectedDevicesResponse._() : super();
  factory ConnectedDevicesResponse() => create();
  factory ConnectedDevicesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectedDevicesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ConnectedDevicesResponse clone() => ConnectedDevicesResponse()..mergeFromMessage(this);
  ConnectedDevicesResponse copyWith(void Function(ConnectedDevicesResponse) updates) => super.copyWith((message) => updates(message as ConnectedDevicesResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectedDevicesResponse create() => ConnectedDevicesResponse._();
  ConnectedDevicesResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectedDevicesResponse> createRepeated() => $pb.PbList<ConnectedDevicesResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectedDevicesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectedDevicesResponse>(create);
  static ConnectedDevicesResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BluetoothDevice> get devices => $_getList(0);
}

class MtuSizeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MtuSizeRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..a<$core.int>(2, 'mtu', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  MtuSizeRequest._() : super();
  factory MtuSizeRequest() => create();
  factory MtuSizeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MtuSizeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MtuSizeRequest clone() => MtuSizeRequest()..mergeFromMessage(this);
  MtuSizeRequest copyWith(void Function(MtuSizeRequest) updates) => super.copyWith((message) => updates(message as MtuSizeRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MtuSizeRequest create() => MtuSizeRequest._();
  MtuSizeRequest createEmptyInstance() => create();
  static $pb.PbList<MtuSizeRequest> createRepeated() => $pb.PbList<MtuSizeRequest>();
  @$core.pragma('dart2js:noInline')
  static MtuSizeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MtuSizeRequest>(create);
  static MtuSizeRequest _defaultInstance;

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MtuSizeResponse', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..a<$core.int>(2, 'mtu', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  MtuSizeResponse._() : super();
  factory MtuSizeResponse() => create();
  factory MtuSizeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MtuSizeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MtuSizeResponse clone() => MtuSizeResponse()..mergeFromMessage(this);
  MtuSizeResponse copyWith(void Function(MtuSizeResponse) updates) => super.copyWith((message) => updates(message as MtuSizeResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MtuSizeResponse create() => MtuSizeResponse._();
  MtuSizeResponse createEmptyInstance() => create();
  static $pb.PbList<MtuSizeResponse> createRepeated() => $pb.PbList<MtuSizeResponse>();
  @$core.pragma('dart2js:noInline')
  static MtuSizeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MtuSizeResponse>(create);
  static MtuSizeResponse _defaultInstance;

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

