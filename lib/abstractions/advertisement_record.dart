import 'dart:typed_data';

class AdvertisementRecordType {
  static const FLAGS                          = const AdvertisementRecordType._internal(1);
  static const UUIDS_INCOMPLETE_16BIT         = const AdvertisementRecordType._internal(2);
  static const UUIDS_COMPLETE_16BIT           = const AdvertisementRecordType._internal(3);
  static const UUIDS_INCOMPLETE_32BIT         = const AdvertisementRecordType._internal(4);
  static const UUID_COM_32BIT                 = const AdvertisementRecordType._internal(5);
  static const UUIDS_INCOMPLETE_128BIT        = const AdvertisementRecordType._internal(6);
  static const UUIDS_COMPLETE_128BIT          = const AdvertisementRecordType._internal(7);
  static const SHORT_LOCAL_NAME               = const AdvertisementRecordType._internal(8);
  static const COMPLETE_LOCAL_NAME            = const AdvertisementRecordType._internal(9);
  static const TX_POWER_LEVEL                 = const AdvertisementRecordType._internal(10);
  static const UNUSED_11                      = const AdvertisementRecordType._internal(11);
  static const UNUSED_12                      = const AdvertisementRecordType._internal(12);
  static const DEVICE_CLASS                   = const AdvertisementRecordType._internal(13);
  static const SIMPLE_PAIRING_HASH            = const AdvertisementRecordType._internal(14);
  static const SIMPLE_PAIRING_RANDOMIZER      = const AdvertisementRecordType._internal(15);
  static const DEVICE_ID                      = const AdvertisementRecordType._internal(16);
  static const SECURITY_MANAGER               = const AdvertisementRecordType._internal(17);
  static const SLAVE_CONNECTION_INTERVAL      = const AdvertisementRecordType._internal(18);
  static const UNUSED_19                      = const AdvertisementRecordType._internal(19);
  static const SS_UUIDS_16BIT                 = const AdvertisementRecordType._internal(20);
  static const SS_UUIDS_128BIT                = const AdvertisementRecordType._internal(21);
  static const SERVICE_DATA                   = const AdvertisementRecordType._internal(22);
  static const PUBLIC_TARGET_ADDR             = const AdvertisementRecordType._internal(23);
  static const RANDOM_TARGET_ADDR             = const AdvertisementRecordType._internal(24);
  static const APPEARANCE                     = const AdvertisementRecordType._internal(25);
  static const UNUSED_26                      = const AdvertisementRecordType._internal(26);
  static const DEVICE_ADDRESS                 = const AdvertisementRecordType._internal(27);
  static const LE_ROLE                        = const AdvertisementRecordType._internal(28);
  static const PAIRING_HASH                   = const AdvertisementRecordType._internal(29);
  static const PAIRING_RANDOMIZER             = const AdvertisementRecordType._internal(30);
  static const SS_UUIDS_32BIT                 = const AdvertisementRecordType._internal(31);
  static const SERVICE_DATA_UUID_32BIT        = const AdvertisementRecordType._internal(32);
  static const SERVICE_DATA_128BIT            = const AdvertisementRecordType._internal(33);
  static const SECURE_CONNECTIONS_CONF_VALUE  = const AdvertisementRecordType._internal(34);
  static const SECURE_CONNECTIONS_RAND_VALUE  = const AdvertisementRecordType._internal(35);
  static const URI                            = const AdvertisementRecordType._internal(36);
  static const INDOOR_POSITIONING             = const AdvertisementRecordType._internal(37);
  static const TRANSPORT_DISCOVERY_DATA       = const AdvertisementRecordType._internal(38);
  static const INFORMATION_DATA_3D            = const AdvertisementRecordType._internal(61);
  static const MANUF_SPECIF_DATA              = const AdvertisementRecordType._internal(255);

  final int _type;

  const AdvertisementRecordType._internal(this._type);
}

enum AdvertisementRecordTypeEnum {
  unused0,

  /// <summary>
  /// «Flags»	Bluetooth Core Specification:
  /// </summary>
  flags,

  /// <summary>
  ///«Incomplete List of 16-bit Service Class UUIDs»	Bluetooth Core
  /// </summary>
  uuidsIncomple16Bit,

  /// <summary>
  /// «Complete List of 16-bit Service Class UUIDs»	Bluetooth Core
  /// </summary>
  uuidsComplete16Bit,

  /// <summary>
  /// «Incomplete List of 32-bit Service Class UUIDs»	Bluetooth Core
  /// </summary>
  uuidsIncomplete32Bit,

  /// <summary>
  /// «Complete List of 32-bit Service Class UUIDs»	Bluetooth Core Specification:
  /// </summary>
  uuidCom32Bit,

  /// <summary>
  /// «Incomplete List of 128-bit Service Class UUIDs»	Bluetooth Core
  /// </summary>
  uuidsIncomplete128Bit,

  /// <summary>
  /// //«Complete List of 128-bit Service Class UUIDs»	Bluetooth Core
  /// </summary>
  uuidsComplete128Bit,

  /// <summary>
  /// «Shortened Local Name»	Bluetooth Core Specification:
  /// </summary>
  shortLocalName,

  /// <summary>
  /// «Complete Local Name»	Bluetooth Core Specification:
  /// </summary>
  completeLocalName,

  /// <summary>
  /// «Tx Power Level»	Bluetooth Core Specification:
  /// </summary>
  txPowerLevel,

  unused11,
  unused12,

  /// <summary>
  /// «Class of Device»	Bluetooth Core Specification:
  /// </summary>
  deviceclass,

  /// <summary>
  /// «Simple Pairing Hash C»	Bluetooth Core Specification:
  /// ​«Simple Pairing Hash C-192»	​Core Specification Supplement, Part A, section 1.6
  /// </summary>
  simplePairingHash,

  /// <summary>
  /// «Simple Pairing Randomizer R»	Bluetooth Core Specification:
  /// ​«Simple Pairing Randomizer R-192»	​Core Specification Supplement, Part A, section 1.6
  /// </summary>
  simplePairingRandomizer,

  /// <summary>
  /// «Device Id»	Device Id Profile v1.3 or later,«Security Manager TK Value»
  /// Bluetooth Core Specification:
  /// </summary>
  deviceId,

  /// <summary>
  /// «Security Manager Out of Band Flags»	Bluetooth Core Specification:
  /// </summary>
  securityManager,

  /// <summary>
  /// «Slave Connection Interval Range»	Bluetooth Core Specification:
  /// </summary>
  slaveConnectionInterval,

  unused19,

  /// <summary>
  /// «List of 16-bit Service Solicitation UUIDs»	Bluetooth Core Specification:
  /// </summary>
  ssUuids16Bit,

  /// <summary>
  /// «List of 128-bit Service Solicitation UUIDs»	Bluetooth Core Specification:
  /// </summary>
  ssUuids128Bit,

  /// <summary>
  /// «Service Data»	Bluetooth Core Specification:​«Service Data - 16-bit UUID»
  /// 	​Core Specification Supplement, Part A, section 1.11
  /// </summary>
  serviceData,

  /// <summary>
  /// «Public Target Address»	Bluetooth Core Specification:
  /// </summary>
  publicTargetAddress,

  /// <summary>
  /// «Random Target Address»	Bluetooth Core Specification:
  /// </summary>
  randomTargetAddress,

  /// <summary>
  /// «Appearance»	Bluetooth Core Specification:
  /// </summary>
  appearance,

  unused26,

  /// <summary>
  /// «​LE Bluetooth Device Address»	​Core Specification Supplement, Part A, section 1.16
  /// </summary>
  deviceAddress,

  /// <summary>
  /// «​LE Role»	​Core Specification Supplement, Part A, section 1.17
  /// </summary>
  leRole,

  /// <summary>
  /// «​Simple Pairing Hash C-256»	​Core Specification Supplement, Part A, section 1.6
  /// </summary>
  pairingHash,

  /// <summary>
  /// «​Simple Pairing Randomizer R-256»	​Core Specification Supplement, Part A, section 1.6
  /// </summary>
  pairingRandomizer,

  /// <summary>
  /// List of 32-bit Service Solicitation UUIDs»	​Core Specification Supplement, Part A, section 1.10
  /// </summary>
  ssUuids32Bit,

  /// <summary>
  /// //​«Service Data - 32-bit UUID»	​Core Specification Supplement, Part A, section 1.11
  /// </summary>
  serviceDataUuid32Bit,

  /// <summary>
  /// ​«Service Data - 128-bit UUID»	​Core Specification Supplement, Part A, section 1.11
  /// </summary>
  serviceData128Bit,

  /// <summary>
  /// «​LE Secure Connections Confirmation Value»	​Core Specification Supplement Part A, Section 1.6
  /// </summary>
  secureConnectionsConfirmationValue,

  /// <summary>
  /// ​​«​LE Secure Connections Random Value»	​Core Specification Supplement Part A, Section 1.6​
  /// </summary>
  secureConnectionsRandomValue
}

// TODO Too much of a break to put these into the enum
/// <summary>
/// «3D Information Data»	​3D Synchronization Profile, v1.0 or later
/// </summary>
const information3DData = 0x3D;

/// <summary>
/// «Manufacturer Specific Data»	Bluetooth Core Specification:
/// </summary>
const manufacturerSpecificData = 0xFF;

/// <summary>
/// The is connectable flag. This is only reliable for the ios imlementation. The android stack does not expose this in the client.
/// </summary>
const isConnectable = 0xAA;

class AdvertisementRecord {
  final int type;
  final Uint8List data;

  const AdvertisementRecord(this.type, this.data);

  String ToString() {
    return "Adv rec [Type $type; Data $data]";
  }

  static List<AdvertisementRecord> listFromBytes(Uint8List bytes) {
    List<AdvertisementRecord> records = new List();

    int index = 0;
    while (index < bytes.length) {
      int length = bytes[index++];
      //Done once we run out of records
      if (length == 0) break;

      int type = bytes[index];
      //Done if our record isn't a valid type
      if (type == 0) break;

      Uint8List data = bytes.sublist(index+1, index+length);
      print("advertisement type: $type data: $data");
      records.add(new AdvertisementRecord(type, data));

      //Advance
      index += length;
    }

    return records;
  }

}
