import 'dart:async';

import 'package:e_service_app/components/custom_text_field.dart';
import 'package:e_service_app/providers/orders/order.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardOrderAction extends StatelessWidget {
  const CardOrderAction(
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
        return result[index].status.toLowerCase() == "ingoing"
            ? watch(orderProvider).loading && activeIndex == index
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
                          ? Container(
                              child: Text(
                                result[index].status,
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                color: Color.fromRGBO(33, 39, 56, 1),
                              ),
                            )
                          : InkWell(
                              onTap: () => watch(orderProvider)
                                  .markAsDone(result[index].id),
                              child: Container(
                                child: Text(
                                  "Mark as done",
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: Color.fromRGBO(33, 39, 56, 1),
                                ),
                              ),
                            ),
                    ),
                  )
            : isCustomer
                ? result[index].isFeedbackGiven
                    ? SizedBox()
                    : Positioned(
                        bottom: 10,
                        right: 10,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 100),
                          opacity: activeIndex == index ? 1 : 0,
                          child: InkWell(
                            onTap: () {
                              giveFeedback(context);
                            },
                            child: Container(
                              child: Text(
                                "Give Feedback",
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                color: Color.fromRGBO(33, 39, 56, 1),
                              ),
                            ),
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

  Future<dynamic> giveFeedback(BuildContext context) {
    double rate = 1;
    TextEditingController controller = new TextEditingController();
    return showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        title: new Text("Give Feedback"),
        content: StatefulBuilder(
          builder: (context, setState) => Consumer(
            builder: (context, watch, child) => watch(orderProvider).loading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: 200,
                    child: Column(
                      children: [
                        CustomerTextField(
                          validate: false,
                          controller: controller,
                          labelText: "Feedback",
                          color: Colors.black,
                          borderColor: Colors.black,
                          lines: 4,
                          onChanged: (value) => controller.text = value,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Slider(
                          value: rate,
                          onChanged: (value) => setState(
                            () => {rate = value},
                          ),
                          max: 5,
                          min: 1,
                          activeColor: Color.fromRGBO(249, 112, 104, 1),
                          inactiveColor: Color.fromRGBO(33, 39, 56, 1),
                          divisions: 4,
                          label: rate.toString(),
                        )
                      ],
                    ),
                  ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => {
              context
                  .read(orderProvider)
                  .giveFeedback(result[index].id, controller.text, rate),
              Navigator.of(context).pop()
            },
            child: Container(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Color.fromRGBO(33, 39, 56, 1),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
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
          ),
        ],
      ),
    );
  }
}
