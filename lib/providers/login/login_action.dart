import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginViewmodel());


// final postsList = FutureProvider.autoDispose<User>((ref) async {
//   final postsList = ref.read(loginProvider);

//   return postsList.authenticate();
// });
