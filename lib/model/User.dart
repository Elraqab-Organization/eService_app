import 'package:e_service_app/model/address.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String imgSrc;
  String email;
  String password;
  String gender;
  String city;
  String country;
  String phoneNumber;
  String postalCode;
  String long;
  String jobName;
  String lat;
  String displayLanguage;
  List<Address> address;
  String token;
  int diagnosingFees;
  bool isServiceProvider;
  bool isCashPaymentActive;
  // List<bool> notificationSettings;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.imgSrc,
    this.email,
    this.password,
    this.gender,
    this.city,
    this.country,
    this.phoneNumber,
    this.postalCode,
    this.long,
    this.lat,
    this.address,
    this.diagnosingFees,
    this.displayLanguage,
    this.token,
    this.isServiceProvider,
    this.isCashPaymentActive,
    this.jobName,
    // this.notificationSettings,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'] == null ? "" : json['id'],
            firstName: json['firstName'] == null ? "" : json['firstName'],
            lastName: json['lastName'] == null ? "" : json['lastName'],
            imgSrc: json['imgSrc'] == null ? "" : json['imgSrc'],
            email: json['email'] == null ? "" : json['email'],
            diagnosingFees:
                json['diagnosingFees'] == null ? 0 : json['diagnosingFees'],
            password: json['password'] == null ? "" : json['password'],
            gender: json['gender'] == null ? "" : json['gender'],
            city: json['city'] == null ? "" : json['city'],
            country: json['country'] == null ? "" : json['country'],
            phoneNumber: json['phoneNumber'] == null ? "" : json['phoneNumber'],
            postalCode: json['postalCode'] == null ? "" : json['postalCode'],
            long: json['long'] == null ? "" : json['long'],
            lat: json['lat'] == null ? "" : json['lat'],
            jobName: json['jobName'] == null ? "" : json['jobName'],
            displayLanguage:
                json['displayLanguage'] == null ? "" : json['displayLanguage'],
            token: json['token'] == null ? "" : json['token'],
            isServiceProvider: json['isServiceProvider'] == null
                ? false
                : json['isServiceProvider'],
            isCashPaymentActive: json['isCashPaymentActive'] == null
                ? false
                : json['isCashPaymentActive'],
            address: json['address'] == null
                ? null
                // : List<Address>.from(json["address"].map((x) => x)),
                : (json['address'] as List)
                    .map((e) => Address.fromJson(e))
                    .toList()
            // notificationSettings: json['notificationSettings'],
            );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'imgSrc': imgSrc,
        'email': email,
        'password': password,
        'gender': gender,
        'city': city,
        'phoneNumber': phoneNumber,
        'postalCode': postalCode,
        'lag': long,
        'lat': lat,
        'jobName': jobName,
        'diagnosingFees': diagnosingFees,
        'displayLanguage': displayLanguage,
        'token': token,
        'isServiceProvider': isServiceProvider,
        'isCashPaymentActive': isCashPaymentActive,
        // 'notificationSettings': notificationSettings,
      };
}
