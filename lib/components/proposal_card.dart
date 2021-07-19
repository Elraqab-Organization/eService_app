import 'package:e_service_app/providers/proposal%20provider/proposal_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProposalCard extends StatefulWidget {
  final String postId;
  ProposalCard(this.postId);
  @override
  _ProposalCardState createState() => _ProposalCardState();
}

class _ProposalCardState extends State<ProposalCard> {
  String status = "Pending";
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final proposals = watch(proposalList(widget.postId));
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
                            subtitle:
                                Text("24 minutes ago / Johor Bahru / Free"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 20, top: 10),
                            child: Text(
                              "dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              status == "Pending" ? postBtn() : acceptedBtn(),
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
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 80,
          height: 32,
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
          width: 80,
          height: 32,
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
