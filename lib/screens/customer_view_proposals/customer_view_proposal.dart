import 'package:e_service_app/components/custom_btn.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:flutter/material.dart';

class CustomerViewProposal extends StatefulWidget {
  @override
  _CustomerViewProposalState createState() => _CustomerViewProposalState();
}

class _CustomerViewProposalState extends State<CustomerViewProposal> {
  String status = "Pending";
  // String status = "Accepted";
  // String status = "Rejected";
  @override
  Widget build(BuildContext context) {
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
              width: MediaQuery.of(context).size.width - 60,
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
                          backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/men/1.jpg"),
                        ),
                        title: Text(
                          "Ahmad Mousa",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("24 minutes ago / Johor Bahru / Free"),
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
                  Container(
                    height: MediaQuery.of(context).size.height - 480,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://randomuser.me/api/portraits/men/7.jpg"),
                                ),
                                title: Text(
                                  "Ahmad Mousa",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  status == "Pending"
                                      ? postBtn()
                                      : acceptedBtn(),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            )
          ],
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
