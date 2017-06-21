// State of the bluetooth adapter.
enum BluetoothState {
  // A meaningful state could not be determined at this time.
  unknown,

  // The device does not support bluetooth LE.
  unavailable,

  // The user has not granted the needed permissions.
  unauthorized,

  // The adapter is powering on.
  turningOn,

  // The adapter is powered on.
  on,

  // The adapter is powering down.
  turningOff,

  // The adapter is off.
  off
}