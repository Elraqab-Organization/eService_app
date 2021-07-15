import 'package:e_service_app/components/category_grid.dart';
import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatefulWidget {
  CustomerServiceScreen();
  @override
  _CustomerServiceScreenState createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Services",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/main_services");
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
            SizedBox(
              height: 10.0,
            ),
            CategoryGrid(
              paddingTop: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
