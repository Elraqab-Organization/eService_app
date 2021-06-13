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
    return Column(
      children: [
        SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareButton(
              height: 120,
              width: 120,
              route: "/customer_service_view",
              icon: Icon(
                FontAwesomeIcons.wrench,
                size: 50,
                color: Colors.white,
              ),
              title: "Services",
              color: Colors.black,
            ),
            SquareButton(
              height: 120,
              width: 120,
              route: "/customer_posts_view",
              icon: Icon(
                Icons.ac_unit,
                size: 50,
                color: Colors.white,
              ),
              title: "Posts",
              color: Colors.pink,
            ),
            SquareButton(
              height: 120,
              width: 120,
              route: "/customer_order_view",
              icon: Icon(
                Icons.ac_unit,
                size: 50,
                color: Colors.white,
              ),
              title: "Orders",
              color: Colors.lightBlue,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 90,
              width: 20,
            ),
            Text(
              "Popular Services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            SizedBox(
              width: 70,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "See all",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ),
      ],
    );
  }
}
