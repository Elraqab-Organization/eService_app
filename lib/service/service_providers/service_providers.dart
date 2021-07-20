import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import '../rest_service.dart';

class ServiceProviderService {
  RestService get rest => dependency();

  Future<List<User>> getServices({String id}) async {
    final List json = await rest.get('users');
    if (json == null || json.length == 0) return null;

    final services = json.map((doc) => User.fromJson(doc)).toList();

    final users =
        services.where((element) => element.isServiceProvider == true).toList();
    return users;
  }
}
