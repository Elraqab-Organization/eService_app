<<<<<<< HEAD
import 'package:flutter/material.dart';
import '../../components/order_card.dart';
=======
import 'package:e_service_app/components/card_order/card_order.dart';
import 'package:flutter/material.dart';
>>>>>>> 78ef7ea313121a624181c830d7e0a7c2c7e1e35a

class CustomerOrderScreen extends StatelessWidget {
  final onTap;
  final index = 0;
  CustomerOrderScreen({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
<<<<<<< HEAD
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Ordercard()
          ],
        ),
=======
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
          OrderRequest(
            isCustomer: true,
            data: 1,
          ),
        ]),
>>>>>>> 78ef7ea313121a624181c830d7e0a7c2c7e1e35a
      ),
    );
  }
}
