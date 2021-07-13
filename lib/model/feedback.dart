class Feedback {
  String id;
  String custoemrId;
  String serviceProviderId;
  String orderId;
  String description;

  Feedback({
    this.id,
    this.custoemrId,
    this.serviceProviderId,
    this.orderId,
    this.description,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      id: json['id'],
      custoemrId: json['custoemrId'],
      serviceProviderId: json['serviceProviderId'],
      orderId: json['orderId'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'custoemrId': custoemrId,
        'serviceProviderId': serviceProviderId,
        'orderId': orderId,
        'description': description,
      };
}
