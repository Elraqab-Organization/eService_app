import 'package:e_service_app/providers/register/registeration_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider =
    ChangeNotifierProvider((ref) => RegisterationViewmodel());
