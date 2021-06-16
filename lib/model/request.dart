class Request {
  String id;
  String customerId;
  String serviceProviderId;
  String description;
  double fees;

  Request({
    this.description,
    this.id,
    this.customerId,
    this.serviceProviderId,
    this.fees,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      description: json['description'],
      id: json['id'],
      customerId: json['customerId'],
      serviceProviderId: json['serviceProviderId'],
      fees: json['fees'],
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'customerId': customerId,
        'serviceProviderId': serviceProviderId,
        'fees': fees,
      };
}
