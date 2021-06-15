import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/User.dart';
import 'package:e_service_app/screens/viewmodel.dart';
import 'package:e_service_app/service/auth_service/auth_service.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();

  User _user = User();
  bool _showErrorMassage = false;
  bool isChecked = false;

  get user => _user;
  set user(value) => _user = value;

  get password => _user.password;
  set password(value) => _user.password = value;

  get username => _user.email;
  set username(value) => _user.email = value;

  get showErrorMessage => _showErrorMassage;
  set showErrorMessage(value) => _showErrorMassage = value;

  void setCheckedBox(bool isCheckedValue) {
    isChecked = isCheckedValue;
    notifyListeners();
  }

  Future<User> authenticate() async {
    turnBusy();
    final User _user =
        await _service.authenticate(login: username, password: password);
    if (_user == null) {
      _showErrorMassage = true;
      turnIdle();
    }
    return _user;
  }
}
