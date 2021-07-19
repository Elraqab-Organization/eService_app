import 'package:e_service_app/screens/Customer_order_screen/widgets/header_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CardComponent extends StatefulWidget {
  final data;
  final List<Function> functions;
  final functionCount;

  CardComponent({this.data, this.functions, this.functionCount});
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  // add one more functionality button. -- optional.
  final labels = ['accept', 'reject'];
  var activeIndex;
  bool containerHeight = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.data != null
          ? ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () => setState(() => {activeIndex = index}),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: activeIndex == index ? 200.0 : 82.0,
                        clipBehavior: Clip.none,
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
                            HeaderContent()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: (MediaQuery.of(context).size.width / 2) - 20,
                    child: Transform.rotate(
                      angle:
                          activeIndex == index ? (math.pi / 4) : (math.pi / 16),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 14.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(249, 112, 104, 1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                          child: Text(
                            widget.data[index].status,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            for (var i = 0; i < widget.functionCount; i++)
                              ElevatedButton(
                                onPressed: () => widget.functions[i],
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(249, 112, 104, 1),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  labels[i],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Expanded(
              child: Center(child: Text("No orders was found!")),
            ),
    );
  }
}
