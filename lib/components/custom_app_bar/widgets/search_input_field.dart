import 'package:e_service_app/providers/service_providers/search_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final SearchViewmodel viewmodel;
  SearchInputField({this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: MediaQuery.of(context).size.width * 0.10,
      top: viewmodel.isOpen ? 90 : 120,
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 3.0,
                offset: Offset.fromDirection(1, 1),
                spreadRadius: 1.0),
          ],
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          onTap: () => {
            // viewmodel.state = true,
          },
          cursorHeight: 25,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none),
            hintText: 'search your service',
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
