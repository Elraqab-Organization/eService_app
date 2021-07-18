import 'package:e_service_app/model/request.dart';
import 'package:flutter/cupertino.dart';

class RequestViewmodel extends ChangeNotifier {
  List<Request> requests;
  bool _loading = false;

  get loading => _loading;
  set loading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<List<Request>> getRequest() async {
    return requests;
  }

  Future<bool> updateRequest() async {
    bool status;
    return status;
  }

  Future makeRequest(Map<String, dynamic> data) async {
    loading = true;

    Future.delayed(Duration(seconds: 1), () => {loading = false});
  }
}
