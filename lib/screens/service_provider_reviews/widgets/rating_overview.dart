import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingOverview extends StatelessWidget {
  const RatingOverview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
          color: Color.fromRGBO(33, 39, 56, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          TextComponent(
            title: "Overview",
            fontSize: 16,
            textColor: Colors.white,
            weight: FontWeight.w600,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                title: "4.5",
                fontSize: 16,
                textColor: Colors.white,
                weight: FontWeight.w600,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.yellow,
                            size: 20.0,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextComponent(
                    title: "5421 reviews",
                    fontSize: 12.0,
                    textColor: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRow("5", 10),
              SizedBox(height: 5.0),
              buildRow("4", 25),
              SizedBox(height: 5.0),
              buildRow("3", 5),
              SizedBox(height: 5.0),
              buildRow("2", 40),
              SizedBox(height: 5.0),
              buildRow("1", 20),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Row buildRow(
    String row,
    int percentage,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextComponent(
          title: row,
          fontSize: 14,
          weight: FontWeight.w600,
          textColor: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 12,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: percentage.toInt(),
                child: Container(
                  height: 1,
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                flex: 100 - percentage.toInt(),
                child: Container(
                  height: 1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        TextComponent(
          title: "$percentage%",
          fontSize: 14,
          weight: FontWeight.w600,
          textColor: Colors.white,
        ),
      ],
    );
  }
}