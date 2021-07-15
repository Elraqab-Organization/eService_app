import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  Icon icon;
  Color color;
  double width;
  double height;

  OptionButton({this.color, this.icon, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: width,
        width: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(width))),
        child: icon);
  }
}
