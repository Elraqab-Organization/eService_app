class User {
  int userId;
  String name;
  String email;
  String password;
  String phone;
  String type;
  String token;
  String renewalToken;

  User(
      {this.userId,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.type,
      this.token,
      this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        password: responseData['password'],
        phone: responseData['phone'],
        type: responseData['type'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']);
  }

  // user to json

  Map<String, dynamic> toJson() => {
        'id': userId,
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'type': type,
        'token': token,
        'renewalToken': renewalToken,
      };

  User.copy(User from)
      : this(
            userId: from.userId,
            name: from.name,
            email: from.email,
            password: from.password,
            phone: from.phone,
            type: from.type,
            token: from.token,
            renewalToken: from.renewalToken);
}
