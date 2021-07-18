import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileReviews extends StatelessWidget {
  const ProfileReviews();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0.0),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: CircleAvatar(
                              maxRadius: 30.0,
                              child: SvgPicture.asset(
                                  "lib/assets/icon/avatar-svgrepo-com.svg")),
                        ),
                        title: TextComponent(
                          title: "Jalal Ali",
                          fontSize: 14,
                          textColor: Colors.black,
                          weight: FontWeight.w600,
                          align: TextAlign.start,
                        ),
                        subtitle: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(33, 39, 56, 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(4.0),
                          margin: EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.star,
                                size: 16.0,
                                color: Colors.yellow,
                              ),
                              TextComponent(
                                title: "4.5",
                                fontSize: 14.0,
                                textColor: Colors.white,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        trailing: TextComponent(
                          title: "Friday, 15/05/2021, 9 am",
                          fontSize: 14,
                          textColor: Colors.black,
                          weight: FontWeight.w600,
                        ),
                      ),
                      TextComponent(
                        title:
                            "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into",
                        line: 7,
                        fontSize: 14,
                        weight: FontWeight.w500,
                        align: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
