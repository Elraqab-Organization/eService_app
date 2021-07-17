import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.78,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 62.0,
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          ListTile(
                            title: TextComponent(
                              title: "Service Done",
                              fontSize: 14,
                              weight: FontWeight.w700,
                              textColor: Colors.black,
                              align: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomReturnBar(),
          ],
        ),
      ),
    );
  }
}
