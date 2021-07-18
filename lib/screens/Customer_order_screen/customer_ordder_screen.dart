import 'package:flutter/material.dart';
import '../../components/order_card.dart';

class CustomerOrderScreen extends StatelessWidget {
  final onTap;
  final index = 0;
  CustomerOrderScreen({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Ordercard()
        ],
      ),
    );
  }
}
