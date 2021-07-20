import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardActionButton extends StatelessWidget {
  const CardActionButton(
      {Key key, this.isCustomer, this.activeIndex, this.index, this.result})
      : super(key: key);
  final activeIndex;
  final index;
  final result;
  final isCustomer;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return result[index].status.toLowerCase() == "pending"
            ? watch(requestProvider).loading && activeIndex == index
                ? Positioned(
                    left: 140,
                    top: 120,
                    child: CircularProgressIndicator(),
                  )
                : Positioned(
                    bottom: 10,
                    right: 10,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      opacity: activeIndex == index ? 1 : 0,
                      child: isCustomer
                          ? InkWell(
                              onTap: () => watch(requestProvider)
                                  .acceptRequest(result[index].id, "Canceled"),
                              child: Container(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: Color.fromRGBO(33, 39, 56, 1),
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () => watch(requestProvider)
                                      .acceptRequest(
                                          result[index].id, "Accepted"),
                                  child: Container(
                                    child: Text(
                                      "Accept",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.0),
                                      color: Color.fromRGBO(33, 39, 56, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                InkWell(
                                  onTap: () => watch(requestProvider)
                                      .acceptRequest(
                                          result[index].id, "Rejected"),
                                  child: Container(
                                    child: Text(
                                      "Reject",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.0),
                                      color: Color.fromRGBO(33, 39, 56, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  )
            : Positioned(
                bottom: 10,
                right: 10,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: activeIndex == index ? 1 : 0,
                  child: Container(
                    child: Text(
                      "${result[index].status}",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Color.fromRGBO(33, 39, 56, 1),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
