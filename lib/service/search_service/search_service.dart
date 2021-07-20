import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';

import '../rest_service.dart';

class SearchService {
  RestService get rest => dependency();

  Future<List<User>> getUsers({String name}) async {
    final List jsonPosts = await rest.get('users/');
    if (jsonPosts == null || jsonPosts.length == 0) return null;

    final requestList = jsonPosts.map((doc) => User.fromJson(doc)).toList();

    final users =
        requestList.where((item) => item.firstName.startsWith(name)).toList();

    return users;
  }
}
