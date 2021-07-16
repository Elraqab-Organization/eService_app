import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String error;
  final Function onChanged;
  final bool validate;
  CustomerTextField(
      {this.onChanged,
      this.controller,
      this.labelText,
      this.validate,
      this.error = "can't be invalid!"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffF97068),
          border: Border(bottom: BorderSide(width: 2.0, color: Colors.white))),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            errorText: validate ? error : null,
            errorStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.symmetric(horizontal: 1),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}
