import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileReviews extends StatelessWidget {
  const ProfileReviews();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      color: Color.fromRGBO(237, 242, 239, 1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(
                title: "Reviews",
                fontSize: 16,
                line: 1,
                textColor: Colors.black,
                weight: FontWeight.w600,
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, "/service_provider_reviews"),
                child: TextComponent(
                  title: "See all",
                  fontSize: 16,
                  line: 1,
                  textColor: Colors.black,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
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
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.yellow,
                                  size: 14.0,
                                ),
                              ),
                          ],
                        ),
                        trailing: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: TextComponent(
                            title: "Friday, 15/05/2021, 9 am",
                            fontSize: 14,
                            textColor: Colors.black,
                            weight: FontWeight.w600,
                          ),
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
