class Post {
  String id;
  String customerId;
  String description;
  // two attributes to be changed later.
  String timestamp;
  List<dynamic> tag;

  Post({
    this.id,
    this.customerId,
    this.timestamp,
    this.description,
    this.tag,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      customerId: json['customerId'],
      timestamp: json['timestamp'],
      description: json['description'],
      tag: json['tag'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'customerId': customerId,
        'timestamp': timestamp,
        'description': description,
        'tag': tag,
      };
}
