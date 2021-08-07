import 'package:e_service_app/components/card_request/card_request.dart';
import 'package:flutter/material.dart';

class CustomerRequestScreen extends StatelessWidget {
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
                "Last Requests",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, "/requests_list")},
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
          child: CardRequest(
            isCustomer: true,
            data: 1,
          ),
        ),
      ]),
    );
  }
}
