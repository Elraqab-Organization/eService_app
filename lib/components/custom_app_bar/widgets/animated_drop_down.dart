import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search_viewmodel.dart';

class DropDownList extends StatelessWidget {
  final SearchViewmodel viewmodel;
  const DropDownList({@required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: viewmodel.filterTags[viewmodel.tagCurrentIndex].selected,
          items: viewmodel.filterTags[viewmodel.tagCurrentIndex].values
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
                viewmodel.filterTags[viewmodel.tagCurrentIndex].selected = value
              }),
    );
  }
}

class AnimatedDropDown extends StatelessWidget {
  final SearchViewmodel viewmodel;
  const AnimatedDropDown({this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      clipBehavior: Clip.hardEdge,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutSine,
      height: viewmodel.shown ? 350 : 0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 112, 104, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              viewmodel.tagCurrentIndex != null
                  ? viewmodel.filterTags[viewmodel.tagCurrentIndex].icon
                  : SizedBox(),
              Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: viewmodel.tagCurrentIndex != null
                    ? DropDownList(viewmodel: viewmodel)
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
