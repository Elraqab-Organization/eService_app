import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_service_app/model/router.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pink,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
      ),
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: '/',
      // initialRoute: kRestaurantHomePage,
    );
  }
}
