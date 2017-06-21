import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_blue/concrete/device.dart';

class NativeStreams {

  static final _channel = const EventChannel('flutterblue.pauldemarco.com/streams');

  static Stream<StreamEvent> _getStream(StreamEventType type) {
    return _channel.receiveBroadcastStream()
        .map((d) => d as StreamEvent)
        .where((s) => s.type == type);
  }

  static Stream<Device> scanResults() {
    return _getStream(StreamEventType.scanResult)
        .map((i) => new Device.fromMap(i));
  }

}

class StreamEvent {
  final StreamEventType type;
  final dynamic payload;

  StreamEvent(this.type, this.payload);

}

enum StreamEventType {
  scanResult,
  serviceDiscovered
}