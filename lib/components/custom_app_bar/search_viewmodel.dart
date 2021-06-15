import 'package:e_service_app/model/filter_tags.dart';
import 'package:e_service_app/screens/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewmodel extends Viewmodel {
  double height = 160;
  bool isOpen = false;
  bool isShown = false;
  int tagCurrentIndex;

  get tag => tagCurrentIndex;
  set tag(value) {
    turnBusy();
    tagCurrentIndex = value;
    turnIdle();
  }

  get shown => isShown;
  set shown(value) {
    turnBusy();
    isShown = value;
    turnIdle();
  }

  get state => isOpen;
  set state(value) {
    turnBusy();
    isOpen = value;
    print(value);
    turnIdle();
  }

  List<Tag> filterTags = [
    Tag(
      "Type",
      ["Elictrical", "Mechanical"],
      "Mechanical",
      Icon(FontAwesomeIcons.list, size: 30, color: Colors.white),
    ),
    Tag(
      "Location",
      ["Johor Bahru", "Kuala lampur"],
      "Johor Bahru",
      Icon(FontAwesomeIcons.locationArrow, size: 30, color: Colors.white),
    ),
    Tag(
      "Rate",
      ["5", "4", "3", "2", "1"],
      "5",
      Icon(FontAwesomeIcons.star, size: 30, color: Colors.white),
    ),
    Tag(
      "Payment",
      ["Cash", "Credit Card"],
      "Cash",
      Icon(FontAwesomeIcons.moneyCheck, size: 30, color: Colors.white),
    )
  ];
}
