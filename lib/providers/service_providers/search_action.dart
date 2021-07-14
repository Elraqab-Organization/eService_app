import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/providers/service_providers/search_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = ChangeNotifierProvider((ref) => SearchViewmodel());
