import 'package:delayed_display/delayed_display.dart';
import 'package:e_service_app/components/custom_app_bar.dart';
import 'package:e_service_app/components/text_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  String currentIndex;

  App({this.currentIndex = "0"});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // ignore: unused_element
  _onItemTapped(index) {
    setState(() {
      widget.currentIndex = index.toString();
    });
  }

  // ignore: missing_return
  Widget callPage(index) {
    switch (index) {
      case "0":
        return Container(
          color: Colors.grey,
          height: 100.0,
        );
        break;
      case "1":
        return Container(
          color: Colors.red,
          height: 100.0,
        );
        break;
      case "2":
        return Container(
          color: Colors.orange,
          height: 100.0,
        );
        break;
      case "3":
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: Container(child: callPage(widget.currentIndex)),
                ),
              ],
            ),
          ),
          CustomAppBar(),
        ],
      ),
      bottomNavigationBar: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: BottomNavBar(
          currentIndex: widget.currentIndex,
          callBack: _onItemTapped,
        ),
      ),
    );
  }
}

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
      'title': 'Notification',
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
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: items.length,
          padding: EdgeInsets.all(8.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () => {widget.callBack(index)},
                child: AnimatedContainer(
                  onEnd: () {
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() => {activeIndex = widget.currentIndex});
                    });
                  },
                  duration: const Duration(milliseconds: 100),
                  width: widget.currentIndex == index.toString() ? 150.0 : 60.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: index.toString() == widget.currentIndex
                        ? BorderRadius.circular(30.0)
                        : BorderRadius.circular(50.0),
                    color: Color.fromRGBO(249, 112, 104, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: widget.currentIndex == index.toString()
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(items[index]['icon']),
                      SizedBox(),
                      widget.currentIndex == index.toString() &&
                              activeIndex == widget.currentIndex
                          ? DelayedDisplay(
                              delay: Duration(milliseconds: 50),
                              child: TextComponent(
                                textColor: Colors.white,
                                title: items[index]['title'],
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
            );
          },
        ));
  }
}