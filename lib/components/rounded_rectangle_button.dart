import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  // final padding;
  final borderRadius;
  final Color buttonColor;
  final Color textColor;
  final text;
  final Function onClick;
  RoundedRectangleButton(this.borderRadius, this.buttonColor, this.textColor,
      this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      // padding: padding,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          elevation: 18.0,
          minWidth: double.maxFinite,
          height: 60,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onPressed: onClick as void Function()?,
          color: buttonColor,
          child: text,
          textColor: textColor,
        ),
      ),
    );
  }
}
