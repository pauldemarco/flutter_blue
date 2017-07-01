import 'package:flutter/material.dart';
import 'package:flutter_blue/concrete/device.dart';

import 'animated_rssi.dart';

class DeviceTile extends StatelessWidget {
  final Device device;
  final deviceTapped;

  const DeviceTile(this.device, this.deviceTapped);

  void _handleTap() {
    deviceTapped(device);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new AnimatedRssi(device.rssi),
      title: new Text(device.name),
      subtitle: new Text(device.id.toMac()),
      onTap: _handleTap,
    );;
  }
}