import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInformation extends StatelessWidget {
  final User data;
  const ProfileInformation({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 39, 56, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(image: NetworkImage(data.imgSrc))),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: null,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 112, 104, 1),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  InkWell(
                    onTap: null,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 112, 104, 1),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        FontAwesomeIcons.server,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextComponent(
            title: data.firstName + ' ' + data.lastName,
            fontSize: 16,
            textColor: Colors.white,
            weight: FontWeight.w800,
            align: TextAlign.start,
          ),
          SizedBox(
            height: 10.0,
          ),
          buildRow(FontAwesomeIcons.solidStar, "4.5 / 549 reviews"),
          SizedBox(height: 5.0),
          buildRow(FontAwesomeIcons.moneyBill, "${data.diagnosingFees}\$"),
          SizedBox(height: 5.0),
          buildRow(FontAwesomeIcons.locationArrow, data.city),
          SizedBox(height: 5.0),
          buildRow(FontAwesomeIcons.moneyBillAlt, "Cash"),
          SizedBox(height: 20.0),
          Divider(
            color: Colors.white,
            thickness: 1,
          ),
          SizedBox(height: 10.0),
          TextComponent(
            title: "Information",
            fontSize: 16,
            textColor: Colors.white,
            weight: FontWeight.w800,
            align: TextAlign.start,
          ),
          SizedBox(height: 10.0),
          TextComponent(
            title:
                "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into",
            line: 4,
            fontSize: 12,
            textColor: Colors.white,
            weight: FontWeight.w600,
            align: TextAlign.start,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Row buildRow(IconData icon, String data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 14,
        ),
        SizedBox(
          width: 15.0,
        ),
        TextComponent(
          title: data,
          fontSize: 14,
          textColor: Colors.white,
          weight: FontWeight.w700,
          align: TextAlign.start,
        ),
      ],
    );
  }
}
