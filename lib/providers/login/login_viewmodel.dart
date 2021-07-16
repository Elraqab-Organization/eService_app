import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/service/auth_service/auth_service.dart';
import 'package:flutter/cupertino.dart';

class LoginViewmodel extends ChangeNotifier {
  AuthService get _service => dependency();
  LoginViewmodel get _userSession => dependency();

  User _user = User();
  bool _showErrorMassage = false;
  bool isChecked = false;
  bool isLoading = false;
  bool isLogged;
  String pass;
  String email;

  get loading => isLoading;
  set loading(value) {
    isLoading = value;
    notifyListeners();
  }

  get user => _user;
  set user(value) => {
        _user = value,
      };

  get password => pass;
  set password(value) => pass = value;

  get username => email;
  set username(value) => email = value;

  get showErrorMessage => _showErrorMassage;
  set showErrorMessage(value) {
    _showErrorMassage = value;
    notifyListeners();
  }

  void setCheckedBox(bool isCheckedValue) {
    isChecked = isCheckedValue;
    notifyListeners();
  }

  Future authenticate() async {
    loading = true;

    _userSession.user =
        await _service.authenticate(login: username, password: password);

    if (_userSession.user == null) {
      showErrorMessage = true;
      loading = false;
    } else {
      showErrorMessage = false;
      loading = false;
    }
  }
}
