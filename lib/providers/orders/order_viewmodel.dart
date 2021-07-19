import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/order.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/service/order_service/order_service.dart';
import 'package:flutter/cupertino.dart';

class OrderViewmodel extends ChangeNotifier {
  LoginViewmodel get _userSession => dependency();
  OrderService get rest => dependency();

  List<Order> orders;

  bool _loading = false;
  bool _message = false;
  String _res;

  get message => _message;
  set message(value) {
    _message = value;
    notifyListeners();
  }

  get res => _res;
  set res(value) {
    _res = value;
    notifyListeners();
  }

  get loading => _loading;
  set loading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<List<Order>> getOrders() async {
    orders = await rest.getOrders(_userSession.user.id, "false");

    return orders;
  }
}
