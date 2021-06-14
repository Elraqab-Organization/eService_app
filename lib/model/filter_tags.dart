class Tag {
  String name;
  List<String> values = [];
  String selected;
  Tag(this.name, this.values, this.selected, );
}

List<Tag> filterTags = [
  Tag("Type", ["Elictrical", "Mechanical"], "Elictrical"),
  Tag("Location", ["Johor Bahru", "Kuala lampur"], "Johor Bahru"),
  Tag("Rate", ["5", "4", "3", "2", "2"], "5"),
  Tag("Payment", ["Cash", "Credit Card"], "Cash")
];
