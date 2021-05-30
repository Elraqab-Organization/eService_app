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
    return SafeArea(
      child: Scaffold(
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
          child: _getBottomNav(),
        ),
      ),
    );
  }

  Container _getBottomNav() {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _getNavItem(
            index: "0",
            active: false,
            iconActive:
                SvgPicture.asset("lib/assets/icon/outline_home_white_36dp.svg"),
            title: "Home",
          ),
          _getNavItem(
            index: "1",
            active: false,
            iconActive:
                SvgPicture.asset("lib/assets/icon/icons8-heart-30 (1).svg"),
            title: "Home",
          ),
          _getNavItem(
            index: "2",
            active: false,
            iconActive: SvgPicture.asset(
                "lib/assets/icon/outline_question_answer_white_36dp.svg"),
            title: "Home",
          ),
          _getNavItem(
            index: "3",
            active: false,
            iconActive: SvgPicture.asset(
                "lib/assets/icon/outline_account_circle_white_36dp.svg"),
            title: "Home",
          ),
        ],
      ),
    );
  }

  Widget _getNavItem({
    String index,
    SvgPicture iconActive,
    bool active,
    String title,
  }) {
    return InkWell(
      onTap: () => {
        setState(() {
          widget.currentIndex = index.toString();
        })
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: widget.currentIndex == index ? 130.0 : 56.0,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: active
              ? BorderRadius.circular(30.0)
              : BorderRadius.circular(50.0),
          color: Color.fromRGBO(249, 112, 104, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconActive,
            widget.currentIndex == index
                ? DelayedDisplay(
                    delay: Duration(milliseconds: 50),
                    child: TextComponent(
                      textColor: Colors.white,
                      title: title,
                      align: TextAlign.center,
                      fontSize: 16.0,
                      weight: FontWeight.w600,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
