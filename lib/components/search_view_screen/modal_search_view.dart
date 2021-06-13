import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/model/search_profile.dart';
import 'package:flutter/material.dart';

class ShowModalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      height: 350.0,
<<<<<<< HEAD
      child: usernames.isEmpty
          ? _noResultFound()
          : ListView.builder(
              itemCount: usernames.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SearchCardResult(
                  usernames[index].username, usernames[index].photoString)),
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
=======
      child: ListView.builder(
          padding: EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
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
>>>>>>> master
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
