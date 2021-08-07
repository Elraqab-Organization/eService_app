import 'package:e_service_app/components/card_order/card_order.dart';
import 'package:flutter/material.dart';

class CustomerOrderScreen extends StatelessWidget {
  final onTap;
  final index = 0;
  CustomerOrderScreen({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(children: [
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "In Progress Orders",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, "/orders_list")},
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
        Expanded(
          child: OrderRequest(
            isCustomer: true,
            data: 1,
          ),
        ),
      ]),
    );
  }
}
