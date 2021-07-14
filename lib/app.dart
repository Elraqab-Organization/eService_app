import 'package:e_service_app/components/bottom_navigation_bar.dart';
import 'package:e_service_app/components/inner_navigation_tabs.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  String currentIndex;
  String route;

  App({this.currentIndex = "0", this.route = "/customer_posts_view"});
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
        return InnerNavigationTabs(
          tabIndex: 0,
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
        // _logout();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 242, 239, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: callPage(widget.currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.currentIndex,
        callBack: _onItemTapped,
      ),
    );
  }
}
