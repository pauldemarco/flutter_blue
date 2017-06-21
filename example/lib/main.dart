import 'package:flutter/material.dart';

import 'scan_devices_page.dart';
import 'monitor_state_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ScanDevicesPage(title: 'Flutter Demo Home Page'),
    );
  }
}