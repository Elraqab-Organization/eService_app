import 'package:e_service_app/components/custom_btn.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/posts_card.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool f;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomReturnBar(),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "latest News",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                OptionButton(
                  color: Colors.black,
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  width: 50.0,
                  height: 50.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PostsCard()
        ],
      ),
      floatingActionButton: GestureDetector(
        child: OptionButton(
          color: Colors.deepOrangeAccent,
          icon: Icon(Icons.add, color: Colors.white),
          width: 55.0,
          height: 55.0,
        ),
        onTap: () {
          Navigator.pushNamed(context, "/post_form");
        },
      ),
    ));
  }
}
