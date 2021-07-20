import 'package:e_service_app/components/custom_app_bar/custom_app_bar.dart';
import 'package:e_service_app/screens/Customer_Posts_Screen/customer_posts_service.dart';
import 'package:e_service_app/screens/Customer_order_screen/customer_ordder_screen.dart';
import 'package:e_service_app/screens/customer_Service_screen/customer_service_screen.dart';
import 'package:e_service_app/screens/customer_requests_screen/customer_request_screen.dart';
import 'package:flutter/material.dart';

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
  //   with SingleTickerProviderStateMixin {
  // TabController _tabController;

  // @override
  // void initState() {
  //   _tabController = TabController(length: 5, vsync: this);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  final widgets = [
    CustomerServiceScreen(),
    CustomerPostsServiceScreen(),
    CustomerOrderScreen(),
    CustomerRequestScreen(),
    CustomerRequestScreen()
  ];

  List<String> type = ['Services', 'Posts', 'Orders', 'Requests', 'Proposals'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        SizedBox(
          height: 50.0,
        ),
        DefaultTabController(
          length: 5,
          child: Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(33, 39, 56, 1),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Color.fromRGBO(249, 112, 104, 1),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        for (var i = 0; i < type.length; i++)
                          Tab(
                            text: type[i],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        CustomerServiceScreen(),
                        CustomerPostsServiceScreen(),
                        CustomerOrderScreen(),
                        CustomerRequestScreen(),
                        CustomerRequestScreen()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
