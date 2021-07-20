import 'package:e_service_app/model/user.dart';

class Order {
  String id;
  String customerId;
  String serviceProviderId;
  String postId;
  String feedbackId;
  String status;
  String problemDescription;
  String serviceDescription;
  int diagnosingFees;
  int serviceFees;
  String paymentMethod;
  String location;
  String provisionDate;
  String responseTime;
  String feedback;
  int rate;
  User customer;
  User serviceProvider;
  bool isFeedbackGiven;
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
    this.location,
    this.isFeedbackGiven,
    this.feedback,
    this.rate,
    this.provisionDate,
    this.responseTime,
    this.steps,
    this.customer,
    this.serviceProvider,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      customerId: json['customerId'],
      serviceProviderId: json['serviceProviderId'],
      postId: json['postId'],
      feedbackId: json['feedbackId'],
      status: json['status'],
      feedback: json['feedback'],
      rate: json['rate'],
      isFeedbackGiven: json['isFeedbackGiven'],
      problemDescription: json['problemDescription'],
      serviceDescription: json['serviceDescription'],
      diagnosingFees: json['diagnosingFees'],
      serviceFees: json['serviceFees'],
      paymentMethod: json['paymentMethod'],
      provisionDate: json['provisionDate'],
      responseTime: json['responseTime'],
      location: json['location'],
      steps: List<String>.from(json["steps"].map((x) => x)),
      customer:
          json['customer'] != null ? new User.fromJson(json['customer']) : null,
      serviceProvider: json['serviceProvider'] != null
          ? new User.fromJson(json['serviceProvider'])
          : null,
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
