import 'package:flutter/cupertino.dart';

class Tag {
  String name;
  Icon icon;
  List<String> values = [];
  String selected;
  Tag(
    this.name,
    this.values,
    this.selected,
    this.icon,
  );
}
