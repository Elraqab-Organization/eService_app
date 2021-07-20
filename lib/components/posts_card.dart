import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_btn.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/post_provider/post_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_moment/simple_moment.dart';

class PostsCard extends StatefulWidget {
  @override
  _PostsCardState createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  //
  LoginViewmodel get _service => dependency();

  var moment = new Moment.now();
  bool isShown = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final posts = watch(postsList);
      return posts.map(
          error: (_) => Text("Error"),
          loading: (_) =>
              Expanded(child: Center(child: CircularProgressIndicator())),
          data: (response) {
            return Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16.0),
                  itemCount: response.value.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        top: 2, bottom: 5, left: 16, right: 25),
                    child: Stack(clipBehavior: Clip.none, children: [
                      InkWell(
                        onTap: () {
                          if (response.value[index].customerId ==
                              _service.user.id) {
                            Navigator.pushNamed(context, "/proposals_view",
                                arguments: response.value[index]);
                          } else {
                            Navigator.pushNamed(context, "/proposal_form",
                                arguments: response.value[index]);
                          }
                        },
                        child: Card(
                          elevation: 12,
                          shadowColor: Colors.black54,
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
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18, bottom: 18, left: 14),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    '${response.value[index].description}',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
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
                                        if (response
                                                .value[index].proposal.length !=
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
                      response.value[index].customerId != _service.user.id
                          ? postOptionServiceProvider(25, 340, "more_vert",
                              _moreOptionsServiceProviderModalSheet)
                          : postOptionCustomer(
                              67, 340, "more_vert", response.value[index].id)
                    ]),
                  ),
                ),
              ),
            );
          });
    });
  }

  _moreOptionsServiceProviderModalSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(24.0),
            height: MediaQuery.of(context).size.height * 0.21,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
              color: Color(0xff212738),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/proposal_form");
                    },
                    child: optionValues("Send Proposal")),
                Divider(
                  color: Colors.white,
                ),
                optionValues("Send regular proposal"),
              ],
            ),
          );
        });
  }

  Center optionValues(String option) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        option,
        style: TextStyle(color: Colors.white, fontFamily: "Segoe UI"),
      ),
    ));
  }

  Widget postOptionCustomer(double top, double left, String icon, final id) {
    return Positioned(
      top: top,
      right: -10,
      child: GestureDetector(
        onTap: () => {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(24.0),
                  height: MediaQuery.of(context).size.height * 0.21,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                    ),
                    color: Color(0xff212738),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        color: Colors.grey[300],
                        offset: Offset(0, 5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () async {
                            final deletedPost = await context
                                .read(postProvider)
                                .deleteAPost(id);
                            if (deletedPost != null) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  "/landing", (Route<dynamic> route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('failed to delete post')));
                            }
                          },
                          child: optionValues("Remove post")),
                      Divider(
                        color: Colors.white,
                      ),
                      optionValues("Edit post"),
                      Divider(color: Colors.white),
                      optionValues("share post on"),
                    ],
                  ),
                );
              })
        },
        child: OptionButton(
          color: Colors.black,
          icon: Icon(
            icon == "share" ? Icons.reply : Icons.more_vert,
            color: Colors.white70,
          ),
          width: 40.0,
          height: 40.0,
        ),
      ),
    );
  }

  Widget postOptionServiceProvider(
      double top, double left, String icon, Function _moreOptionsModalSheet) {
    return Positioned(
      top: top,
      right: -10,
      child: GestureDetector(
        onTap: _moreOptionsModalSheet,
        child: OptionButton(
          color: Colors.black,
          icon: Icon(
            icon == "share" ? Icons.reply : Icons.more_vert,
            color: Colors.white70,
          ),
          width: 40.0,
          height: 40.0,
        ),
      ),
    );
  }

  _stackOfAvatars(proposals) {
    return RowSuper(
      children: [
        for (var i = 0; i < proposals.length; i++)
          CircleAvatar(
              radius: 15.0, backgroundImage: NetworkImage(proposals[i])),
      ],
      innerDistance: -17.0,
    );
  }
}
