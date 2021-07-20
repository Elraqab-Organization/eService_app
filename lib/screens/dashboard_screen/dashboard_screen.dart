import 'package:e_service_app/screens/dashboard_orders_screen/dashboard_orders_screen.dart';
import 'package:e_service_app/screens/dashboard_proposals_screen/dashboard_proposals_screen.dart';
import 'package:e_service_app/screens/dashboard_requests_screen/dashboard_requests_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(249, 112, 104, 1),
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(33, 39, 56, 1),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 5.0),
                ),
              ),
              tabs: [
                Tab(
                  text: "Proposals",
                ),
                Tab(
                  text: "Requests",
                ),
                Tab(
                  text: "Orders",
                ),
              ],
            ),
            title: Text('Service Dashboard'),
          ),
          body: TabBarView(
            children: [
              DashboardProposal(),
              DashboardRequest(),
              DashboardOrder(),
            ],
          ),
        ),
      ),
    );
  }
}
