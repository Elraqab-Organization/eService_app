import 'package:flutter/material.dart';
import 'package:e_service_app/components/text_component.dart';

class ChatTile extends StatefulWidget {
  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 82.0,
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
                      leading: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.black,
                      ),
                      title: TextComponent(
                        title: "John Williams",
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
    );
  }
}
