import 'package:e_service_app/model/request.dart';
import 'package:e_service_app/providers/requests/requests_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final requestProvider = ChangeNotifierProvider((ref) => RequestViewmodel());
final requestList = FutureProvider.autoDispose<List<RequestModel>>((ref) async {
  final list = ref.read(requestProvider);

  final data = await list.getRequest();

  return data;
});

final updateRequestProvider = FutureProvider.autoDispose<bool>((ref) async {
  final status = ref.read(requestProvider);

  final data = status.updateRequest();
  return data;
});
