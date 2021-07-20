import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String error;
  final Function onChanged;
  final int lines;
  final bool validate;
  final Color color;
  final Color borderColor;
  CustomerTextField({
    this.onChanged,
    this.controller,
    this.lines = 1,
    this.labelText,
    this.validate,
    this.borderColor = Colors.white,
    this.color = Colors.white,
    this.error = "can't be invalid!",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      maxLines: lines,
      style: TextStyle(color: color),
      decoration: InputDecoration(
        errorText: validate ? error : null,
        errorStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 1),
        labelText: labelText,
        labelStyle: TextStyle(color: color),
        focusedBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: borderColor),
        ),
        disabledBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: borderColor),
        ),
        enabledBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: borderColor),
        ),
        border: new UnderlineInputBorder(
          borderSide: new BorderSide(color: borderColor),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
