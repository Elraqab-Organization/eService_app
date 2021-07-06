import 'package:e_service_app/screens/Customer_order_screen/widgets/header_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class Ordercard extends StatefulWidget {
  @override
  _OrdercardState createState() => _OrdercardState();
}

class _OrdercardState extends State<Ordercard> {
  final _data = [
    {
      'headerValue': 'hello',
      'expandedValue': 'fatsha',
      'containerHeight': false,
    },
    {
      'headerValue': 'hello',
      'expandedValue': 'fatsha',
      'containerHeight': false,
    },
  ];
  bool containerHeight = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) => Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: InkWell(
                onTap: () => setState(() => {
                      _data[index]['containerHeight'] =
                          !(_data[index]['containerHeight'] as bool)
                    }),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height:
                      _data[index]['containerHeight'] != null ? 200.0 : 82.0,
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
              right: -10,
              top: 20,
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 39, 56, 1),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                      "lib/assets/icon/outline_replay_white_24dp.svg")),
            ),
            Positioned(
              bottom: 5,
              left: (MediaQuery.of(context).size.width / 2) - 20,
              child: Transform.rotate(
                angle: containerHeight ? math.pi / 1 : math.pi / 180,
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
