import 'package:e_service_app/components/card_order/card_action_button.dart';
import 'package:e_service_app/components/card_order/order_body.dart';
import 'package:e_service_app/providers/orders/order.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_card_header.dart';

class OrderRequest extends StatefulWidget {
  final data;
  final bool isCustomer;

  OrderRequest({this.data, this.isCustomer});
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<OrderRequest> {
  // add one more functionality button. -- optional.
  final labels = ['reject', 'accept'];

  var activeIndex;
  var result;
  bool containerHeight = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final data = widget.isCustomer
            ? watch(ordersListProvider)
            : watch(dashboardOrders);
        return data.map(
          data: (data) {
            print(data.value);
            if (data.value == null)
              return Center(
                child: Text("Empty Orders List"),
              );
            widget.data == 1
                ? result = data.value
                    .where(
                        (element) => element.status.toLowerCase() == "accepted")
                    .toList()
                : result = data.value
                    .where(
                        (element) => element.status.toLowerCase() != "accepted")
                    .toList();
            return result.length != 0
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
                                  OrderHeaderCard(
                                    isCustomer: widget.isCustomer,
                                    data: result[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          activeIndex == index
                              ? OrderBody(
                                  index: index,
                                  result: result,
                                )
                              : SizedBox(),
                          activeIndex == index
                              ? CardOrderAction(
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
                : Center(child: Text("No Current Orders"));
          },
          loading: (_) => Center(
            child: CircularProgressIndicator(),
          ),
          error: (_) => Text("Error"),
        );
      },
    );
  }
}
