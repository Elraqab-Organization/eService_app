import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/profile_notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class ProfileNotification extends StatefulWidget {
  @override
  _ProfileNotificationState createState() => _ProfileNotificationState();
}

class _ProfileNotificationState extends State<ProfileNotification> {
  List<bool> _switchValues = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.06),
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 39, 56, 1),
              ),
              child: ListView(
                children: [
                  SizedBox(height: height * 0.08),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileNotificationTile(
                          onChanged: (value) {
                            setState(() {
                              _switchValues[0] = value;
                            });
                          },
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                          title: 'Show Notification',
                          switchValues: _switchValues,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileNotificationTile(
                          onChanged: (value) {
                            setState(() {
                              _switchValues[0] = value;
                            });
                          },
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
                          title: 'Allow notification dot',
                          switchValues: _switchValues,
                        ),
                      )
                    ],
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            color: Colors.white,
                            height: 36,
                            thickness: 1.5,
                          )),
                    ),
                  ]),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileNotificationTile(
                          onChanged: (value) {
                            setState(() {
                              _switchValues[0] = value;
                            });
                          },
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
                          title: 'Executive program',
                          switchValues: _switchValues,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileNotificationTile(
                          onChanged: (value) {
                            setState(() {
                              _switchValues[0] = value;
                            });
                          },
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
                          title: 'Discount & deals',
                          switchValues: _switchValues,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            CustomReturnBar()
          ],
        ),
      ),
    );
  }
}
