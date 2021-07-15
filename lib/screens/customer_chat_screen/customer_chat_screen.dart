import 'package:flutter/material.dart';
import 'package:e_service_app/components/chatTile.dart';

class CustomerChatScreen extends StatefulWidget {
  @override
  _CustomerChatScreenState createState() => _CustomerChatScreenState();
}

class _CustomerChatScreenState extends State<CustomerChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ChatTile(),
      ],
    ));
  }
}
