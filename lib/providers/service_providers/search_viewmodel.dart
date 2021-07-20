import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/service/search_service/search_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewmodel extends ChangeNotifier {
  int index;
  bool isOpen = false;
  bool isShown = false;
  String filterValue;
  bool _loading;
  String searchValue;
  int tagCurrentInde;

  get value => filterValue;
  set value(value) {
    filterValue = value;
    notifyListeners();
  }

  get current => tagCurrentInde;
  set current(value) {
    tagCurrentInde = value;
    filterValue = list[value][0];
    notifyListeners();
  }

  get open => isOpen;
  set open(value) {
    isOpen = value;
    notifyListeners();
  }

  get loading => _loading;
  set loading(value) {
    _loading = value;
    notifyListeners();
  }

  get show => isShown;
  set show(value) {
    isShown = value;
    notifyListeners();
  }

  void setVisiblity(value) {
    isOpen = value;
    notifyListeners();
  }

  SearchService get rest => dependency();

  Future<List<User>> getUsers() async {
    loading = true;
    final users = rest.getUsers(name: searchValue);

    return users;
  }

  List tags = ["Type", "Location", "Rate", "Payment"];
  List list = [
    [
      "Home Maintenance",
      'Home Improvment',
      'Cleaning & Disinfection',
      'Lessons',
      'Wellness',
      'Business',
      'Events & Weddings',
      'Tech & Repair',
      'Personal & Family',
      'Legal',
      'Design & Web',
    ],
    ["Johor Bahru", "Kuala Lampur", "Penang"],
    ["5", "4", "3", "2", "1"],
    ["Cahs", "Credit Card"]
  ];
}
