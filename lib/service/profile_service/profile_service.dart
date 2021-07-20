import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/service/rest_service.dart';

class ProfileService {
  RestService get rest => dependency();

  Future<User> updateUser({user, id}) async {
    final json = await rest.patch('users/$id', data: user);
    return User.fromJson(json);
  }

  Future<void> removeUser({user}) async {
    await rest.delete('users/${user.id}');
  }
}
