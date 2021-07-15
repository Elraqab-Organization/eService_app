import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  final String title;
  final IconData favorite;
  final String rating;
  final IconData star;
  final Function onpresed;

  CategoryCard(
      {this.title, this.favorite, this.rating, this.star, this.onpresed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        height: 150,
        width: 150,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              favorite,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 80, 0),
              width: 50,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text(
                    rating,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
