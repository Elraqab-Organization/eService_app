class Order {
  String id;
  String customerId;
  String serviceProviderId;
  String postId;
  String feedbackId;
  String status;
  String problemDescription;
  String serviceDescription;
  double diagnosingFees;
  double serviceFees;
  String paymentMethod;
  DateTime provisionDate;
  DateTime responseTime;
  List<String> steps;

  Order({
    this.id,
    this.customerId,
    this.serviceProviderId,
    this.postId,
    this.feedbackId,
    this.status,
    this.problemDescription,
    this.serviceDescription,
    this.diagnosingFees,
    this.serviceFees,
    this.paymentMethod,
    this.provisionDate,
    this.responseTime,
    this.steps,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerId: json['customerId'],
      serviceProviderId: json['serviceProviderId'],
      postId: json['postId'],
      feedbackId: json['feedbackId'],
      status: json['status'],
      problemDescription: json['problemDescription'],
      serviceDescription: json['serviceDescription'],
      diagnosingFees: json['diagnosingFees'],
      serviceFees: json['serviceFees'],
      paymentMethod: json['paymentMethod'],
      provisionDate: json['provisionDate'],
      responseTime: json['responseTime'],
      steps: json['steps'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customerId': customerId,
        'serviceProviderId': serviceProviderId,
        'postId': postId,
        'feedbackId': feedbackId,
        'status': status,
        'problemDescription': problemDescription,
        'serviceDescription': serviceDescription,
        'diagnosingFees': diagnosingFees,
        'serviceFees': serviceFees,
        'paymentMethod': paymentMethod,
        'provisionDate': provisionDate,
        'responseTime': responseTime,
        'steps': steps,
      };
}
