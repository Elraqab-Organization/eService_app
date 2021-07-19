import 'package:e_service_app/components/card_order.dart';
import 'package:e_service_app/components/card_request.dart';
import 'package:e_service_app/providers/orders/order.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerOrderScreen extends StatelessWidget {
  final onTap;
  final index = 0;
  CustomerOrderScreen({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Orders",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/orders_list");
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            // Ordercard()
            Consumer(
              builder: (context, watch, child) {
                final data = watch(ordersListProvider);
                print(data);
                return data.map(
                  data: (value) => CardOrder(
                    data: value.value,
                  ),
                  loading: (_) => Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (_) => Expanded(
                    child: Center(
                      child: Text("Network error"),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
