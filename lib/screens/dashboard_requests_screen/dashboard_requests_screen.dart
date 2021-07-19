import 'package:e_service_app/components/card_request.dart';
import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardRequest extends StatefulWidget {
  const DashboardRequest();

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<DashboardRequest>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: Color.fromRGBO(33, 39, 56, 1),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Pending',
                        ),
                        Tab(
                          text: 'All',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Expanded(
                          child: Consumer(
                            builder: (context, watch, child) {
                              final data = watch(dashboardRequestList);
                              return data.map(
                                data: (data) => CardRequest(
                                  isCustomer: false,
                                  data: data.value,
                                ),
                                loading: (_) =>
                                    Center(child: CircularProgressIndicator()),
                                error: (_) => Text("Error"),
                              );
                            },
                          ),
                        ),
                        Text("data"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
