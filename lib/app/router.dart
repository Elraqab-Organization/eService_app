import 'package:e_service_app/screens/account_information_screen/account_information_screen.dart';
import 'package:e_service_app/screens/customer_address_screen/customer_address_screen.dart';
import 'package:e_service_app/screens/customer_favourite_screen/customer_favourite_screen.dart';
import 'package:e_service_app/screens/customer_notification_screen/customer_notification_screen.dart';
import 'package:e_service_app/screens/customer_profile/customer_profile_screen.dart';
import 'package:e_service_app/screens/login/login_screen.dart';
import 'package:e_service_app/screens/main_services/main_services.dart';
import 'package:e_service_app/screens/password_reset_screen/password_reset_screen.dart';
import 'package:e_service_app/screens/post_screen/user_posts.dart';
import 'package:e_service_app/screens/register/register_screen.dart';
import 'package:e_service_app/screens/search_view_screen/search_view_screen.dart';
import 'package:e_service_app/screens/customer_chat_screen/customer_chat_screen.dart';
import 'package:e_service_app/screens/service_branches/service_branches.dart';
import 'package:e_service_app/screens/service_provider_profile/service_provider_profile.dart';
import 'package:e_service_app/screens/service_provider_reviews/service_provider_reviews.dart';
import 'package:e_service_app/screens/service_providers/service_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late WidgetBuilder builder;

    switch (settings.name) {
      case "/landing":
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
      case "/":
        builder = (BuildContext context) => LoginScreen();
        break;
      case "/register":
        builder = (BuildContext context) => RegisterScreen();
        break;
      case "/search_view":
        builder = (BuildContext context) => SearchView();
        break;
      case "/customer_notification":
        builder = (BuildContext context) => CustomerNotificationScreen();
        break;
      case "/customer_favourite":
        builder = (BuildContext context) => CustomerFavouriteScreen();
        break;

      case "/customer_chat":
        builder = (BuildContext context) => CustomerChatScreen();
        break;
      case "/PasswordReset":
        builder = (BuildContext context) => PasswordResetScreen();
        break;
      case "/AccountInfo":
        builder = (BuildContext context) => AccountInformationScreen();
        break;
      case "/Profile":
        builder = (BuildContext context) => ProfileScreen();
        break;
      case "/MyAddress":
        builder = (BuildContext context) => CustomerAddressScreen();
        break;
      case "/posts":
        builder = (BuildContext context) => PostScreen();
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
