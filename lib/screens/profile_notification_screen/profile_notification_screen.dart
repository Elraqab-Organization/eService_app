import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/text_component.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                      ListTileSwitch(
                        value: _switchValues[0],
                        onChanged: (value) {
                          setState(() {
                            _switchValues[0] = value;
                          });
                        },
                        switchActiveColor: Colors.green,
                        title: const Text(
                          'Show notification',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
