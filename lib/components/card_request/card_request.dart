import 'package:e_service_app/components/card_request/card__action_button.dart';
import 'package:e_service_app/components/card_request/request_body.dart';
import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:e_service_app/screens/Customer_order_screen/widgets/header_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardRequest extends StatefulWidget {
  final data;
  final bool isCustomer;

  CardRequest({this.data, this.isCustomer});
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardRequest> {
  // add one more functionality button. -- optional.
  final labels = ['reject', 'accept'];

  var activeIndex;
  bool containerHeight = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final data = widget.isCustomer
            ? watch(requestList)
            : watch(dashboardRequestList);
        return data.map(
          data: (data) {
            if (data.value == null)
              return Expanded(
                child: Center(
                  child: Text("Request List Is Empty!"),
                ),
              );
            final result = widget.data == 1
                ? data.value
                    .where(
                        (element) => element.status.toLowerCase() == "pending")
                    .toList()
                : data.value
                    .where(
                        (element) => element.status.toLowerCase() != "pending")
                    .toList();
            return Expanded(
              child: result.length != 0
                  ? ListView.builder(
                      clipBehavior: Clip.hardEdge,
                      itemCount: result.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => setState(() => {activeIndex = index}),
                        child: Stack(
                          clipBehavior: Clip.hardEdge,
                          children: [
                            Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: activeIndex == index ? 250.0 : 82.0,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    HeaderContent(
                                      isCustomer: widget.isCustomer,
                                      data: result[index],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            activeIndex == index
                                ? RequestBody(
                                    index: index,
                                    result: result,
                                  )
                                : SizedBox(),
                            activeIndex == index
                                ? CardActionButton(
                                    activeIndex: activeIndex,
                                    result: result,
                                    isCustomer: widget.isCustomer,
                                    index: index,
                                  )
                                : SizedBox(),
                            Positioned(
                              bottom: 5,
                              left: MediaQuery.of(context).size.width / 2 - 30,
                              child: Transform.rotate(
                                angle: activeIndex == index
                                    ? (math.pi / 1)
                                    : (math.pi * 2),
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(child: Text("No Pending Requests")),
                    ),
            );
          },
          loading: (_) => Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (_) => Text("Error"),
        );
      },
    );
  }
}
