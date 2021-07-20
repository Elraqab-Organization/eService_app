import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestBody extends StatelessWidget {
  const RequestBody({Key key, this.result, this.index}) : super(key: key);
  final result;
  final index;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 30,
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent(
              align: TextAlign.start,
              textColor: Colors.black,
              line: 4,
              fontSize: 12,
              weight: FontWeight.w500,
              title: "Problem: ${result[index].description}",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  align: TextAlign.start,
                  textColor: Colors.black,
                  line: 4,
                  fontSize: 12,
                  weight: FontWeight.w500,
                  title: "Problem: ${result[index].location}",
                ),
                TextComponent(
                  align: TextAlign.start,
                  textColor: Colors.black,
                  line: 4,
                  fontSize: 12,
                  weight: FontWeight.w500,
                  title: "Payment: ${result[index].payment}",
                ),
                TextComponent(
                  align: TextAlign.start,
                  textColor: Colors.black,
                  line: 4,
                  fontSize: 12,
                  weight: FontWeight.w500,
                  title: "Date: ${result[index].provisionDate}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
