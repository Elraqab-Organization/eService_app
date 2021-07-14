// import 'package:e_service_app/model/post.dart';
import 'package:e_service_app/providers/post_provider/post_action.dart';
// import 'package:e_service_app/screens/Customer_Posts_Screen/customer_posts_viewmodel.dart';
// import 'package:e_service_app/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

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
  var moment = new Moment.now();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final posts = watch(postsList);
      return posts.map(
          error: (_) => Text("Error"),
          loading: (_) => Center(child: CircularProgressIndicator()),
          data: (response) {
            // print(response.value[0].imgSrc);
            return Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16.0),
                  itemCount: response.value.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              response.value[index].imgSrc.toString(),
                            ),
                          ),
                          title: Text(response.value[index].username),
                          subtitle: Text(
                            moment.from(response.value[index].timestamp) +
                                ' / ${response.value[index].location} / cancelation fee: ${response.value[index].cancelationFee}',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18, bottom: 18, left: 14),
                          child: Text(
                            '${response.value[index].description}',
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
                              child: Row(
                                children: [
                                  if (response.value[index].proposal.length !=
                                      0)
                                    _stackOfAvatars(
                                        response.value[index].proposal),
                                  Text(
                                    '   ${response.value[index].proposal.length} proposals',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }

  _stackOfAvatars(proposals) {
    return RowSuper(
      children: [
        for (var i = 0; i < proposals.length; i++)
          CircleAvatar(
              radius: 15.0, backgroundImage: NetworkImage(proposals[i])),
      ],
      innerDistance: -14.0,
    );
  }
}
