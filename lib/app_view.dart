import 'package:e_service_app/app/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pink,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
      ),
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: '/',
      // initialRoute: '/register',
      // initialRoute: kRestaurantHomePage,
    );
  }
}
