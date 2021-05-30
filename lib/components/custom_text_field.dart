import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  CustomerTextField(this.controller, this.labelText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          border: Border(bottom: BorderSide(width: 2.0, color: Colors.white))),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
    ;
  }
}
