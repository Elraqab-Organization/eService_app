import 'package:e_service_app/providers/proposal%20provider/proposal_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_moment/simple_moment.dart';

class ProposalCard extends StatefulWidget {
  @override
  _ProposalCardState createState() => _ProposalCardState();
}

class _ProposalCardState extends State<ProposalCard> {
  var moment = new Moment.now();
  String status = "Pending";
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final proposals = watch(proposalList);
      return proposals.map(
          error: (_) => Text("Error"),
          loading: (_) => Center(child: CircularProgressIndicator()),
          data: (response) {
            return Container(
                height: MediaQuery.of(context).size.height - 480,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: response.value.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  response.value[index].serviceProvider.imgSrc),
                            ),
                            title: Text(
                              "${response.value[index].serviceProvider.firstName + " " + response.value[index].serviceProvider.lastName}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${moment.from(response.value[index].timestamp)} / ${response.value[index].post.location} / ${response.value[index].diagnosisFee} RM"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                response.value[index].description,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (response.value[index].status == "Pending")
                                postBtn()
                              else if (response.value[index].status ==
                                  "Accepted")
                                acceptedBtn()
                              else if (response.value[index].status ==
                                  "rejected")
                                rejectedBtn()
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      );
                    }));
          });
    });
  }

  Widget postBtn() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              width: 80,
              height: 32,
              child: Center(
                  child: Text(
                "Accept",
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                color: Color(0xff57C4E5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              width: 80,
              height: 32,
              child: Center(
                  child: Text(
                "Reject",
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                color: Color(0xff57C4E5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget rejectBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 80,
          height: 32,
          child: Center(
              child: Text(
            "Reject",
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: Color(0xff57C4E5),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Widget acceptedBtn() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/landing');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 100,
          height: 39,
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
    );
  }

  Widget rejectedBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 100,
          height: 39,
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
      ),
    );
  }
}
