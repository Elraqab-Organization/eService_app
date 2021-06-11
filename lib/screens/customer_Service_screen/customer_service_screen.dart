import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/square_button.dart';
import '../login/login_screen.dart';
import 'package:e_service_app/screens/service_branches/service_branches.dart';
import 'package:e_service_app/screens/search_view_screen/search_view_screen.dart';
import '../../components/category_card.dart';

class CustomerServiceScreen extends StatefulWidget {
  String currentIndex;

  CustomerServiceScreen({this.currentIndex = "0"});
  @override
  _CustomerServiceScreenState createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareButton(
                  height: 120,
                  width: 120,
                  route: LoginScreen(),
                  icon: Icon(
                    Icons.ac_unit,
                    size: 70,
                  ),
                ),
                SquareButton(
                  height: 120,
                  width: 120,
                  route: ServiceBranches(),
                  icon: Icon(
                    Icons.ac_unit,
                    size: 70,
                  ),
                ),
                SquareButton(
                  height: 120,
                  width: 120,
                  route: LoginScreen(),
                  icon: Icon(
                    Icons.ac_unit,
                    size: 70,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Popular Services"),
                SizedBox(
                  width: 20,
                ),
                Text("See all"),
              ],
            ),
            Column(
              children: [
                CategoryCard(
                  favorite: FontAwesomeIcons.solidHeart,
                  onpresed: () {},
                  title: "Electrical",
                  rating: "4.5",
                  star: Icons.star,
                ),
                CategoryCard(
                  favorite: FontAwesomeIcons.solidHeart,
                  onpresed: () {},
                  title: "Computing",
                  rating: "4.5",
                  star: Icons.star,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
