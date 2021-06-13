import 'package:flutter/material.dart';
import '../../components/order_card.dart';

class CustomerOrderScreen extends StatefulWidget {
  @override
  _CustomerOrderScreenState createState() => _CustomerOrderScreenState();
}

class _CustomerOrderScreenState extends State<CustomerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Ordercard(),
      ),
    );
  }
}
