import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';

class CharacteristicTile extends StatefulWidget {

  final ICharacteristic characteristic;

  CharacteristicTile({this.characteristic});

  @override
  State<StatefulWidget> createState() => new _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  String title;
  Uint8List value = new Uint8List(1);
  bool isUpdating = false;
  bool canRead
  StreamSubscription valueStream;

  @override
  void initState() {
    title = widget.characteristic.name;
    valueStream = widget.characteristic.valueUpdated()
        .listen((d) {
          setState(() {
            value = d;
          });
        });
    isUpdating = widget.characteristic.isUpdating;
  }


  @override
  void dispose() {
    valueStream?.cancel();
    valueStream = null;
  }

  _read() async{
    Uint8List value = await widget.characteristic.read();
    setState(() {
      this.value = value;
    });
  }

  _startUpdates() async {
    await widget.characteristic.startUpdates();
    setState(() {
      isUpdating = widget.characteristic.isUpdating;
    });
  }

  _stopUpdates() async {
    await widget.characteristic.stopUpdates();
    setState(() {
      isUpdating = widget.characteristic.isUpdating;
    });
  }

  _buildNotifyIcon() {
    if(isUpdating) {
      return new IconButton(
        icon: const Icon(Icons.sync_disabled),
        onPressed: _stopUpdates,
      );
    } else {
      return new IconButton(
        icon: const Icon(Icons.sync),
        onPressed: _startUpdates,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(title),
        subtitle: new Text(value.toString()),
        onTap: _startUpdates,
        trailing: new Row(
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.file_download),
              onPressed: _read,
            ),
            _buildNotifyIcon(),
          ],
        ),
    );
  }
}