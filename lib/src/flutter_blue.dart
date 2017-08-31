part of flutter_blue;

class FlutterBlue {
  final MethodChannel _channel = const MethodChannel('$NAMESPACE/methods');
  final EventChannel _stateChannel = const EventChannel('$NAMESPACE/state');
  final EventChannel _scanResultChannel = const EventChannel('$NAMESPACE/scanResult');
  final EventChannel _servicesDiscoveredChannel = const EventChannel('$NAMESPACE/servicesDiscovered');
  final EventChannel _characteristicReadChannel = const EventChannel('$NAMESPACE/characteristicRead');

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
        .invokeMethod('state')
        .then((List<int> data) => new protos.BluetoothState.fromBuffer(data))
        .then((s) => BluetoothState.values[s.state.value]);
  }

  /// Occurs when the bluetooth state has changed
  Stream<BluetoothState> onStateChanged() {
    return _stateChannel
        .receiveBroadcastStream()
        .map((List<int> data) => new protos.BluetoothState.fromBuffer(data))
        .map((s) => BluetoothState.values[s.state.value]);
  }

  /// Starts a scan for Bluetooth Low Energy devices
  Stream<ScanResult> startScan({
    ScanMode scanMode = ScanMode.lowLatency,
    List<Guid> withServices = const [],
    List<Guid> withDevices = const [],
  }) async* {
    var settings = protos.ScanSettings.create()
      ..androidScanMode = scanMode.value
      ..serviceUuids.addAll(withServices.map((g) => g.toString()).toList());

    await _channel.invokeMethod('startScan', settings.writeToBuffer());

    yield* _scanResultChannel
        .receiveBroadcastStream()
        .map((List<int> data) => new protos.ScanResult.fromBuffer(data))
        .map((p) => new ScanResult.fromProto(p));
  }

  /// Stops a scan for Bluetooth Low Energy devices
  Future<Null> stopScan() => _channel.invokeMethod('stopScan');

  /// Establishes a connection to the Bluetooth Device.
  /// Upon a successful connection, this method will return a [BluetoothDevice].
  /// When [autoConnect] is true, the connection attempt will not time out.
  /// To explicitly cancel a connection, call the cancelConnection() method.
  /// NOTE: iOS will never time out the connection, Android may return GATT error 133 (or others).
  Future<BluetoothDevice> connect(DeviceIdentifier deviceId, {bool autoConnect = true}) {
    var options = protos.ConnectOptions.create()
      ..remoteId = deviceId.toString()
      ..androidAutoConnect = autoConnect;
    return _channel
        .invokeMethod('connect', options.writeToBuffer())
        .then((List<int> data) => new protos.BluetoothDevice.fromBuffer(data))
        .then((d) => new BluetoothDevice.fromProto(d));
  }

  /// Cancels connection to the Bluetooth Device
  Future<Null> cancelConnection(DeviceIdentifier device) {
    return _channel.invokeMethod('disconnect', device.toString());
  }
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

class DeviceIdentifier {
  final String id;
  const DeviceIdentifier(this.id);

  @override
  String toString() => id;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) => other is DeviceIdentifier && compareAsciiLowerCase(id, other.id) == 0;
}

class ScanResult {
  const ScanResult(
      {this.name, this.identifier, this.advertisementData, this.rssi});

  ScanResult.fromProto(protos.ScanResult p)
      : name = p.name,
        identifier = new DeviceIdentifier(p.remoteId),
        rssi = p.rssi,
        advertisementData = new AdvertisementData.fromProto(p.advertisementData);

  final String name;
  final DeviceIdentifier identifier;
  final AdvertisementData advertisementData;
  final int rssi;
}

class AdvertisementData {
  final String localName;
  final List<int> manufacturerData;
  final Map<String, List<int>> serviceData;
  final int txPowerLevel;
  final bool connectable;

  AdvertisementData(
      {this.localName,
      this.manufacturerData,
      this.serviceData,
      this.txPowerLevel,
      this.connectable});

  AdvertisementData.fromProto(protos.AdvertisementData p)
      : localName = p.localName,
        manufacturerData = p.manufacturerData,
        serviceData = new Map.fromIterable(p.serviceData,
            key: (v) => v.key, value: (v) => v.value),
        txPowerLevel = p.txPowerLevel,
        connectable = p.connectable;
}
