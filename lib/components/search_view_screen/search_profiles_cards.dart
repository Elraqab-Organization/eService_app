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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 5),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(_photoString),
            ),
          ),
          Positioned(
              top: 25,
              left: 90,
              right: 50,
              child: Text(
                _username,
                style: TextStyle(fontSize: 17.0),
              )),
          Positioned(
              top: -18,
              left: 220,
              child: CircleAvatar(
                backgroundColor: Color(0xffF97068),
                radius: 21,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.chat),
                  color: Colors.white,
                  onPressed: () {},
                ),
              )),
          Positioned(
              top: -18,
              left: 270,
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
            top: -18,
            left: 320,
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
