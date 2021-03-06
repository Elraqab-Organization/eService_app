import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/proposal%20provider/proposal_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_moment/simple_moment.dart';

class ProposalsHistory extends StatefulWidget {
  @override
  _ProposalsHistoryState createState() => _ProposalsHistoryState();
}

class _ProposalsHistoryState extends State<ProposalsHistory> {
  var moment = new Moment.now();

  LoginViewmodel get _service => dependency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomReturnBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Consumer(builder: (context, watch, child) {
                final proposals = watch(proposalsCustomerList(_service.user.id));
                return proposals.map(
                    loading: (_) => Center(child: CircularProgressIndicator()),
                    error: (_) => Text(_.error.toString()),
                    data: (response) {
                      if (response.value != null)
                        return ListView.builder(
                            itemCount: response.value.length,
                            itemBuilder: (context, index) {
                              if (response.value[index].status != "Pending") {
                                return Container(
                                  height: 190,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              response.value[index]
                                                  .serviceProvider.imgSrc,
                                            ),
                                          ),
                                          title: Text(
                                              '${response.value[index].serviceProvider.firstName} ${response.value[index].serviceProvider.lastName}'),
                                          subtitle: Text(
                                            '${moment.from(response.value[index].timestamp)}' +
                                                ' / ${response.value[index].post.location} /' +
                                                '${response.value[index].diagnosisFee} RM',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18, bottom: 18, left: 14),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 20),
                                            child: Text(
                                              '${response.value[index].description}',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6)),
                                            ),
                                          ),
                                        ),
                                        if (response.value[index].status ==
                                            "Accepted")
                                          acceptedBtn()
                                        else if (response.value[index].status ==
                                            "rejected")
                                          rejectedBtn()
                                        else if (response.value[index].status ==
                                            "canceled")
                                          canceledBtn()
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Text("");
                            });
                      return Center(
                        child: Text("Nothing in History"),
                      );
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget acceptedBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(""),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/landing'),
              child: Container(
                width: 100,
                height: 37,
                child: Center(
                    child: Text(
                  "check orders",
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                  color: Color(0xffF97068),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rejectedBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(""),
          Container(
            width: 100,
            height: 37,
            child: Center(
                child: Text(
              "rejected",
              style: TextStyle(color: Colors.white),
            )),
            decoration: BoxDecoration(
              color: Color(0xffF97068),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ],
      ),
    );
  }

  Widget canceledBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 100,
            height: 39,
            child: Center(
                child: Text(
              "canceled",
              style: TextStyle(color: Colors.white),
            )),
            decoration: BoxDecoration(
              color: Color(0xffF97068),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ],
    );
  }
}
