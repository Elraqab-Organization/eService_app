import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/request.dart';
import '../rest_service.dart';

class RequestsService {
  RestService get rest => dependency();

  Future<List<RequestModel>> getRequestsList(id, isServiceProvider) async {
    print(id);
    print(isServiceProvider);
    final json = await rest.get('requests/?type=$isServiceProvider&id=$id');
    if (json == null || json.length == 0) return null;

    final order = json.map((doc) => RequestModel.fromJson(doc)).toList();

    return order;
  }

  Future<RequestModel> makeRequest(data) async {
    final json = await rest.post('requests/create', data);
    if (json == null || json.length == 0) return null;

    final request = RequestModel.fromJson(json);

    return request;
  }
}
