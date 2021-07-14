import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceProvidersViewmodel extends ChangeNotifier {
  int index = 0;
  set active(value) {
    this.index = value;
    notifyListeners();
  }

  List category = [
    {
      'name': 'Rate',
      'items': ['5', '4', '3', '2', '1'],
      'selected': '5',
      'icon': Icon(
        FontAwesomeIcons.solidStar,
        color: Colors.white,
      ),
    },
    {
      'name': 'Location',
      'items': ['Johor Bahru', 'Kuala Lampur', 'Penang', 'Sarawak', 'Linkawy'],
      'selected': 'Johor Bahru',
      'icon': Icon(
        FontAwesomeIcons.locationArrow,
        color: Colors.white,
      )
    },
    {
      'name': 'Fees',
      'items': ['> 10', '> 20', '> 30', '> 40', '> 50'],
      'selected': '> 10',
      'icon': Icon(
        FontAwesomeIcons.moneyBill,
        color: Colors.white,
      )
    },
    {
      'name': 'Payment',
      'items': ['Cash', 'Credit Card'],
      'selected': 'Cash',
      'icon': Icon(
        FontAwesomeIcons.cashRegister,
        color: Colors.white,
      )
    },
  ];
}
