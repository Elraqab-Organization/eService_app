import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/request.dart';
import '../rest_service.dart';

class RequestService {
  RestService get rest => dependency();

  Future<Request> makeRequest(data) async {
    final json = await rest.post('requests/create', data);
    if (json == null || json.length == 0) return null;

    final request = Request.fromJson(json);

    return request;
  }
}
