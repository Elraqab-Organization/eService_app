import 'package:e_service_app/service/auth_service/auth_service.dart';
import 'package:e_service_app/service/rest_service.dart';
import 'package:get_it/get_it.dart';

GetIt dependency = GetIt.instance;

void init() {
  // dependency.registerLazySingleton(
  //   () => RestService(),
  // );
  // dependency.registerLazySingleton(
  //   () => AuthService(),
  // );
  // Services
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'http://192.168.1.38:3000'),
  );

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency.registerLazySingleton<AuthService>(() => AuthService());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());

  // Viewmodels
  // dependency.registerLazySingleton(() => UserViewmodel());
}
