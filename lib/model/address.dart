class Address {
  String id;
  String name;
  String description;
  String lat;
  String long;

  Address({
    this.name,
    this.description,
    this.lat,
    this.long,
    this.id,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      lat: json['lat'],
      long: json['long'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'lat': lat,
        'long': long,
      };
}
