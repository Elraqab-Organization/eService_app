import 'package:e_service_app/providers/service_providers/search_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final viewmodel = watch(searchProvider);
      return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        left: MediaQuery.of(context).size.width * 0.10,
        top: viewmodel.isOpen ? 90 : 130,
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width * 0.80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.grey[300],
                offset: Offset(0, 3),
                blurRadius: 2,
              ),
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
    });
  }
}
