import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_blue/abstractions/advertisement_record.dart';
import 'package:flutter_blue/abstractions/device_state.dart';
import 'package:flutter_blue/concrete/device.dart';
import 'package:guid/guid.dart';

/// Put's the EventChannel behind a data conversion layer
/// EventChannel int's are converted to Device objects
class ScanResultsEventChannel {

  static EventChannel _channel = const EventChannel('flutterblue.pauldemarco.com/scanResults'/*, const MyStandardMethodCodec()*/);

  static Stream<Device> scanResults() {
    return _channel.receiveBroadcastStream()
        .map((i) => new Device.fromMap(i));
  }
}