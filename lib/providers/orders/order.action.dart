import 'package:e_service_app/model/order.dart';
import 'package:e_service_app/providers/orders/order_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = ChangeNotifierProvider((ref) => OrderViewmodel());

final ordersListProvider =
    FutureProvider.autoDispose<List<Order>>((ref) async {
  final list = ref.read(orderProvider);

  final data = list.getOrders();

  return data;
});
