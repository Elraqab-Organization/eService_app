import 'package:flutter/material.dart';
import '../../components/order_card.dart';

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
                      Navigator.pushNamed(context, "/orders");
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
            Ordercard()
          ],
        ),
      ),
    );
  }
}
