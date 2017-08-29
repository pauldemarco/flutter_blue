import 'package:flutter/material.dart';
import 'package:flutter_blue/abstractions/contracts/i_characteristic.dart';
import 'package:flutter_blue/abstractions/contracts/i_service.dart';
import 'package:flutter_blue_example/characteristic_tile.dart';

class ServiceTile extends StatelessWidget {

  final IService service;

  ServiceTile({this.service});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var children = <Widget>[];
    if(service.characteristics.length > 0) {
      for(ICharacteristic c in service.characteristics){
        children.add(new CharacteristicTile(characteristic: c,));
      }
    } else {
      children.add(const Text('The service is empty.'));
    }
    return new ExpansionTile(
      title: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(service.name, style: theme.textTheme.subhead),
          new Text('UUID: 0x${service.id.toString().substring(4, 8)}', style: theme.textTheme.caption),
          new Text((service.isPrimary) ? 'PRIMARY SERVICE' : 'SECONDARY SERVICE', style: theme.textTheme.caption,),
        ],
      ),
      backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
      children: children,
    );
  }
}