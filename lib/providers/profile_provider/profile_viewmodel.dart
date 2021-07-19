import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/service/profile_service/profile_service.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewmodel extends ChangeNotifier {
  List<User> profileInfo;
  ProfileService get _service => dependency();

  get posts => profileInfo;
  set posts(profileInfo) => profileInfo = profileInfo;

  LoginViewmodel get _userSession => dependency();
  User _user = User();
  String _firstName;
  String _lastName;
  String _gender;
  String _phoneNumber;
  String _email;
  String _selected;
  bool _loading = false;
  bool _error = false;

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

  get gender => _gender;
  set gender(value) => _gender = value;

  get phoneNumber => _phoneNumber;
  set phoneNumber(value) => _phoneNumber = value;

  Future updateProfile() async {
    loading = true;

    Map<String, dynamic> data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "gender": gender,
      "phoneNumber": phoneNumber,
    };

    _userSession.user = await _service.updateUser(user: data);
  }
}
