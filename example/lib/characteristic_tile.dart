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
  String id;
  String title;
  Uint8List value = new Uint8List(1);
  bool isUpdating = false;
  StreamSubscription valueStream;

  @override
  void initState() {
    id = widget.characteristic.id.toString();
    title = widget.characteristic.name;
    widget.characteristic.getDescriptors().then((d) => print('Descriptor List! $d'));
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

  _write() async{
    Uint8List data = new Uint8List(4);
    data[0] = 0x01;
    data[1] = 0x02;
    data[2] = 0x03;
    data[3] = 0x04;
    await widget.characteristic.write(data);
    setState(() {
      this.value = data;
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

  _buildIconsList() {
    var items = <Widget>[];
    if(widget.characteristic.canRead) {
      items.add(new IconButton(
        icon: new Icon(Icons.file_download),
        onPressed: _read,
      ));
    }
    if(widget.characteristic.canWrite) {
      items.add(new IconButton(
        icon: new Icon(Icons.file_upload),
        onPressed: _write,
      ));
    }
    if(widget.characteristic.canNotify || widget.characteristic.canIndicate) {
      items.add(_buildNotifyIcon());
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      dense: true,
      title: new Text(title),
      subtitle: new Column(
      children: <Widget>[
        new Text(id),
        new Text(value.toString())
        ],
      ),
      onTap: _startUpdates,
      trailing: new Row(
        children: _buildIconsList()
      ),
    );
  }
}