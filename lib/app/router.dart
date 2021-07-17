import 'package:e_service_app/screens/customer_post_form/customer_post_form.dart';
import 'package:e_service_app/screens/login/login_screen.dart';
import 'package:e_service_app/screens/main_services/main_services.dart';
import 'package:e_service_app/screens/post_screen/user_posts.dart';
import 'package:e_service_app/screens/register/register_screen.dart';
import 'package:e_service_app/screens/request_form_screen/request_form.dart';
import 'package:e_service_app/screens/search_view_screen/search_view_screen.dart';
import 'package:e_service_app/screens/service_branches/service_branches.dart';
import 'package:e_service_app/screens/service_provider_profile/service_provider_profile.dart';
import 'package:e_service_app/screens/service_provider_reviews/service_provider_reviews.dart';
import 'package:e_service_app/screens/service_providers/service_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case "/landing":
        builder = (BuildContext context) => App(currentIndex: "0");
        break;
      case "/service_providers":
        builder = (BuildContext context) =>
            ServiceProviders(data: settings.arguments);
        break;
      case "/service_branches":
        builder = (BuildContext context) => ServiceBranches();
        break;
      case "/service_provider_profile":
        builder = (BuildContext context) =>
            ServiceProviderProfile(data: settings.arguments);
        break;
      case "/service_provider_reviews":
        builder = (BuildContext context) => ServiceProviderReviews();
        break;
      case "/main_services":
        builder = (BuildContext context) => MainServices();
        break;
      case "/":
        builder = (BuildContext context) => LoginScreen();
        break;
      case "/register":
        builder = (BuildContext context) => RegisterScreen();
        break;
      case "/search_view":
        builder = (BuildContext context) => SearchView();
        break;
      case "/posts":
        builder = (BuildContext context) => PostScreen();
        break;
      case "/post_form":
        builder = (BuildContext context) => CustomerPostForm();
        break;
      case "/request_form":
        builder = (BuildContext context) => RequestForm();
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
