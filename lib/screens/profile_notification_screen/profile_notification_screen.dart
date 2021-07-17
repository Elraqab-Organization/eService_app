import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/material.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
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
                      height: 4,
                    ),
                    ListTile(
                      title: TextComponent(
                        title: "Service Done",
                        fontSize: 14,
                        weight: FontWeight.w700,
                        textColor: Colors.black,
                        align: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomReturnBar()
        ],
      ),
    );
  }
}
