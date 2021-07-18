import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownList extends StatelessWidget {
  const DropDownList({
    Key key,
    @required this.selected,
    @required this.data,
    @required this.onselected,
  }) : super(key: key);

  final dynamic selected;
  final List data;
  final Function onselected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: DropdownButton(
            value: selected,
            items: data.map<DropdownMenuItem<dynamic>>((dynamic value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(
                  value.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) => onselected(value)),
      ),
    );
  }
}
