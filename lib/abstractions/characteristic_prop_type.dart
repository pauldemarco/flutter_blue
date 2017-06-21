/// <summary>
/// Represents the properties of a characteristic.
/// It's a superset of all common platform specific properties.
/// See: https://github.com/xabre/xamarin-bluetooth-le/blob/master/doc/characteristics.md
/// </summary>
abstract class CharacteristicPropertyType {
  /// <summary>
  /// Characteristic value can be broadcasted.
  /// </summary>
  static const int broadcast = 1;

  /// <summary>
  /// Characteristic value can be read.
  /// </summary>
  static const int read = 2;

  /// <summary>
  /// Characteristic value can be written without response.
  /// </summary>
  static const writeWithoutResponse = 4;

  /// <summary>
  /// Characteristic can be written with response.
  /// </summary>
  static const write = 8;

  /// <summary>
  /// Characteristic can notify value changes without acknowledgement.
  /// </summary>
  static const notify = 16;

  /// <summary>
  ///Characteristic can indicate value changes with acknowledgement.
  /// </summary>
  static const indicate = 32;

  /// <summary>
  /// Characteristic value can be written signed.
  /// </summary>
  static const authenticatedSignedWrites = 64;

  /// <summary>
  /// Indicates that more properties are set in the extended properties descriptor.
  /// </summary>
  static const extendedProperties = 128;

  static const notifyEncryptionRequired = 256; //0x100
  static const indicateEncryptionRequired = 512; //0x200
}
