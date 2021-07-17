import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String error;
  final Function onChanged;
  final int lines;
  final bool validate;
  CustomerTextField({
    this.onChanged,
    this.controller,
    this.lines = 1,
    this.labelText,
    this.validate,
    this.error = "can't be invalid!",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      maxLines: lines,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorText: validate ? error : null,
        errorStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 1),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
        ),
        disabledBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
        ),
        enabledBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
        ),
        border: new UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
