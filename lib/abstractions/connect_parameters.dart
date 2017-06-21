/// Connection parameters. Contains platform specific parameters needed to achieved connection
class ConnectParameters {

  /// Android only: Automatically try to reconnect to the device, after the connection got lost. The default is false.
  final bool autoConnect;

  /// Android only: For Dual Mode device, force transport mode to LE. The default is false.
  final bool forceBleTransport;

  /// Constructor
  /// [autoConnect] Android only: Automatically try to reconnect to the device, after the connection got lost. The default is false.
  /// [forceBleTransport] Android only: For Dual Mode device, force transport mode to LE. The default is false.
  ConnectParameters({this.autoConnect = false, this.forceBleTransport = false});

  static ConnectParameters none() {
    return new ConnectParameters();
  }
}