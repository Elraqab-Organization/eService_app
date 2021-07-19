import 'package:e_service_app/components/custom_app_bar/custom_app_bar.dart';
import 'package:e_service_app/components/square_button.dart';
import 'package:e_service_app/screens/Customer_Posts_Screen/customer_posts_service.dart';
import 'package:e_service_app/screens/Customer_order_screen/customer_ordder_screen.dart';
import 'package:e_service_app/screens/customer_Service_screen/customer_service_screen.dart';
import 'package:e_service_app/screens/customer_requests_screen/customer_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class InnerNavigationTabs extends StatefulWidget {
  int tabIndex;
  InnerNavigationTabs({
    this.tabIndex = 0,
    Key key,
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
      case 3:
        return CustomerRequestScreen();
        break;
    }
  }

  List<String> type = ['Services', 'Posts', 'Orders', 'Requests'];
  List<Color> colors = [
    Color.fromRGBO(87, 196, 229, 1),
    Color.fromRGBO(33, 39, 56, 1),
    Color.fromRGBO(87, 196, 229, 1),
    Color.fromRGBO(33, 39, 56, 1)
  ];
  List<IconData> icons = [
    FontAwesomeIcons.wrench,
    FontAwesomeIcons.database,
    FontAwesomeIcons.truckLoading,
    FontAwesomeIcons.networkWired
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              for (var i = 0; i < 4; i++)
                Expanded(
                  child: SquareButton(
                    height: 80,
                    route: onTab,
                    index: i,
                    icon: Icon(
                      icons[i],
                      size: 20.0,
                      color: Colors.white,
                    ),
                    title: type[i],
                    color: Color.fromRGBO(249, 112, 104, 1),
                  ),
                ),
            ],
          ),
        ),
        callTab(widget.tabIndex)
      ],
    );
  }
}
