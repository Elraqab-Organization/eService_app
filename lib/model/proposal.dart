class Proposal {
  Proposal({
    this.id,
    this.status,
    this.description,
    this.steps,
    this.provisionDate,
    this.postId,
    this.customerId,
    this.serviceProviderId,
    this.diagnosisFee,
    this.post,
    this.customer,
    this.serviceProvider,
    this.timestamp,
  });

  String id;
  String status;
  String description;
  List<String> steps;
  String provisionDate;
  String postId;
  String customerId;
  String serviceProviderId;
  String diagnosisFee;
  ProposalPost post;
  Customer customer;
  Customer serviceProvider;
  DateTime timestamp;

  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        id: json["_id"],
        status: json["status"],
        description: json["description"],
        steps: List<String>.from(json["steps"].map((x) => x)),
        provisionDate: json["provisionDate"],
        postId: json["postId"],
        customerId: json["customerId"],
        serviceProviderId: json["serviceProviderId"],
        diagnosisFee: json["diagnosisFee"],
        post: ProposalPost.fromJson(json["post"]),
        customer: Customer.fromJson(json["customer"]),
        serviceProvider: Customer.fromJson(json["serviceProvider"]),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "description": description,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "provisionDate": provisionDate,
        "postId": postId,
        "customerId": customerId,
        "serviceProviderId": serviceProviderId,
        "diagnosisFee": diagnosisFee,
        "post": post.toJson(),
        "customer": customer.toJson(),
        "serviceProvider": serviceProvider.toJson(),
        "timestamp": timestamp.toIso8601String(),
      };
}

class Customer {
  Customer({
    this.firstName,
    this.lastName,
    this.imgSrc,
    this.id,
  });

  String firstName;
  String lastName;
  String imgSrc;
  String id;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        firstName: json["firstName"],
        lastName: json["lastName"],
        imgSrc: json["imgSrc"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "imgSrc": imgSrc,
        "_id": id,
      };
}

class ProposalPost {
  ProposalPost({
    this.id,
    this.location,
    this.paymentMethod,
    this.description,
  });

  String id;
  String location;
  String paymentMethod;
  String description;

  factory ProposalPost.fromJson(Map<String, dynamic> json) => ProposalPost(
        id: json["_id"],
        location: json["location"],
        paymentMethod: json["paymentMethod"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "location": location,
        "paymentMethod": paymentMethod,
        "description": description,
      };
}
