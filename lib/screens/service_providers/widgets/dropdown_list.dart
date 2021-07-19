import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  final dynamic viewmodel;
  DropDownDemo(this.viewmodel);
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          border: Border.all()),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: widget.viewmodel.category[widget.viewmodel.index]['selected'],
            items: widget.viewmodel.category[widget.viewmodel.index]['items']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) => {
                  setState(() {
                    widget.viewmodel.category[widget.viewmodel.index]['selected'] = value;
                  })
                }),
      ),
    );
  }
}
