import 'package:e_service_app/app.dart';
import 'package:e_service_app/screen/page/login_screen.dart';
import 'package:e_service_app/screen/page/register_screen.dart';
import 'package:e_service_app/screen/page/search_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case "/":
        builder = (BuildContext context) => LoginScreen();
        break;
      case "/login":
        builder = (BuildContext context) => App(currentIndex: "0");
        break;
      case "/register":
        builder = (BuildContext context) => RegisterScreen();
        break;
      case "/search_view":
        builder = (BuildContext context) => SearchView();
        break;
      default:
      // builder = (BuildContext context) => App(currentIndex: settings.name);
    }

    // throw Exception('Invalid route: ${settings.name}');

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
