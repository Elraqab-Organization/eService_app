import 'package:e_service_app/components/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:e_service_app/components/custom_return_bar.dart';

class CustomerNotificationScreen extends StatefulWidget {
  @override
  _CustomerNotificationScreenState createState() =>
      _CustomerNotificationScreenState();
}

class _CustomerNotificationScreenState
    extends State<CustomerNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomReturnBar(),
        NotificationTile(),
      ],
    ));
  }
}
