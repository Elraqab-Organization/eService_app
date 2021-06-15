import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/User.dart';

import '../rest_service.dart';

class AuthService {
  RestService get rest => dependency();

  Future<User> authenticate({String login, String password}) async {
    final List json = await rest.get('users?login=$login&&password=$password');
    if (json == null || json.length == 0) return null;

    final _user = User.fromJson(json[0]);
    return _user;
  }
}
