import 'package:flutter/material.dart';

class SearchCardResult extends StatelessWidget {
  //
  final data;

  SearchCardResult(this.data);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
      margin: const EdgeInsets.only(bottom: 28),
      padding: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(data.imgSrc),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data.firstName + ' ' + data.lastName,
                  style: TextStyle(fontSize: 17.0),
                ),
              ]),
          Positioned(
            top: -30,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Color(0xffF97068),
              radius: 21,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.bookmark,
                  size: 20.0,
                ),
                color: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/request_form',
                    arguments: data),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: 50,
            child: CircleAvatar(
              backgroundColor: Color(0xffF97068),
              radius: 21,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.favorite,
                  size: 20.0,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            color: Colors.grey[300],
            offset: Offset(0, 5),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
    ));
  }
}
