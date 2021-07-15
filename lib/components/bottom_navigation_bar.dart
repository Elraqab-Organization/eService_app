import 'dart:ffi';

import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatefulWidget {
  final String currentIndex;
  final Function callBack;

  BottomNavBar({this.currentIndex, this.callBack});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String activeIndex = '0';
  final items = [
    {
      'icon': 'lib/assets/icon/outline_home_white_36dp.svg',
      'title': 'Home',
    },
    {
      'icon': 'lib/assets/icon/icons8-heart-30 (1).svg',
      'title': 'Saved',
    },
    {
      'icon': 'lib/assets/icon/outline_question_answer_white_36dp.svg',
      'title': 'Board',
    },
    {
      'icon': 'lib/assets/icon/outline_account_circle_white_36dp.svg',
      'title': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 5,
          ),
          for (var i = 0; i < items.length; i++)
            InkWell(
              onTap: () => {widget.callBack(i)},
              child: AnimatedContainer(
                onEnd: () {
                  Future.delayed(Duration(milliseconds: 200), () {
                    setState(() => {activeIndex = widget.currentIndex});
                  });
                },
                duration: const Duration(milliseconds: 100),
                width: widget.currentIndex == i.toString() ? 120.0 : 56,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: i.toString() == widget.currentIndex
                      ? BorderRadius.circular(30.0)
                      : BorderRadius.circular(50.0),
                  color: Color.fromRGBO(249, 112, 104, 1),
                ),
                child: Row(
                  mainAxisAlignment: widget.currentIndex == i.toString()
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(items[i]['icon']),
                    SizedBox(),
                    widget.currentIndex == i.toString() &&
                            activeIndex == widget.currentIndex
                        ? DelayedDisplay(
                            delay: Duration(milliseconds: 50),
                            child: TextComponent(
                              textColor: Colors.white,
                              title: items[i]['title'],
                              align: TextAlign.center,
                              fontSize: 16.0,
                              weight: FontWeight.w600,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(),
                  ],
                ),
              ),
            ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
