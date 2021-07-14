import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginViewmodel());

// final authenticate = FutureProvider<User>((ref) async {
//   final repository = ref.read(loginProvider);

//   return repository.authenticate();
// });
