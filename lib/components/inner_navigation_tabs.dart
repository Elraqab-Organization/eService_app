import 'package:e_service_app/components/square_button.dart';
import 'package:e_service_app/screens/customer_Posts_Screen/customer_posts_service.dart';
import 'package:e_service_app/screens/customer_order_screen/customer_order_screen.dart';
import 'package:e_service_app/screens/customer_Service_screen/customer_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class InnerNavigationTabs extends StatefulWidget {
  int tabIndex;
  InnerNavigationTabs({
    this.tabIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  _InnerNavigationTabsState createState() => _InnerNavigationTabsState();
}

class _InnerNavigationTabsState extends State<InnerNavigationTabs> {
  onTab(index) {
    setState(() => {widget.tabIndex = index});
  }

  callTab(index) {
    switch (index) {
      case 0:
        return CustomerServiceScreen();
        break;
      case 1:
        return CustomerPostsServiceScreen();
        break;
      case 2:
        return CustomerOrderScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SquareButton(
                height: 100,
                route: onTab,
                index: 0,
                icon: Icon(
                  FontAwesomeIcons.wrench,
                  size: 30,
                  color: Colors.white,
                ),
                title: "Services",
                color: Color.fromRGBO(33, 39, 56, 1),
              ),
            ),
            Expanded(
              child: SquareButton(
                height: 100,
                route: onTab,
                index: 1,
                icon: Icon(
                  FontAwesomeIcons.podcast,
                  size: 30,
                  color: Colors.white,
                ),
                title: "Posts",
                color: Color.fromRGBO(249, 112, 104, 1),
              ),
            ),
            Expanded(
              child: SquareButton(
                height: 100,
                route: onTab,
                index: 2,
                icon: Icon(
                  Icons.ac_unit,
                  size: 30,
                  color: Colors.white,
                ),
                title: "Orders",
                color: Color.fromRGBO(87, 196, 229, 1),
              ),
            ),
          ],
        ),
        callTab(widget.tabIndex)
      ],
    );
  }
}
