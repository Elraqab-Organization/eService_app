import 'package:e_service_app/components/card_order/card_order.dart';
import 'package:e_service_app/components/custom_return_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  const OrderList();

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<OrderList>
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
          CustomReturnBar(),
          SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
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
                          text: 'In Progress',
                        ),
                        Tab(
                          text: 'Done',
                        ),
                      ],
                    ),
                  ),
                  // tab bar view here
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        OrderRequest(
                          isCustomer: true,
                          data: 1,
                        ),
                        OrderRequest(
                          isCustomer: true,
                          data: 2,
                        ),
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
