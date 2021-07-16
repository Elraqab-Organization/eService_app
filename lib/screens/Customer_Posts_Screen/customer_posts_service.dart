import 'package:flutter/material.dart';
import '../../components/posts_card.dart';

class CustomerPostsServiceScreen extends StatefulWidget {
  @override
  _CustomerPostsServiceScreenState createState() =>
      _CustomerPostsServiceScreenState();
}

class _CustomerPostsServiceScreenState
    extends State<CustomerPostsServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last news",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/posts");
                  },
                  child: Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(child: PostsCard()),
        ],
      ),
    );
  }
}
