import 'package:e_service_app/components/search_view_screen/search_profiles_cards.dart';
import 'package:e_service_app/model/search_profile.dart';
import 'package:flutter/material.dart';

class ShowModalBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      height: 350.0,
      child: usernames.isEmpty
          ? _noResultFound()
          : ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: usernames.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SearchCardResult(
                    usernames[index],
                  )),
      decoration: BoxDecoration(
          color: Color(0xff212738),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              color: Colors.grey[300],
              offset: Offset(0, 5),
              blurRadius: 4,
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
          size: 14.0,
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
