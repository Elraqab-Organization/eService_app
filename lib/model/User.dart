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
  String lat;
  String displayLanguage;
  String token;
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
    this.displayLanguage,
    this.token,
    this.isServiceProvider,
    this.isCashPaymentActive,
    // this.notificationSettings,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          firstName: json['firstName'],
          lastName: json['lastName'],
          imgSrc: json['imgSrc'],
          email: json['email'],
          password: json['password'],
          gender: json['gender'],
          city: json['city'],
          country: json['country'],
          phoneNumber: json['phoneNumber'],
          postalCode: json['postalCode'],
          long: json['long'],
          lat: json['lat'],
          displayLanguage: json['displayLanguage'],
          token: json['token'],
          isServiceProvider: json['isServiceProvider'],
          isCashPaymentActive: json['isCashPaymentActive'],
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
        'displayLanguage': displayLanguage,
        'token': token,
        'isServiceProvider': isServiceProvider,
        'isCashPaymentActive': isCashPaymentActive,
        // 'notificationSettings': notificationSettings,
      };
}
