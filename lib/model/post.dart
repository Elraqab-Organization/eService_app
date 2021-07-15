import 'dart:convert';

Post welcomeFromJson(String str) => Post.fromJson(json.decode(str));

String welcomeToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.id,
    this.imgSrc,
    this.tags,
    this.customerId,
    this.proposal,
    this.location,
    this.paymentMethod,
    this.cancelationFee,
    this.description,
    this.username,
    this.timestamp,
  });

  String id;
  String imgSrc;
  List<String> tags;
  String customerId;
  List<String> proposal;
  String location;
  String paymentMethod;
  String cancelationFee;
  String description;
  String username;
  DateTime timestamp;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        imgSrc: json["imgSrc"] == null
            ? "https://randomuser.me/api/portraits/men/52.jpg"
            : json["imgSrc"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        customerId: json["customerId"],
        proposal: List<String>.from(json["proposal"].map((x) => x)),
        location: json["location"],
        paymentMethod: json["paymentMethod"],
        cancelationFee: json["cancelationFee"],
        description: json["description"],
        username: json["username"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imgSrc": imgSrc,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "customerId": customerId,
        "proposal": List<dynamic>.from(proposal.map((x) => x)),
        "location": location,
        "paymentMethod": paymentMethod,
        "cancelationFee": cancelationFee,
        "description": description,
        "username": username,
        "timestamp": timestamp.toIso8601String(),
      };
}
