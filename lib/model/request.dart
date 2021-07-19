import 'package:e_service_app/model/User.dart';

class RequestModel {
  String id;
  String customerId;
  String serviceProviderId;
  String location;
  String payment;
  String description;
  String status;
  int fees;
  String provisionDate;
  String time;
  User customer;
  User serviceProvider;

  RequestModel({
    this.id,
    this.customerId,
    this.serviceProviderId,
    this.location,
    this.payment,
    this.description,
    this.status,
    this.fees,
    this.provisionDate,
    this.time,
    this.customer,
    this.serviceProvider,
  });

  RequestModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    customerId = json['customerId'];
    serviceProviderId = json['serviceProviderId'];
    location = json['location'];
    payment = json['payment'];
    description = json['description'];
    status = json['status'];
    fees = json['fees'] != null ? json['fees'] : null;
    provisionDate = json['provisionDate'];
    time = json['time'];
    customer =
        json['customer'] != null ? new User.fromJson(json['customer']) : null;
    serviceProvider = json['serviceProvider'] != null
        ? new User.fromJson(json['serviceProvider'])
        : null;
  }
}
