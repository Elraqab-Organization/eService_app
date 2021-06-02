import 'package:flutter/material.dart';

class SearchCardResult extends StatelessWidget {
  final String _profileName;

  SearchCardResult(this._profileName);
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
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?size=626&ext=jpg"),
              ),
            ),
            Positioned(
                top: 25,
                left: 90,
                right: 50,
                child: Text(
                  _profileName,
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
                )),
          ],
        ),
        margin: const EdgeInsets.only(left: 25, right: 18, top: 30),
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
      ),
    );
  }
}
