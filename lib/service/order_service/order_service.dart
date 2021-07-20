import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/order.dart';
import '../rest_service.dart';

class OrderService {
  RestService get rest => dependency();

  Future<List<Order>> getOrders(id, isServiceProvider) async {
    print(id);
    print(isServiceProvider);
    final List json = await rest.get('orders/?type=$isServiceProvider&id=$id');
    if (json == null || json.length == 0) return null;

    final order = json.map((doc) => Order.fromJson(doc)).toList();

    return order;
  }

  Future<Order> markAsDone(id) async {
    final order = await rest.patch('orders/$id', data: {'status': "Done"});

    if (order == null) return null;

    final req = Order.fromJson(order);

    return req;
  }
}
