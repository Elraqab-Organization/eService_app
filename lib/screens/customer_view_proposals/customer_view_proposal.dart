import 'package:e_service_app/components/custom_btn.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/components/proposal_card.dart';
import 'package:e_service_app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';

class CustomerViewProposal extends StatefulWidget {
  @override
  _CustomerViewProposalState createState() => _CustomerViewProposalState();
}

class _CustomerViewProposalState extends State<CustomerViewProposal> {
  String status = "Pending";

  var moment = new Moment.now();

  @override
  Widget build(BuildContext context) {
    final postObj = ModalRoute.of(context).settings.arguments as Post;
    return Scaffold(
      body: Container(
        color: Color(0xffEDF2EF),
        child: Column(
          children: [
            CustomReturnBar(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
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
            //
            Container(
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(postObj.imgSrc),
                        ),
                        title: Text(
                          postObj.username,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "${moment.from(postObj.timestamp)} / ${postObj.location} / ${postObj.cancelationFee}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20, top: 10),
                        child: Text(
                          '${postObj.description}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Proposals",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[350],
                      )
                    ],
                  ),
                  ProposalCard(),
                ],
              ),
            )
          ],
        ),
      ),
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
