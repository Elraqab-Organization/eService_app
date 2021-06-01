import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceBranches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 120.0,
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.only(
                      left: 24.0, top: 24.0, right: 40.0, bottom: 24.0),
                  color: Color.fromRGBO(237, 242, 239, 1),
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: 20,
                    itemBuilder: (context, index) => InkWell(
                      onTap: null,
                      child: Container(
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(24.0),
                        margin: EdgeInsets.all(8.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            TextComponent(
                              title: 'Construction tools',
                              fontSize: 14,
                              textColor: Colors.black,
                              weight: FontWeight.w600,
                            ),
                            Positioned(
                              right: -40,
                              bottom: -15,
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                margin: EdgeInsets.all(0.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 39, 56, 1),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomReturnBar(),
        ],
      ),
    );
  }
}
