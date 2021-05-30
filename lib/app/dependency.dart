import 'package:e_service_app/service/auth_service/auth_service.dart';
import 'package:e_service_app/service/rest_service.dart';
import 'package:get_it/get_it.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(
    () => RestService(),
  );
  service.registerLazySingleton(
    () => AuthService(),
  );
}
