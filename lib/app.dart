import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/components/bottom_navigation_bar.dart';
import 'package:e_service_app/components/inner_navigation_tabs.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/screens/customer_profile/customer_profile_screen.dart';
import 'package:e_service_app/screens/dashboard_screen/dashboard_screen.dart';
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

  // ignore: unused_element
  LoginViewmodel get _userSession => dependency();
  // ignore: missing_return
  Widget callPage(index) {
    switch (index) {
      case "0":
        return InnerNavigationTabs(
          tabIndex: 0,
        );
        break;
      case "1":
        return Dashboard();
        break;
      case "2":
        return Container(
          color: Colors.orange,
          height: 100.0,
        );
        break;
      case "3":
        return ProfileScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          // Changed this to a Column from a ListView
          children: <Widget>[
            // _createHeader(),
            ListTile(title: Text('Sericify App')),
            Expanded(
                child:
                    Container()), // Add this to force the bottom items to the lowest point
            Column(
              children: <Widget>[
                _createFooterItem(
                    icon: Icons.event,
                    text: 'Logout',
                    onTap: () => Navigator.pushReplacementNamed(context, '/'))
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 75,
          child: callPage(widget.currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.currentIndex,
        callBack: _onItemTapped,
      ),
    );
  }

  Widget _createFooterItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
