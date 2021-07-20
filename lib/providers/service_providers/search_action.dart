import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/user.dart';
import 'package:e_service_app/providers/service_providers/search_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

SearchViewmodel get _service => dependency();

final searchProvider = ChangeNotifierProvider((ref) => _service);
final searchResult = FutureProvider.autoDispose<List<User>>((ref) async {
  final list = ref.watch(searchProvider);

  final data = list.getUsers();

  return data;
});
