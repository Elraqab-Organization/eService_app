import 'package:flutter/material.dart';
import '../../components/posts_card.dart';
import '../../components/square_button.dart';
import '../login/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_service_app/screens/service_branches/service_branches.dart';

class CustomerPostsServiceScreen extends StatefulWidget {
  @override
  _CustomerPostsServiceScreenState createState() =>
      _CustomerPostsServiceScreenState();
}

class _CustomerPostsServiceScreenState
    extends State<CustomerPostsServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      color: Color.fromRGBO(237, 242, 239, 1),
      height: MediaQuery.of(context).size.height - 145,
      child: Column(
        children: [
          SizedBox(height: 110),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SquareButton(
                  height: 100,
                  route: "/customer_service_view",
                  icon: Icon(
                    FontAwesomeIcons.wrench,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: "Services",
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: SquareButton(
                  height: 100,
                  route: "/customer_posts_view",
                  icon: Icon(
                    Icons.ac_unit,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: "Posts",
                  color: Colors.pink,
                ),
              ),
              Expanded(
                child: SquareButton(
                  height: 100,
                  route: "/customer_order_view",
                  icon: Icon(
                    Icons.ac_unit,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: "Orders",
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(child: PostsCard()),
        ],
      ),
    );
  }
}
