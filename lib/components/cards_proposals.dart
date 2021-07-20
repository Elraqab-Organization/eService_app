import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/proposal%20provider/proposal_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_moment/simple_moment.dart';

class CardProposal extends StatefulWidget {
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardProposal> {
  var moment = new Moment.now();
  LoginViewmodel get _service => dependency();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final proposals = watch(proposalsCustomerList(_service.user.id));
      return proposals.map(
          loading: (_) => Center(child: CircularProgressIndicator()),
          error: (_) => Text(_.error.toString()),
          data: (response) {
            return ListView.builder(
                itemCount: response.value.length,
                itemBuilder: (context, index) {
                  if (response.value[index].status == "Pending") {
                    return Container(
                      height: 170,
                      child: Card(
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
                                  response.value[index].serviceProvider.imgSrc,
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
                            proposalBtnsActions(response.value[index].id)
                          ],
                        ),
                      ),
                    );
                  }
                  return Text("");
                });
          });
    });
  }

  Widget proposalBtnsActions(id) {
    return Consumer(builder: (context, watch, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              await watch(propsProvider).acceptProposal(id);
            },
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
            onTap: () async {
              await watch(propsProvider).rejectProposal(id);
            },
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
    });
  }
}
