import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownModal extends StatefulWidget {
  final isShown;
  final viewmodel;
  const DropDownModal({this.isShown, this.viewmodel});

  @override
  _DropDownModalState createState() => _DropDownModalState();
}

class _DropDownModalState extends State<DropDownModal> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.hardEdge,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeOutSine,
      height: widget.isShown ? 360 : 0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 112, 104, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.local_activity,
                color: Colors.white,
                size: 14.0,
              ),
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  // border: Border.all(),
                ),
                // child: DropdownButtonHideUnderline(
                // child: DropdownButton(
                // value: widget
                //     .viewmodel.filterTags[widget.viewmodel.index].selected,
                // items: widget
                // .viewmodel.filterTags[widget.viewmodel.index].values
                // .map<DropdownMenuItem<String>>((String value) {
                //   return DropdownMenuItem<String>(
                //     value: value,
                //     child: Text(
                //       value,
                //       style: TextStyle(color: Colors.black),
                //     ),
                //   );
                // }).toList(),
                // onChanged: (value) => {
                // setState(() {
                // widget.viewmodel.filterTags[widget.viewmodel.index]
                // .selected = value;
                // })
                // }),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
