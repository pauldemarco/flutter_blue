part of flutter_blue;

class FlutterBlue {
  final MethodChannel _channel = const MethodChannel('$NAMESPACE/methods');
  final EventChannel _stateChannel = const EventChannel('$NAMESPACE/state');
  final EventChannel _scanResultChannel =
      const EventChannel('$NAMESPACE/scanResult');

  /// Singleton boilerplate
  FlutterBlue._() {
    _channel.setMethodCallHandler((MethodCall call) {
      if (call.method == 'Event') {
        //final Event event = new Event._(call.arguments);
        //_observers[call.arguments['handle']].add(event);
      }
    });
  }
  static FlutterBlue _instance = new FlutterBlue._();
  static FlutterBlue get instance => _instance;

  /// Checks whether the device supports Bluetooth
  Future<bool> get isAvailable => _channel.invokeMethod('isAvailable');

  /// Checks if Bluetooth functionality is turned on
  Future<bool> get isOn => _channel.invokeMethod('isOn');

  /// Gets the current state of the Bluetooth module
  Future<BluetoothState> get state {
    return _channel
        .invokeMethod('getState')
        .then((i) => BluetoothState.values[i]);
  }

  /// Occurs when the bluetooth state has changed
  Stream<BluetoothState> onStateChanged() {
    return _stateChannel
        .receiveBroadcastStream()
        .map((i) => BluetoothState.values[i]);
  }

  /// Starts a scan for Bluetooth Low Energy devices
  Stream<ScanResult> startScan({
    ScanMode scanMode = ScanMode.lowLatency,
    List<Guid> withServices = const [],
    List<Guid> withDevices = const [],
  }) async* {
    var settings = protos.ScanSettings.create()
      ..androidScanMode = scanMode.value
      ..serviceUuids.addAll(withServices.map((g) => g.toMac()).toList());

    await _channel.invokeMethod('startScan', settings.writeToBuffer());

    yield* _scanResultChannel
        .receiveBroadcastStream()
        .map((List<int> data) => new protos.ScanResult.fromBuffer(data))
        .map((p) => new ScanResult(
              name: p.name,
              identifier: new Guid.fromMac(p.remoteId),
              rssi: p.rssi,
              advertisementData: p.advertisementData,
            ));
  }

  /// Stops a scan for Bluetooth Low Energy devices
  Future<Null> stopScan() => _channel.invokeMethod('stopScan');
}

/// State of the bluetooth adapter.
enum BluetoothState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off
}

class ScanMode {
  const ScanMode(this.value);
  static const lowPower = const ScanMode(0);
  static const balanced = const ScanMode(1);
  static const lowLatency = const ScanMode(2);
  static const opportunistic = const ScanMode(-1);
  final int value;
}

class ScanResult {
  const ScanResult(
      {this.name, this.identifier, this.advertisementData, this.rssi});

  final String name;
  final Guid identifier;
  final protos.AdvertisementData advertisementData;
  final int rssi;
}
