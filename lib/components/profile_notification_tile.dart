import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

// ignore: must_be_immutable
class ProfileNotificationTile extends StatelessWidget {
  List<bool> switchValues = List.generate(7, (_) => false);
  final String title;
  final Function onChanged;
  final EdgeInsets padding;

  ProfileNotificationTile(
      {this.title, this.switchValues, this.onChanged, this.padding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: Container(
          height: 62.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTileSwitch(
                value: switchValues[0],
                onChanged: onChanged,
                switchActiveColor: Colors.green,
                title: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
