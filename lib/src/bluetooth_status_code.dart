part of flutter_blue;

class _AndroidBluetoothStatusCodeConst {
  static const int Success = 0;
  static const int HCIUnknownBTLECommand = 1;
  static const int HCIUnknownConnectionId = 2;
  static const int HCIAuthenticationFailure = 5;
  static const int HCIPinOrKeyMissing = 6;
  static const int HCIMemoryCapacityExceeded = 7;
  static const int HCIConnectionTimeout = 8;
  static const int HCICommandDisallowed = 12;
  static const int HCIInvalidBTLECommandParameters = 18;
  static const int HCIRemoteUserTerminatedConnection = 19;
  static const int HCIRemoteDevTerminationDueToLowResources = 20;
  static const int HCIRemoteDevTerminationDueToPowerOff = 21;
  static const int HCILocalHostTerminatedConnection = 22;
  static const int HCIUnsupportedRemoteFeature = 26;
  static const int HCIInvalidLMPParameters = 30;
  static const int HCIUnspecifiedError = 31;
  static const int HCILMPResponseTimeout = 34;
  static const int HCILMPPDUNotAllowed = 36;
  static const int HCIInstantPassed = 40;
  static const int HCIPairingWithUnitKeyUnsupported = 41;
  static const int HCIDifferentTransactionCollision = 42;
  static const int HCIControllerBusy = 58;
  static const int HCIConnIntervalUnAcceptable = 59;
  static const int HCIDirectedAdvertiserTimeout = 60;
  static const int HCIConnTerminatedDueToMicFailure = 61;
  static const int HCIConnFailedToBeEstablished = 62;
  static const int GATTNoResources = 128;
  static const int GATTInternalError = 129;
  static const int GATTWrongState = 130;
  static const int GATTDBFull = 131;
  static const int GATTBusy = 132;
  static const int GATTError = 133;
  static const int GATTCmdStarted = 134;
  static const int GATTIllegalParameter = 135;
  static const int GATTAuthFail = 137;
  static const int GATTMore = 138;
  static const int GATTInvalidCfg = 139;
  static const int GATTServiceStarted = 140;
  static const int GATTEncryptedNoMITM = 141;
  static const int GATTNotEncrypted = 142;
  static const int GATTCongested = 143;
  static const int GATTCCCCfgErr = 253;
  static const int GATTPrcInProgress = 254;
  static const int GATTOutOfRange = 255;
}

class _IOSBluetoothStatusCodeConst {
  static const CBUnknownError = 0; //this is success
  static const CBErrorInvalidParameters = 1;
  static const CBErrorInvalidHandle = 2;
  static const CBErrorNotConnected = 3;
  static const CBErrorOutOfSpace = 4;
  static const CBErrorOperationCancelled = 5;
  static const CBErrorPeripheralDisconnected = 7;
  static const CBErrorUUIDNotAllowed = 8;
  static const CBErrorAlreadyAdvertising = 9;
  static const CBErrorConnectionFailed = 10;
  static const CBErrorConnectionLimitReached = 11;
  static const CBErrorOperationNotSupported = 13;
  static const CBErrorUnknownDevice = 12;
  static const CBErrorEncryptionTimedOut = 15;
  static const CBErrorLeGattExceedBackgroundNotificationLimit = 17;
  static const CBErrorLeGattNearBackgroundNotificationLimit = 18;
  static const CBErrorPeerRemovedPairingInformation = 14;
  static const CBErrorTooManyLEPairedDevices = 16;
}

class BluetoothStatusCode {
  final String name;
  final int id;
  const BluetoothStatusCode(this.name, this.id);

  factory BluetoothStatusCode.fromId(int id) {
    if (Platform.isAndroid) {
      switch (id) {
        case _AndroidBluetoothStatusCodeConst.Success:
          return BluetoothStatusSuccess(id);
        case _AndroidBluetoothStatusCodeConst.HCIUnknownBTLECommand:
          return BluetoothHCIStatusUnknownBTLECommand();
        case _AndroidBluetoothStatusCodeConst.HCIUnknownConnectionId:
          return BluetoothHCIStatusUnknownConnectionId();
        case _AndroidBluetoothStatusCodeConst.HCIAuthenticationFailure:
          return BluetoothHCIAuthenticationFailure();
        case _AndroidBluetoothStatusCodeConst.HCIPinOrKeyMissing:
          return BluetoothHCIPinOrKeyMissing();
        case _AndroidBluetoothStatusCodeConst.HCIMemoryCapacityExceeded:
          return BluetoothOutOfSpace(id);
        case _AndroidBluetoothStatusCodeConst.HCIConnectionTimeout:
          return BluetoothHCIConnectionTimeout();
        case _AndroidBluetoothStatusCodeConst.HCICommandDisallowed:
          return BluetoothHCICommandDisallowed();
        case _AndroidBluetoothStatusCodeConst.HCIInvalidBTLECommandParameters:
          return BluetoothInvalidParameters(id);
        case _AndroidBluetoothStatusCodeConst.HCIRemoteUserTerminatedConnection:
          return BluetoothPeripheralDisconnect(id);
        case _AndroidBluetoothStatusCodeConst
            .HCIRemoteDevTerminationDueToLowResources:
          return BluetoothHCIRemoteDevTerminationDueToLowResources();
        case _AndroidBluetoothStatusCodeConst
            .HCIRemoteDevTerminationDueToPowerOff:
          return BluetoothHCIRemoteDevTerminationDueToPowerOff();
        case _AndroidBluetoothStatusCodeConst.HCILocalHostTerminatedConnection:
          return BluetoothPeerDeleteParingInformation(id);
        case _AndroidBluetoothStatusCodeConst.HCIUnsupportedRemoteFeature:
          return BluetoothHCIUnsupportedRemoteFeature();
        case _AndroidBluetoothStatusCodeConst.HCIInvalidLMPParameters:
          return BluetoothInvalidParameters(id);
        case _AndroidBluetoothStatusCodeConst.HCIUnspecifiedError:
          return BluetoothHCIUnspecifiedError();
        case _AndroidBluetoothStatusCodeConst.HCILMPResponseTimeout:
          return BluetoothHCILMPResponseTimeout();
        case _AndroidBluetoothStatusCodeConst.HCILMPPDUNotAllowed:
          return BluetoothHCILMPPDUNotAllowed();
        case _AndroidBluetoothStatusCodeConst.HCIInstantPassed:
          return BluetoothHCIInstantPassed();
        case _AndroidBluetoothStatusCodeConst.HCIPairingWithUnitKeyUnsupported:
          return BluetoothHCIPairingWithUnitKeyUnsupported();
        case _AndroidBluetoothStatusCodeConst.HCIDifferentTransactionCollision:
          return BluetoothHCIDifferentTransactionCollision();
        case _AndroidBluetoothStatusCodeConst.HCIControllerBusy:
          return BluetoothHCIControllerBusy();
        case _AndroidBluetoothStatusCodeConst.HCIConnIntervalUnAcceptable:
          return BluetoothHCIConnIntervalUnAcceptable();
        case _AndroidBluetoothStatusCodeConst.HCIDirectedAdvertiserTimeout:
          return BluetoothHCIDirectedAdvertiserTimeout();
        case _AndroidBluetoothStatusCodeConst.HCIConnTerminatedDueToMicFailure:
          return BluetoothHCIConnTerminatedDueToMicFailure();
        case _AndroidBluetoothStatusCodeConst.HCIConnFailedToBeEstablished:
          return BluetoothConnectionFailed(id);
        case _AndroidBluetoothStatusCodeConst.GATTNoResources:
          return BluetoothGATTNoResources();
        case _AndroidBluetoothStatusCodeConst.GATTInternalError:
          return BluetoothGATTInternalError();
        case _AndroidBluetoothStatusCodeConst.GATTWrongState:
          return BluetoothGATTWrongState();
        case _AndroidBluetoothStatusCodeConst.GATTDBFull:
          return BluetoothGATTDBFull();
        case _AndroidBluetoothStatusCodeConst.GATTBusy:
          return BluetoothGATTBusy();
        case _AndroidBluetoothStatusCodeConst.GATTError:
          return BluetoothGATTError();
        case _AndroidBluetoothStatusCodeConst.GATTCmdStarted:
          return BluetoothGATTCmdStarted();
        case _AndroidBluetoothStatusCodeConst.GATTIllegalParameter:
          return BluetoothGATTIllegalParameter();
        case _AndroidBluetoothStatusCodeConst.GATTAuthFail:
          return BluetoothGATTAuthFail();
        case _AndroidBluetoothStatusCodeConst.GATTMore:
          return BluetoothGATTMore();
        case _AndroidBluetoothStatusCodeConst.GATTInvalidCfg:
          return BluetoothGATTInvalidCfg();
        case _AndroidBluetoothStatusCodeConst.GATTServiceStarted:
          return BluetoothGATTServiceStarted();
        case _AndroidBluetoothStatusCodeConst.GATTEncryptedNoMITM:
          return BluetoothGATTEncryptedNoMITM();
        case _AndroidBluetoothStatusCodeConst.GATTNotEncrypted:
          return BluetoothGATTNotEncrypted();
        case _AndroidBluetoothStatusCodeConst.GATTCongested:
          return BluetoothGATTCongested();
        case _AndroidBluetoothStatusCodeConst.GATTCCCCfgErr:
          return BluetoothGATTCCCCfgErr();
        case _AndroidBluetoothStatusCodeConst.GATTPrcInProgress:
          return BluetoothGATTPrcInProgress();
        case _AndroidBluetoothStatusCodeConst.GATTOutOfRange:
          return BluetoothGATTOutOfRange();
      }
    } else if (Platform.isIOS) {
      switch (id) {
        case _IOSBluetoothStatusCodeConst.CBUnknownError:
          return BluetoothStatusSuccess(id);
        case _IOSBluetoothStatusCodeConst.CBErrorInvalidParameters:
          return BluetoothInvalidParameters(id);
        case _IOSBluetoothStatusCodeConst.CBErrorInvalidHandle:
          return BluetoothInvalidHandle();
        case _IOSBluetoothStatusCodeConst.CBErrorNotConnected:
          return BluetoothNotConnected();
        case _IOSBluetoothStatusCodeConst.CBErrorOutOfSpace:
          return BluetoothOutOfSpace(id);
        case _IOSBluetoothStatusCodeConst.CBErrorOperationCancelled:
          return BluetoothOperationCancelled();
        case _IOSBluetoothStatusCodeConst.CBErrorPeripheralDisconnected:
          return BluetoothPeripheralDisconnect(id);
        case _IOSBluetoothStatusCodeConst.CBErrorUUIDNotAllowed:
          return BluetoothUUIDDisallowed();
        case _IOSBluetoothStatusCodeConst.CBErrorAlreadyAdvertising:
          return BluetoothAlreadyAdvertising();
        case _IOSBluetoothStatusCodeConst.CBErrorConnectionFailed:
          return BluetoothConnectionFailed(id);
        case _IOSBluetoothStatusCodeConst.CBErrorConnectionLimitReached:
          return BluetoothConnectionLimitReached();
        case _IOSBluetoothStatusCodeConst.CBErrorOperationNotSupported:
          return BluetoothOperationNotSupported();
        case _IOSBluetoothStatusCodeConst.CBErrorUnknownDevice:
          return BluetoothUnknownDevice();
        case _IOSBluetoothStatusCodeConst.CBErrorEncryptionTimedOut:
          return BluetoothEncryptionTimedOut();
        case _IOSBluetoothStatusCodeConst
            .CBErrorLeGattExceedBackgroundNotificationLimit:
          return BluetoothLeGattExceedBackgroundNotificationLimit();
        case _IOSBluetoothStatusCodeConst
            .CBErrorLeGattNearBackgroundNotificationLimit:
          return BluetoothLeGattNearBackgroundNotificationLimit();
        case _IOSBluetoothStatusCodeConst.CBErrorPeerRemovedPairingInformation:
          return BluetoothPeerDeleteParingInformation(id);
        case _IOSBluetoothStatusCodeConst.CBErrorTooManyLEPairedDevices:
          return BluetoothTooManyLEPairedDevices();
      }
    }
    return BluetoothStatusCode('Unknown', -1);
  }
}

class BluetoothStatusSuccess extends BluetoothStatusCode {
  const BluetoothStatusSuccess(int originalId) : super('Success', originalId);
}

class BluetoothInvalidParameters extends BluetoothStatusCode {
  const BluetoothInvalidParameters(int originalId)
      : super('InvalidParameters', originalId);
}

class BluetoothInvalidHandle extends BluetoothStatusCode {
  const BluetoothInvalidHandle()
      : super(
            'InvalidHandle', _IOSBluetoothStatusCodeConst.CBErrorInvalidHandle);
}

class BluetoothNotConnected extends BluetoothStatusCode {
  const BluetoothNotConnected()
      : super('NotConnected', _IOSBluetoothStatusCodeConst.CBErrorNotConnected);
}

class BluetoothOutOfSpace extends BluetoothStatusCode {
  const BluetoothOutOfSpace(int originalId) : super('OutOfSpace', originalId);
}

class BluetoothOperationCancelled extends BluetoothStatusCode {
  const BluetoothOperationCancelled()
      : super('OperationCancelled',
            _IOSBluetoothStatusCodeConst.CBErrorOperationCancelled);
}

class BluetoothPeripheralDisconnect extends BluetoothStatusCode {
  const BluetoothPeripheralDisconnect(int originalId)
      : super('PeripheralDisconnect', originalId);
}

class BluetoothUUIDDisallowed extends BluetoothStatusCode {
  const BluetoothUUIDDisallowed()
      : super('UUIDisallowed',
            _IOSBluetoothStatusCodeConst.CBErrorUUIDNotAllowed);
}

class BluetoothAlreadyAdvertising extends BluetoothStatusCode {
  const BluetoothAlreadyAdvertising()
      : super('AlreadyAdvertising',
            _IOSBluetoothStatusCodeConst.CBErrorAlreadyAdvertising);
}

class BluetoothConnectionFailed extends BluetoothStatusCode {
  const BluetoothConnectionFailed(int originalId)
      : super('ConnectionFailed', originalId);
}

class BluetoothConnectionLimitReached extends BluetoothStatusCode {
  const BluetoothConnectionLimitReached()
      : super('ConnectionLimitReached',
            _IOSBluetoothStatusCodeConst.CBErrorConnectionLimitReached);
}

class BluetoothOperationNotSupported extends BluetoothStatusCode {
  const BluetoothOperationNotSupported()
      : super('OperationNotSuppoerted',
            _IOSBluetoothStatusCodeConst.CBErrorOperationNotSupported);
}

class BluetoothUnknownDevice extends BluetoothStatusCode {
  const BluetoothUnknownDevice()
      : super(
            'UnknownDevice', _IOSBluetoothStatusCodeConst.CBErrorUnknownDevice);
}

class BluetoothEncryptionTimedOut extends BluetoothStatusCode {
  const BluetoothEncryptionTimedOut()
      : super('EncryptionTimedOut',
            _IOSBluetoothStatusCodeConst.CBErrorEncryptionTimedOut);
}

class BluetoothLeGattExceedBackgroundNotificationLimit
    extends BluetoothStatusCode {
  const BluetoothLeGattExceedBackgroundNotificationLimit()
      : super(
            'LeGattExceedBackgroundNotificationLimit',
            _IOSBluetoothStatusCodeConst
                .CBErrorLeGattExceedBackgroundNotificationLimit);
}

class BluetoothLeGattNearBackgroundNotificationLimit
    extends BluetoothStatusCode {
  const BluetoothLeGattNearBackgroundNotificationLimit()
      : super(
            'LeGattNearBackgroundNotificationLimit',
            _IOSBluetoothStatusCodeConst
                .CBErrorLeGattNearBackgroundNotificationLimit);
}

class BluetoothTooManyLEPairedDevices extends BluetoothStatusCode {
  const BluetoothTooManyLEPairedDevices()
      : super('TooManyLEPairedDevices',
            _IOSBluetoothStatusCodeConst.CBErrorTooManyLEPairedDevices);
}

class BluetoothHCIStatusUnknownBTLECommand extends BluetoothStatusCode {
  const BluetoothHCIStatusUnknownBTLECommand()
      : super('HCIUnknownBTLECommand',
            _AndroidBluetoothStatusCodeConst.HCIUnknownBTLECommand);
}

class BluetoothHCIStatusUnknownConnectionId extends BluetoothStatusCode {
  const BluetoothHCIStatusUnknownConnectionId()
      : super('HCIUnknownConnectionId',
            _AndroidBluetoothStatusCodeConst.HCIUnknownConnectionId);
}

class BluetoothHCIAuthenticationFailure extends BluetoothStatusCode {
  const BluetoothHCIAuthenticationFailure()
      : super('HCIAuthenticationFailure',
            _AndroidBluetoothStatusCodeConst.HCIAuthenticationFailure);
}

class BluetoothHCIPinOrKeyMissing extends BluetoothStatusCode {
  const BluetoothHCIPinOrKeyMissing()
      : super('HCIPinOrKeyMissing',
            _AndroidBluetoothStatusCodeConst.HCIPinOrKeyMissing);
}

class BluetoothHCIConnectionTimeout extends BluetoothStatusCode {
  const BluetoothHCIConnectionTimeout()
      : super('HCIConnectionTimeout',
            _AndroidBluetoothStatusCodeConst.HCIConnectionTimeout);
}

class BluetoothHCICommandDisallowed extends BluetoothStatusCode {
  const BluetoothHCICommandDisallowed()
      : super('HCICommandDisallowed',
            _AndroidBluetoothStatusCodeConst.HCICommandDisallowed);
}

class BluetoothHCIRemoteDevTerminationDueToLowResources
    extends BluetoothStatusCode {
  const BluetoothHCIRemoteDevTerminationDueToLowResources()
      : super(
            'HCIRemoteDevTerminationDueToLowResources',
            _AndroidBluetoothStatusCodeConst
                .HCIRemoteDevTerminationDueToLowResources);
}

class BluetoothHCIRemoteDevTerminationDueToPowerOff
    extends BluetoothStatusCode {
  const BluetoothHCIRemoteDevTerminationDueToPowerOff()
      : super(
            'HCIRemoteDevTerminationDueToPowerOff',
            _AndroidBluetoothStatusCodeConst
                .HCIRemoteDevTerminationDueToPowerOff);
}

class BluetoothPeerDeleteParingInformation extends BluetoothStatusCode {
  const BluetoothPeerDeleteParingInformation(int originalId)
      : super('BluetoothPeerDeleteParingInformation', originalId);
}

class BluetoothHCIUnsupportedRemoteFeature extends BluetoothStatusCode {
  const BluetoothHCIUnsupportedRemoteFeature()
      : super('HCIUnsupportedRemoteFeature',
            _AndroidBluetoothStatusCodeConst.HCIUnsupportedRemoteFeature);
}

class BluetoothHCIUnspecifiedError extends BluetoothStatusCode {
  const BluetoothHCIUnspecifiedError()
      : super('HCIUnspecifiedError',
            _AndroidBluetoothStatusCodeConst.HCIUnspecifiedError);
}

class BluetoothHCILMPResponseTimeout extends BluetoothStatusCode {
  const BluetoothHCILMPResponseTimeout()
      : super('HCILMPResponseTimeout',
            _AndroidBluetoothStatusCodeConst.HCILMPResponseTimeout);
}

class BluetoothHCILMPPDUNotAllowed extends BluetoothStatusCode {
  const BluetoothHCILMPPDUNotAllowed()
      : super('HCILMPPDUNotAllowed',
            _AndroidBluetoothStatusCodeConst.HCILMPPDUNotAllowed);
}

class BluetoothHCIInstantPassed extends BluetoothStatusCode {
  const BluetoothHCIInstantPassed()
      : super('HCIInstantPassed',
            _AndroidBluetoothStatusCodeConst.HCIInstantPassed);
}

class BluetoothHCIPairingWithUnitKeyUnsupported extends BluetoothStatusCode {
  const BluetoothHCIPairingWithUnitKeyUnsupported()
      : super('HCIPairingWithUnitKeyUnsupported',
            _AndroidBluetoothStatusCodeConst.HCIPairingWithUnitKeyUnsupported);
}

class BluetoothHCIDifferentTransactionCollision extends BluetoothStatusCode {
  const BluetoothHCIDifferentTransactionCollision()
      : super('HCIDifferentTransactionCollision',
            _AndroidBluetoothStatusCodeConst.HCIDifferentTransactionCollision);
}

class BluetoothHCIControllerBusy extends BluetoothStatusCode {
  const BluetoothHCIControllerBusy()
      : super('HCIControllerBusy',
            _AndroidBluetoothStatusCodeConst.HCIControllerBusy);
}

class BluetoothHCIConnIntervalUnAcceptable extends BluetoothStatusCode {
  const BluetoothHCIConnIntervalUnAcceptable()
      : super('HCIConnIntervalUnAcceptable',
            _AndroidBluetoothStatusCodeConst.HCIConnIntervalUnAcceptable);
}

class BluetoothHCIDirectedAdvertiserTimeout extends BluetoothStatusCode {
  const BluetoothHCIDirectedAdvertiserTimeout()
      : super('HCIDirectedAdvertiserTimeout',
            _AndroidBluetoothStatusCodeConst.HCIDirectedAdvertiserTimeout);
}

class BluetoothHCIConnTerminatedDueToMicFailure extends BluetoothStatusCode {
  const BluetoothHCIConnTerminatedDueToMicFailure()
      : super('HCIConnTerminatedDueToMicFailure',
            _AndroidBluetoothStatusCodeConst.HCIConnTerminatedDueToMicFailure);
}

class BluetoothHCIConnFailedToBeEstablished extends BluetoothStatusCode {
  const BluetoothHCIConnFailedToBeEstablished()
      : super('HCIConnFailedToBeEstablished',
            _AndroidBluetoothStatusCodeConst.HCIConnFailedToBeEstablished);
}

class BluetoothGATTNoResources extends BluetoothStatusCode {
  const BluetoothGATTNoResources()
      : super('GATTNoResources',
            _AndroidBluetoothStatusCodeConst.GATTNoResources);
}

class BluetoothGATTInternalError extends BluetoothStatusCode {
  const BluetoothGATTInternalError()
      : super('GATTInternalError',
            _AndroidBluetoothStatusCodeConst.GATTInternalError);
}

class BluetoothGATTWrongState extends BluetoothStatusCode {
  const BluetoothGATTWrongState()
      : super(
            'GATTWrongState', _AndroidBluetoothStatusCodeConst.GATTWrongState);
}

class BluetoothGATTDBFull extends BluetoothStatusCode {
  const BluetoothGATTDBFull()
      : super('GATTDBFull', _AndroidBluetoothStatusCodeConst.GATTDBFull);
}

class BluetoothGATTBusy extends BluetoothStatusCode {
  const BluetoothGATTBusy()
      : super('GATTBusy', _AndroidBluetoothStatusCodeConst.GATTBusy);
}

class BluetoothGATTError extends BluetoothStatusCode {
  const BluetoothGATTError()
      : super('GATTError', _AndroidBluetoothStatusCodeConst.GATTError);
}

class BluetoothGATTCmdStarted extends BluetoothStatusCode {
  const BluetoothGATTCmdStarted()
      : super(
            'GATTCmdStarted', _AndroidBluetoothStatusCodeConst.GATTCmdStarted);
}

class BluetoothGATTIllegalParameter extends BluetoothStatusCode {
  const BluetoothGATTIllegalParameter()
      : super('GATTIllegalParameter',
            _AndroidBluetoothStatusCodeConst.GATTIllegalParameter);
}

class BluetoothGATTAuthFail extends BluetoothStatusCode {
  const BluetoothGATTAuthFail()
      : super('GATTAuthFail', _AndroidBluetoothStatusCodeConst.GATTAuthFail);
}

class BluetoothGATTMore extends BluetoothStatusCode {
  const BluetoothGATTMore()
      : super('GATTMore', _AndroidBluetoothStatusCodeConst.GATTMore);
}

class BluetoothGATTInvalidCfg extends BluetoothStatusCode {
  const BluetoothGATTInvalidCfg()
      : super(
            'GATTInvalidCfg', _AndroidBluetoothStatusCodeConst.GATTInvalidCfg);
}

class BluetoothGATTServiceStarted extends BluetoothStatusCode {
  const BluetoothGATTServiceStarted()
      : super('GATTServiceStarted',
            _AndroidBluetoothStatusCodeConst.GATTServiceStarted);
}

class BluetoothGATTEncryptedNoMITM extends BluetoothStatusCode {
  const BluetoothGATTEncryptedNoMITM()
      : super('GATTEncryptedNoMITM',
            _AndroidBluetoothStatusCodeConst.GATTEncryptedNoMITM);
}

class BluetoothGATTNotEncrypted extends BluetoothStatusCode {
  const BluetoothGATTNotEncrypted()
      : super('GATTNotEncrypted',
            _AndroidBluetoothStatusCodeConst.GATTNotEncrypted);
}

class BluetoothGATTCongested extends BluetoothStatusCode {
  const BluetoothGATTCongested()
      : super('GATTCongested', _AndroidBluetoothStatusCodeConst.GATTCongested);
}

class BluetoothGATTCCCCfgErr extends BluetoothStatusCode {
  const BluetoothGATTCCCCfgErr()
      : super('GATTCCCCfgErr', _AndroidBluetoothStatusCodeConst.GATTCCCCfgErr);
}

class BluetoothGATTPrcInProgress extends BluetoothStatusCode {
  const BluetoothGATTPrcInProgress()
      : super('GATTPrcInProgress',
            _AndroidBluetoothStatusCodeConst.GATTPrcInProgress);
}

class BluetoothGATTOutOfRange extends BluetoothStatusCode {
  const BluetoothGATTOutOfRange()
      : super(
            'GATTOutOfRange', _AndroidBluetoothStatusCodeConst.GATTOutOfRange);
}
