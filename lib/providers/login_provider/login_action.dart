import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/providers/login_provider/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginViewmodel());

// final authenticate = FutureProvider<User>((ref) async {
//   final repository = ref.read(loginProvider);

//   return repository.authenticate();
// });
