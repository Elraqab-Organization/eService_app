import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/model/filter_tags.dart';
import 'package:e_service_app/model/search_profile.dart';
import 'package:flutter/material.dart';

class ShowModalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: usernames.isEmpty
          ? ListView.builder(
              itemCount: filterTags.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SearchCardResult("Ahmed Mousa"))
          : _noResultFound(),
      decoration: BoxDecoration(
          color: Color(0xff212738),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    );
  }

  Widget _noResultFound() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.notification_important_outlined,
          size: 60,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "No Results Found",
          style: TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    ));
  }
}
