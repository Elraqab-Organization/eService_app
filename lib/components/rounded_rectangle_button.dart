import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  var padding;
  var borderRadius;
  Color buttonColor;
  var textColor;
  var text;
  RoundedRectangleButton(this.padding, this.borderRadius, this.buttonColor,
      this.textColor, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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
          onPressed: () {},
          color: buttonColor,
          child: text,
          textColor: textColor,
        ),
      ),
    );
  }
}
