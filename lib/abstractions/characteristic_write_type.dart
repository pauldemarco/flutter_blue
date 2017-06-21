/// <summary>
/// Specifies how a value should be written.
/// </summary>
enum CharacteristicWriteType
{
  /// <summary>
  /// Value should be written with response if supported, else without response.
  /// </summary>
  Default,

  /// <summary>
  /// Value should be written with response.
  /// </summary>
  withResponse,

  /// <summary>
  /// Value should be written without response.
  /// </summary>
  withoutResponse
}