
part of flutter_blue;

class _BluetoothStatusCodeConst {
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

class BluetoothStatusCode {
  final String name;
  final int id;
  const BluetoothStatusCode(this.name, this.id);

  factory BluetoothStatusCode.fromId(int id) {
    switch (id) {
      case _BluetoothStatusCodeConst.Success:
        return BluetoothStatusSuccess();
      case _BluetoothStatusCodeConst.HCIUnknownBTLECommand:
        return BluetoothHCIStatusUnknownBTLECommand();
      case _BluetoothStatusCodeConst.HCIUnknownConnectionId:
        return BluetoothHCIStatusUnknownConnectionId();
      case _BluetoothStatusCodeConst.HCIAuthenticationFailure:
        return BluetoothHCIAuthenticationFailure();

      case _BluetoothStatusCodeConst.HCIPinOrKeyMissing:
        return BluetoothHCIPinOrKeyMissing();
      case _BluetoothStatusCodeConst.HCIMemoryCapacityExceeded:
        return BluetoothHCIMemoryCapacityExceeded();
      case _BluetoothStatusCodeConst.HCIConnectionTimeout:
        return BluetoothHCIConnectionTimeout();
      case _BluetoothStatusCodeConst.HCICommandDisallowed:
        return BluetoothHCICommandDisallowed();
      case _BluetoothStatusCodeConst.HCIInvalidBTLECommandParameters:
        return BluetoothHCIInvalidBTLECommandParameters();
      case _BluetoothStatusCodeConst.HCIRemoteUserTerminatedConnection:
        return BluetoothHCIRemoteUserTerminatedConnection();
      case _BluetoothStatusCodeConst.HCIRemoteDevTerminationDueToLowResources:
        return BluetoothHCIRemoteDevTerminationDueToLowResources();
      case _BluetoothStatusCodeConst.HCIRemoteDevTerminationDueToPowerOff:
        return BluetoothHCIRemoteDevTerminationDueToPowerOff();
      case _BluetoothStatusCodeConst.HCILocalHostTerminatedConnection:
        return BluetoothHCILocalHostTerminatedConnection();
      case _BluetoothStatusCodeConst.HCIUnsupportedRemoteFeature:
        return BluetoothHCIUnsupportedRemoteFeature();
      case _BluetoothStatusCodeConst.HCIInvalidLMPParameters:
        return BluetoothHCIInvalidLMPParameters();
      case _BluetoothStatusCodeConst.HCIUnspecifiedError:
        return BluetoothHCIUnspecifiedError();
      case _BluetoothStatusCodeConst.HCILMPResponseTimeout:
        return BluetoothHCILMPResponseTimeout();
      case _BluetoothStatusCodeConst.HCILMPPDUNotAllowed:
        return BluetoothHCILMPPDUNotAllowed();
      case _BluetoothStatusCodeConst.HCIInstantPassed:
        return BluetoothHCIInstantPassed();
      case _BluetoothStatusCodeConst.HCIPairingWithUnitKeyUnsupported:
        return BluetoothHCIPairingWithUnitKeyUnsupported();
      case _BluetoothStatusCodeConst.HCIDifferentTransactionCollision:
        return BluetoothHCIDifferentTransactionCollision();
      case _BluetoothStatusCodeConst.HCIControllerBusy:
        return BluetoothHCIControllerBusy();
      case _BluetoothStatusCodeConst.HCIConnIntervalUnAcceptable:
        return BluetoothHCIConnIntervalUnAcceptable();
      case _BluetoothStatusCodeConst.HCIDirectedAdvertiserTimeout:
        return BluetoothHCIDirectedAdvertiserTimeout();
      case _BluetoothStatusCodeConst.HCIConnTerminatedDueToMicFailure:
        return BluetoothHCIConnTerminatedDueToMicFailure();
      case _BluetoothStatusCodeConst.HCIConnFailedToBeEstablished:
        return BluetoothHCIConnFailedToBeEstablished();
      case _BluetoothStatusCodeConst.GATTNoResources:
        return BluetoothGATTNoResources();
      case _BluetoothStatusCodeConst.GATTInternalError:
        return BluetoothGATTInternalError();
      case _BluetoothStatusCodeConst.GATTWrongState:
        return BluetoothGATTWrongState();
      case _BluetoothStatusCodeConst.GATTDBFull:
        return BluetoothGATTDBFull();
      case _BluetoothStatusCodeConst.GATTBusy:
        return BluetoothGATTBusy();
      case _BluetoothStatusCodeConst.GATTError:
        return BluetoothGATTError();
      case _BluetoothStatusCodeConst.GATTCmdStarted:
        return BluetoothGATTCmdStarted();
      case _BluetoothStatusCodeConst.GATTIllegalParameter:
        return BluetoothGATTIllegalParameter();
      case _BluetoothStatusCodeConst.GATTAuthFail:
        return BluetoothGATTAuthFail();
      case _BluetoothStatusCodeConst.GATTMore:
        return BluetoothGATTMore();
      case _BluetoothStatusCodeConst.GATTInvalidCfg:
        return BluetoothGATTInvalidCfg();
      case _BluetoothStatusCodeConst.GATTServiceStarted:
        return BluetoothGATTServiceStarted();
      case _BluetoothStatusCodeConst.GATTEncryptedNoMITM:
        return BluetoothGATTEncryptedNoMITM();
      case _BluetoothStatusCodeConst.GATTNotEncrypted:
        return BluetoothGATTNotEncrypted();
      case _BluetoothStatusCodeConst.GATTCongested:
        return BluetoothGATTCongested();
      case _BluetoothStatusCodeConst.GATTCCCCfgErr:
        return BluetoothGATTCCCCfgErr();
      case _BluetoothStatusCodeConst.GATTPrcInProgress:
        return BluetoothGATTPrcInProgress();
      case _BluetoothStatusCodeConst.GATTOutOfRange:
        return BluetoothGATTOutOfRange();
    }

    return BluetoothStatusCode('Unknown', -1);
  }
}

class BluetoothStatusSuccess extends BluetoothStatusCode {
  const BluetoothStatusSuccess()
      : super('Success', _BluetoothStatusCodeConst.Success);
}

class BluetoothHCIStatusUnknownBTLECommand extends BluetoothStatusCode {
  const BluetoothHCIStatusUnknownBTLECommand()
      : super('HCIUnknownBTLECommand',
            _BluetoothStatusCodeConst.HCIUnknownBTLECommand);
}

class BluetoothHCIStatusUnknownConnectionId extends BluetoothStatusCode {
  const BluetoothHCIStatusUnknownConnectionId()
      : super('HCIUnknownConnectionId',
            _BluetoothStatusCodeConst.HCIUnknownConnectionId);
}

class BluetoothHCIAuthenticationFailure extends BluetoothStatusCode {
  const BluetoothHCIAuthenticationFailure()
      : super('HCIAuthenticationFailure',
            _BluetoothStatusCodeConst.HCIAuthenticationFailure);
}

class BluetoothHCIPinOrKeyMissing extends BluetoothStatusCode {
  const BluetoothHCIPinOrKeyMissing()
      : super(
            'HCIPinOrKeyMissing', _BluetoothStatusCodeConst.HCIPinOrKeyMissing);
}

class BluetoothHCIMemoryCapacityExceeded extends BluetoothStatusCode {
  const BluetoothHCIMemoryCapacityExceeded()
      : super('HCIMemoryCapacityExceeded',
            _BluetoothStatusCodeConst.HCIMemoryCapacityExceeded);
}

class BluetoothHCIConnectionTimeout extends BluetoothStatusCode {
  const BluetoothHCIConnectionTimeout()
      : super('HCIConnectionTimeout',
            _BluetoothStatusCodeConst.HCIConnectionTimeout);
}

class BluetoothHCICommandDisallowed extends BluetoothStatusCode {
  const BluetoothHCICommandDisallowed()
      : super('HCICommandDisallowed',
            _BluetoothStatusCodeConst.HCICommandDisallowed);
}

class BluetoothHCIInvalidBTLECommandParameters extends BluetoothStatusCode {
  const BluetoothHCIInvalidBTLECommandParameters()
      : super('HCIInvalidBTLECommandParameters',
            _BluetoothStatusCodeConst.HCIInvalidBTLECommandParameters);
}

class BluetoothHCIRemoteUserTerminatedConnection extends BluetoothStatusCode {
  const BluetoothHCIRemoteUserTerminatedConnection()
      : super('HCIRemoteUserTerminatedConnection',
            _BluetoothStatusCodeConst.HCIRemoteUserTerminatedConnection);
}

class BluetoothHCIRemoteDevTerminationDueToLowResources
    extends BluetoothStatusCode {
  const BluetoothHCIRemoteDevTerminationDueToLowResources()
      : super('HCIRemoteDevTerminationDueToLowResources',
            _BluetoothStatusCodeConst.HCIRemoteDevTerminationDueToLowResources);
}

class BluetoothHCIRemoteDevTerminationDueToPowerOff
    extends BluetoothStatusCode {
  const BluetoothHCIRemoteDevTerminationDueToPowerOff()
      : super('HCIRemoteDevTerminationDueToPowerOff',
            _BluetoothStatusCodeConst.HCIRemoteDevTerminationDueToPowerOff);
}

class BluetoothHCILocalHostTerminatedConnection extends BluetoothStatusCode {
  const BluetoothHCILocalHostTerminatedConnection()
      : super('HCILocalHostTerminatedConnection',
            _BluetoothStatusCodeConst.HCILocalHostTerminatedConnection);
}

class BluetoothHCIUnsupportedRemoteFeature extends BluetoothStatusCode {
  const BluetoothHCIUnsupportedRemoteFeature()
      : super('HCIUnsupportedRemoteFeature',
            _BluetoothStatusCodeConst.HCIUnsupportedRemoteFeature);
}

class BluetoothHCIInvalidLMPParameters extends BluetoothStatusCode {
  const BluetoothHCIInvalidLMPParameters()
      : super('HCIInvalidLMPParameters',
            _BluetoothStatusCodeConst.HCIInvalidLMPParameters);
}

class BluetoothHCIUnspecifiedError extends BluetoothStatusCode {
  const BluetoothHCIUnspecifiedError()
      : super('HCIUnspecifiedError',
            _BluetoothStatusCodeConst.HCIUnspecifiedError);
}

class BluetoothHCILMPResponseTimeout extends BluetoothStatusCode {
  const BluetoothHCILMPResponseTimeout()
      : super('HCILMPResponseTimeout',
            _BluetoothStatusCodeConst.HCILMPResponseTimeout);
}

class BluetoothHCILMPPDUNotAllowed extends BluetoothStatusCode {
  const BluetoothHCILMPPDUNotAllowed()
      : super('HCILMPPDUNotAllowed',
            _BluetoothStatusCodeConst.HCILMPPDUNotAllowed);
}

class BluetoothHCIInstantPassed extends BluetoothStatusCode {
  const BluetoothHCIInstantPassed()
      : super('HCIInstantPassed', _BluetoothStatusCodeConst.HCIInstantPassed);
}

class BluetoothHCIPairingWithUnitKeyUnsupported extends BluetoothStatusCode {
  const BluetoothHCIPairingWithUnitKeyUnsupported()
      : super('HCIPairingWithUnitKeyUnsupported',
            _BluetoothStatusCodeConst.HCIPairingWithUnitKeyUnsupported);
}

class BluetoothHCIDifferentTransactionCollision extends BluetoothStatusCode {
  const BluetoothHCIDifferentTransactionCollision()
      : super('HCIDifferentTransactionCollision',
            _BluetoothStatusCodeConst.HCIDifferentTransactionCollision);
}

class BluetoothHCIControllerBusy extends BluetoothStatusCode {
  const BluetoothHCIControllerBusy()
      : super('HCIControllerBusy', _BluetoothStatusCodeConst.HCIControllerBusy);
}

class BluetoothHCIConnIntervalUnAcceptable extends BluetoothStatusCode {
  const BluetoothHCIConnIntervalUnAcceptable()
      : super('HCIConnIntervalUnAcceptable',
            _BluetoothStatusCodeConst.HCIConnIntervalUnAcceptable);
}

class BluetoothHCIDirectedAdvertiserTimeout extends BluetoothStatusCode {
  const BluetoothHCIDirectedAdvertiserTimeout()
      : super('HCIDirectedAdvertiserTimeout',
            _BluetoothStatusCodeConst.HCIDirectedAdvertiserTimeout);
}

class BluetoothHCIConnTerminatedDueToMicFailure extends BluetoothStatusCode {
  const BluetoothHCIConnTerminatedDueToMicFailure()
      : super('HCIConnTerminatedDueToMicFailure',
            _BluetoothStatusCodeConst.HCIConnTerminatedDueToMicFailure);
}

class BluetoothHCIConnFailedToBeEstablished extends BluetoothStatusCode {
  const BluetoothHCIConnFailedToBeEstablished()
      : super('HCIConnFailedToBeEstablished',
            _BluetoothStatusCodeConst.HCIConnFailedToBeEstablished);
}

class BluetoothGATTNoResources extends BluetoothStatusCode {
  const BluetoothGATTNoResources()
      : super('GATTNoResources', _BluetoothStatusCodeConst.GATTNoResources);
}

class BluetoothGATTInternalError extends BluetoothStatusCode {
  const BluetoothGATTInternalError()
      : super('GATTInternalError', _BluetoothStatusCodeConst.GATTInternalError);
}

class BluetoothGATTWrongState extends BluetoothStatusCode {
  const BluetoothGATTWrongState()
      : super('GATTWrongState', _BluetoothStatusCodeConst.GATTWrongState);
}

class BluetoothGATTDBFull extends BluetoothStatusCode {
  const BluetoothGATTDBFull()
      : super('GATTDBFull', _BluetoothStatusCodeConst.GATTDBFull);
}

class BluetoothGATTBusy extends BluetoothStatusCode {
  const BluetoothGATTBusy()
      : super('GATTBusy', _BluetoothStatusCodeConst.GATTBusy);
}

class BluetoothGATTError extends BluetoothStatusCode {
  const BluetoothGATTError()
      : super('GATTError', _BluetoothStatusCodeConst.GATTError);
}

class BluetoothGATTCmdStarted extends BluetoothStatusCode {
  const BluetoothGATTCmdStarted()
      : super('GATTCmdStarted', _BluetoothStatusCodeConst.GATTCmdStarted);
}

class BluetoothGATTIllegalParameter extends BluetoothStatusCode {
  const BluetoothGATTIllegalParameter()
      : super('GATTIllegalParameter',
            _BluetoothStatusCodeConst.GATTIllegalParameter);
}

class BluetoothGATTAuthFail extends BluetoothStatusCode {
  const BluetoothGATTAuthFail()
      : super('GATTAuthFail', _BluetoothStatusCodeConst.GATTAuthFail);
}

class BluetoothGATTMore extends BluetoothStatusCode {
  const BluetoothGATTMore()
      : super('GATTMore', _BluetoothStatusCodeConst.GATTMore);
}

class BluetoothGATTInvalidCfg extends BluetoothStatusCode {
  const BluetoothGATTInvalidCfg()
      : super('GATTInvalidCfg', _BluetoothStatusCodeConst.GATTInvalidCfg);
}

class BluetoothGATTServiceStarted extends BluetoothStatusCode {
  const BluetoothGATTServiceStarted()
      : super(
            'GATTServiceStarted', _BluetoothStatusCodeConst.GATTServiceStarted);
}

class BluetoothGATTEncryptedNoMITM extends BluetoothStatusCode {
  const BluetoothGATTEncryptedNoMITM()
      : super('GATTEncryptedNoMITM',
            _BluetoothStatusCodeConst.GATTEncryptedNoMITM);
}

class BluetoothGATTNotEncrypted extends BluetoothStatusCode {
  const BluetoothGATTNotEncrypted()
      : super('GATTNotEncrypted', _BluetoothStatusCodeConst.GATTNotEncrypted);
}

class BluetoothGATTCongested extends BluetoothStatusCode {
  const BluetoothGATTCongested()
      : super('GATTCongested', _BluetoothStatusCodeConst.GATTCongested);
}

class BluetoothGATTCCCCfgErr extends BluetoothStatusCode {
  const BluetoothGATTCCCCfgErr()
      : super('GATTCCCCfgErr', _BluetoothStatusCodeConst.GATTCCCCfgErr);
}

class BluetoothGATTPrcInProgress extends BluetoothStatusCode {
  const BluetoothGATTPrcInProgress()
      : super('GATTPrcInProgress', _BluetoothStatusCodeConst.GATTPrcInProgress);
}

class BluetoothGATTOutOfRange extends BluetoothStatusCode {
  const BluetoothGATTOutOfRange()
      : super('GATTOutOfRange', _BluetoothStatusCodeConst.GATTOutOfRange);
}
