import 'package:flutter/material.dart';

class SearchCardResult extends StatelessWidget {
  final String _profileName;
  final Color buttonColor;

  SearchCardResult(this._profileName, this.buttonColor);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?size=626&ext=jpg"),
              ),
              SizedBox(
                width: 25.0,
              ),
              Text(
                _profileName,
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
          Positioned(
              top: -30,
              left: 230,
              child: CircleAvatar(
                backgroundColor: buttonColor,
                radius: 21,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.bookmark,
                    size: 20,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              )),
          Positioned(
              top: -30,
              left: 280,
              child: CircleAvatar(
                backgroundColor: buttonColor,
                radius: 21,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.favorite,
                    size: 20,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              )),
        ],
      ),
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            spreadRadius: 1,
            blurRadius: 5),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
    );
  }
}
