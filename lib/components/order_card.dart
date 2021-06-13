import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Ordercard extends StatefulWidget {
  @override
  _OrdercardState createState() => _OrdercardState();
}

class _OrdercardState extends State<Ordercard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Header",
              style: TextStyle(
                fontFamily: 'BalooBhai',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              "Sub",
              style: TextStyle(
                  fontFamily: 'BalooBhai', fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Text("Content goes over here !",
              style: TextStyle(
                  fontFamily: 'BalooBhai', fontSize: 20, color: Colors.white)),
        )
      ],
    );
  }
}
