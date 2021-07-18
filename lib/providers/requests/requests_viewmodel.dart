import 'package:e_service_app/model/request.dart';
import 'package:flutter/cupertino.dart';

class RequestViewmodel extends ChangeNotifier {
  List<Request> requests;

  Future<List<Request>> getRequest() async {
    return requests;
  }

  Future<bool> updateRequest() async {
    bool status;
    return status;
  }
}
