import 'package:e_service_app/screens/login/login_screen.dart';
import 'package:e_service_app/screens/main_services/main_services.dart';
import 'package:e_service_app/screens/register/register_screen.dart';
import 'package:e_service_app/screens/service_provider_profile/service_provider_profile.dart';
import 'package:e_service_app/screens/service_provider_reviews/service_provider_reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case "/":
        builder = (BuildContext context) => App(currentIndex: "0");
        break;
      case "/servie_provider_profile":
        builder = (BuildContext context) => ServiceProviderProfile();
        break;
      case "/service_provider_reviews":
        builder = (BuildContext context) => ServiceProviderReviews();
        break;
      case "/main_services":
        builder = (BuildContext context) => MainServices();
        break;
      case "/login":
        builder = (BuildContext context) => LoginScreen();
        break;
      case "/register":
        builder = (BuildContext context) => RegisterScreen();
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
