import 'package:e_service_app/screen/view/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  String currentIndex;
  // App({this.currentIndex = mLandingScreen});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // ignore: unused_element
  _onItemTapped(index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  // ignore: missing_return
  Widget callPage(index) {
    switch (index) {
      // case mLandingScreen:
      //   return MainScreen();
      // break;

    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final dataService = service<DataService>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
            child: _getBottomNav()),
      ),
    );
  }

  Container _getBottomNav() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[],
      ),
    );
  }

  Widget _getNavItem({
    String index,
    SvgPicture iconActive,
    SvgPicture iconInactive,
    String title,
  }) {
    return Container();
  }
}
