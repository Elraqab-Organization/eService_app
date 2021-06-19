import 'package:flutter/material.dart';
import 'package:e_service_app/components/category_grid.dart';

class CustomerFavouriteScreen extends StatefulWidget {
  @override
  _CustomerFavouriteScreenState createState() =>
      _CustomerFavouriteScreenState();
}

class _CustomerFavouriteScreenState extends State<CustomerFavouriteScreen> {
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
                "Your Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              CategoryGrid(),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Service Providers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
