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
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              InkWell(
                onTap: () {},
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
          CategoryGrid(
            paddingTop: 30.0,
          )
        ],
      ),
    );
  }
}
