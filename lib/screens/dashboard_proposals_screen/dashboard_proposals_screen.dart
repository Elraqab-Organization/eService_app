// import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/proposal%20provider/proposal_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_moment/simple_moment.dart';

class DashboardProposal extends StatefulWidget {
  const DashboardProposal();

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<DashboardProposal>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  LoginViewmodel get _service => dependency();
  var moment = new Moment.now();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: Color.fromRGBO(33, 39, 56, 1),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Pending',
                        ),
                        Tab(
                          text: 'All',
                        ),
                      ],
                    ),
                  ),
                  // tab bar view here
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                              height: 300,
                              child: Consumer(builder: (context, watch, child) {
                                final proposals = watch(
                                    serviceProviderProposalsList(
                                        _service.user.id));
                                return proposals.map(
                                    loading: (_) => Center(
                                        child: CircularProgressIndicator()),
                                    error: (_) => Text(_.error.toString()),
                                    data: (response) {
                                      if (response.value != null)
                                        return ListView.builder(
                                            itemCount: response.value.length,
                                            itemBuilder: (context, index) {
                                              if (response
                                                      .value[index].status ==
                                                  "Pending") {
                                                return Container(
                                                  height: 180,
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ListTile(
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                              response
                                                                  .value[index]
                                                                  .customer
                                                                  .imgSrc,
                                                            ),
                                                          ),
                                                          title: Text(
                                                              '${response.value[index].customer.firstName} ${response.value[index].customer.lastName}'),
                                                          subtitle: Text(
                                                            '${moment.from(response.value[index].timestamp)}' +
                                                                ' / ${response.value[index].post.location} /' +
                                                                '${response.value[index].diagnosisFee} RM',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 18,
                                                                  bottom: 18,
                                                                  left: 14),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 20),
                                                            child: Text(
                                                              '${response.value[index].description}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.6)),
                                                            ),
                                                          ),
                                                        ),
                                                        // btns
                                                        proposalBtns(response
                                                            .value[index].id)
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                              return Text("");
                                            });
                                      return Center(
                                        child: Text(
                                            "Nothing in Pending proposals"),
                                      );
                                    });
                              })),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                              height: 300,
                              child: Consumer(builder: (context, watch, child) {
                                final proposals = watch(
                                    serviceProviderProposalsList(
                                        _service.user.id));
                                return proposals.map(
                                    loading: (_) => Center(
                                        child: CircularProgressIndicator()),
                                    error: (_) => Text(_.error.toString()),
                                    data: (response) {
                                      if (response.value != null)
                                        return ListView.builder(
                                            itemCount: response.value.length,
                                            itemBuilder: (context, index) {
                                              if (response
                                                      .value[index].status !=
                                                  "Pending") {
                                                return Container(
                                                  height: 180,
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ListTile(
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                              response
                                                                  .value[index]
                                                                  .customer
                                                                  .imgSrc,
                                                            ),
                                                          ),
                                                          title: Text(
                                                              '${response.value[index].customer.firstName} ${response.value[index].customer.lastName}'),
                                                          subtitle: Text(
                                                            '${moment.from(response.value[index].timestamp)}' +
                                                                ' / ${response.value[index].post.location} /' +
                                                                '${response.value[index].diagnosisFee} RM',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 18,
                                                                  bottom: 18,
                                                                  left: 14),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 20),
                                                            child: Text(
                                                              '${response.value[index].description}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.6)),
                                                            ),
                                                          ),
                                                        ),
                                                        // btns
                                                        if (response
                                                                .value[index]
                                                                .status ==
                                                            "Accepted")
                                                          acceptedBtn()
                                                        else if (response
                                                                .value[index]
                                                                .status ==
                                                            "rejected")
                                                          rejectedBtn()
                                                        else if (response
                                                                .value[index]
                                                                .status ==
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
                                        child: Text("found 0 proposals"),
                                      );
                                    });
                              })),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget proposalBtns(final id) {
    return Consumer(builder: (context, watch, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              width: 80,
              height: 32,
              child: Center(
                  child: Text(
                "Pending",
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                color: Color(0xff57C4E5),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await watch(propsProvider).cancelProposal(id);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: 80,
                height: 32,
                child: Center(
                    child: Text(
                  "Cancel",
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
    });
  }

  Widget acceptedBtn() {
    return Padding(
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
    );
  }

  Widget rejectedBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
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
      ),
    );
  }

  Widget canceledBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
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
                "canceled",
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                color: Color(0xffF97068),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
