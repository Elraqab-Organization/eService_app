import 'package:e_service_app/components/card_request.dart';
import 'package:e_service_app/providers/requests/requests_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerRequestScreen extends StatelessWidget {
  CustomerRequestScreen();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
          Consumer(
            builder: (context, watch, child) {
              final data = watch(requestList);
              return data.map(
                data: (value) => CardRequest(
                  isCustomer: true,
                  data: value.value,
                ),
                loading: (_) => Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (_) => Expanded(
                  child: Center(
                    child: Text(_.error.toString()),
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
