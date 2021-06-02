import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/model/filter_tags.dart';
import 'package:flutter/material.dart';

class ShowModalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      height: 350.0,
      child: ListView.builder(
          itemCount: filterTags.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => SearchCardResult(
              "Ahmed Mousa", Color.fromRGBO(249, 112, 104, 1))),
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 39, 56, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
    );
  }
}
