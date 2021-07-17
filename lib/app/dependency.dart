import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/service/auth_service/auth_service.dart';
import 'package:e_service_app/service/post_service/post_service.dart';
import 'package:e_service_app/service/rest_service.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

void init() {
  dependency.registerLazySingleton<RestService>(
    () => RestService(
        // baseUrl: 'https://service-backend-web.herokuapp.com'),
        // baseUrl: 'http://10.0.2.2:5000'),
        baseUrl: 'http://localhost:5000'),
  );

  dependency.registerLazySingleton<PostService>(() => PostService());
  dependency.registerLazySingleton<AuthService>(() => AuthService());

  // Viewmodels
  dependency.registerLazySingleton(() => LoginViewmodel());
}
