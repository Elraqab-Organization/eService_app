import 'package:e_service_app/screens/customer_Service_screen/customer_service_screen.dart';
import 'package:e_service_app/screens/login/login_screen.dart';
import 'package:e_service_app/screens/main_services/main_services.dart';
import 'package:e_service_app/screens/register/register_screen.dart';
import 'package:e_service_app/screens/search_view_screen/search_view_screen.dart';
import 'package:e_service_app/screens/service_branches/service_branches.dart';
import 'package:e_service_app/screens/service_provider_profile/service_provider_profile.dart';
import 'package:e_service_app/screens/service_provider_reviews/service_provider_reviews.dart';
import 'package:e_service_app/screens/service_providers/service_providers.dart';
import 'package:e_service_app/screens/Customer_Posts_Screen/customer_posts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/posts_card.dart';

import '../app.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case "/":
        builder = (BuildContext context) => App(currentIndex: "0");
        break;
      case "/service_providers":
        builder = (BuildContext context) => ServiceProviders();
        break;
      case "/service_branches":
        builder = (BuildContext context) => ServiceBranches();
        break;
      case "/service_provider_profile":
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
      case "/search_view":
        builder = (BuildContext context) => SearchView();
        break;
      case "/customer_service_view":
        builder =
            (BuildContext context) => CustomerServiceScreen(currentIndex: "3");
        break;
      case "/customer_posts_view":
        builder = (BuildContext context) => CustomerPostsServiceScreen();
        break;
      case "/PostsCard":
        builder = (BuildContext context) => PostsCard();
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
