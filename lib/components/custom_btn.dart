import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  Icon icon;
  Color color;

  OptionButton({this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: icon);
  }
}
