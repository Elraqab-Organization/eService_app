class Address {
  String id;
  String userId;
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
    this.userId,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      description: json['description'],
      lat: json['lat'],
      long: json['long'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'description': description,
        'lat': lat,
        'long': long,
      };
}
