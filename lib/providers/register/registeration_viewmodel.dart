import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/service/auth_service/auth_service.dart';
import 'package:flutter/cupertino.dart';

class RegisterationViewmodel extends ChangeNotifier {
  AuthService get _service => dependency();
  LoginViewmodel get _userSession => dependency();
  User _user = User();
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _selected;
  String _repeatedPassword;
  bool _loading = false;
  bool _error = false;
  bool _isServiceProvider = false;

  get user => _user;
  set user(value) => _user = value;

  get selected => _selected;
  set selected(value) => _selected = value;

  get error => _error;
  set error(value) {
    _error = value;
    notifyListeners();
  }

  get loading => _loading;
  set loading(value) {
    _loading = value;
    notifyListeners();
  }

  get firstName => _firstName;
  set firstName(value) => _firstName = value;

  get lastName => _lastName;
  set lastName(value) => _lastName = value;

  get email => _email;
  set email(value) => _email = value;

  get password => _password;
  set password(value) => _password = value;

  get repeatedPassword => _repeatedPassword;
  set repeatedPassword(value) => _repeatedPassword = value;

  get isServiceProvider => _isServiceProvider;
  set isServiceProvider(value) => _isServiceProvider = value;

  Future registerUser() async {
    loading = true;

    Map<String, dynamic> data = {
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "email": email,
      "isServiceProvider": isServiceProvider,
      "jobName": selected,
    };

    _userSession.user = await _service.registerUser(data: data);

    if (_userSession.user == null) {
      error = true;
      loading = false;
    } else {
      loading = false;
      error = false;
    }
  }
}
