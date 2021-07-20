import 'package:e_service_app/model/request.dart';
import 'package:e_service_app/providers/requests/requests_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final requestProvider = ChangeNotifierProvider((ref) => RequestViewmodel());
final requestList = FutureProvider.autoDispose<List<Request>>((ref) async {
  final list = ref.watch(requestProvider);

  final data = list.getRequest();

  return data;
});

final dashboardRequestList =
    FutureProvider.autoDispose<List<Request>>((ref) async {
  final list = ref.watch(requestProvider);

  final data = list.getDashboardRequest();

  return data;
});

final updateRequestProvider = FutureProvider.autoDispose<bool>((ref) async {
  final status = ref.watch(requestProvider);

  final data = status.updateRequest();
  return data;
});
