import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/providers/post_provider/post_action.dart';
// import 'package:e_service_app/screens/Customer_Posts_Screen/customer_posts_viewmodel.dart';
// import 'package:e_service_app/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsCard extends StatefulWidget {
  @override
  _PostsCardState createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  final String userName = 'Ahmed Mousa';
  final String posted = '27 min ago';
  final String city = ' Johor Bahru';
  final String cancellation = ' Free cancellation';
  final String postBody =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s';

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final posts = watch(postsList);
      return posts.map(
          error: (_) => Text("Error"),
          loading: (_) => Center(child: CircularProgressIndicator()),
          data: (value) => Container(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16.0),
                  itemCount: value.value.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: new AssetImage(
                              "lib/assets/icon/1-intro-photo-final-image.jpg",
                            ),
                          ),
                          title: Text(userName),
                          subtitle: Text(
                            '$posted / $city / $cancellation',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '$postBody',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                // Perform some action
                              },
                              child: Text(
                                '9 Proposals',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    });
  }
}
