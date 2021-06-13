import 'package:flutter/material.dart';

class SearchCardResult extends StatelessWidget {
  //
  final String _username;
  final String _photoString;

  SearchCardResult(this._username, this._photoString);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
      margin: const EdgeInsets.only(bottom: 28),
      padding: const EdgeInsets.all(8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(_photoString),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  _username,
                  style: TextStyle(fontSize: 17.0),
                ),
              ]),
          Positioned(
              top: -25,
              left: 250,
              child: CircleAvatar(
                backgroundColor: Color(0xffF97068),
                radius: 21,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.bookmark),
                  color: Colors.white,
                  onPressed: () {},
                ),
              )),
          Positioned(
            top: -25,
            left: 300,
            child: CircleAvatar(
              backgroundColor: Color(0xffF97068),
              radius: 21,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.favorite),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            spreadRadius: 0.5,
            blurRadius: 5),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
    ));
  }
}
