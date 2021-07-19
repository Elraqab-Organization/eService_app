import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/request.dart';
import 'package:e_service_app/providers/login/login_viewmodel.dart';
import 'package:e_service_app/screens/all_requests_screen/all_requests_screen.dart';
import 'package:e_service_app/service/request_service/request_service.dart';
import 'package:flutter/cupertino.dart';

class RequestViewmodel extends ChangeNotifier {
  List<Request> requests;
  bool _loading = false;
  bool _message = false;
  String _res;

  RequestsService get _service => dependency();
  LoginViewmodel get _userSession => dependency();

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

  Future<List<Request>> getRequest() async {
    requests =
        await _service.fetchRequests(id: _userSession.user.id, type: "false");

    return requests;
  }

  Future cancelRequest(id) async {}

  Future acceptRequest(id) async {

    
  }

  Future rejectRequest(id) async {}

  Future<List<Request>> getDashboardRequest() async {
    requests =
        await _service.fetchRequests(id: _userSession.user.id, type: "true");

    return requests;
  }

  Future<bool> updateRequest() async {
    bool status;
    return status;
  }

  pendingList() {
    final list = requests
        .where((element) => element.status.toLowerCase() == "pending")
        .toList();
    return list;
  }

  servedList() {
    final list = requests
        .where((element) => element.status.toLowerCase() == "accepted")
        .toList();
    return list;
  }

  Future makeRequest(Map data) async {
    loading = true;

    final request = _service.makeRequest(data);

    if (request == null) {
      res = "Failed to make request";
      loading = false;
      message = true;
    } else {
      res = "Succceed to make request";
      loading = false;
      message = true;
    }
  }
}
