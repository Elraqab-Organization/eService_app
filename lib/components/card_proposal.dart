import 'package:e_service_app/components/text_component.dart';
import 'package:e_service_app/screens/Customer_order_screen/widgets/header_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CardProposal extends StatefulWidget {
  final data;
  final bool isCustomer;
  CardProposal({this.data, this.isCustomer});
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardProposal> {
  // add one more functionality button. -- optional.
  final labels = ['cancel', 'accept'];
  var activeIndex;
  bool containerHeight = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.data != null
          ? ListView.builder(
              clipBehavior: Clip.hardEdge,
              itemCount: widget.data.length,
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
                        duration: Duration(milliseconds: 200),
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
                            HeaderContent(),
                          ],
                        ),
                      ),
                    ),
                    activeIndex == index
                        ? Positioned(
                            bottom: 20,
                            left: 30,
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextComponent(
                                    align: TextAlign.start,
                                    textColor: Colors.black,
                                    line: 4,
                                    fontSize: 12,
                                    weight: FontWeight.w500,
                                    title:
                                        "Problem: ${widget.data[index].description}",
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextComponent(
                                        align: TextAlign.start,
                                        textColor: Colors.black,
                                        line: 4,
                                        fontSize: 12,
                                        weight: FontWeight.w500,
                                        title:
                                            "Problem: ${widget.data[index].location}",
                                      ),
                                      TextComponent(
                                        align: TextAlign.start,
                                        textColor: Colors.black,
                                        line: 4,
                                        fontSize: 12,
                                        weight: FontWeight.w500,
                                        title:
                                            "Payment: ${widget.data[index].payment}",
                                      ),
                                      TextComponent(
                                        align: TextAlign.start,
                                        textColor: Colors.black,
                                        line: 4,
                                        fontSize: 12,
                                        weight: FontWeight.w500,
                                        title:
                                            "Date: ${widget.data[index].provisionDate}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                    widget.data[index].status.toLowerCase() == "pending"
                        ? Positioned(
                            bottom: 10,
                            right: 10,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 100),
                              opacity: activeIndex == index ? 1 : 0,
                              child: Row(
                                children: [
                                  // for (var i = 0; i < widget.functionCount; i++)
                                  //   InkWell(
                                  //     onTap: widget.functions[i],
                                  //     child: Container(
                                  //       child: Text(
                                  //         labels[i],
                                  //         style: TextStyle(color: Colors.white),
                                  //       ),
                                  //       padding: EdgeInsets.all(10.0),
                                  //       decoration: BoxDecoration(
                                  //         borderRadius:
                                  //             BorderRadius.circular(18.0),
                                  //         color: Color.fromRGBO(33, 39, 56, 1),
                                  //       ),
                                  //     ),
                                  //   ),
                                ],
                              ),
                            ),
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
              child: Center(child: Text("No orders was found!")),
            ),
    );
  }
}
