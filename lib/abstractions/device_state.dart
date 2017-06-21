enum DeviceState {

  // Device is disconnected.
  disconnected,

  // Device is connecting.
  connecting,

  // Device is connected.
  connected,

  // Android: Device is connected to the system. Connect to it by using the Adapter.
  limited
}