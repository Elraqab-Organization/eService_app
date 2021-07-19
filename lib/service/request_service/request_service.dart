import 'package:e_service_app/app/dependency.dart';
import 'package:e_service_app/model/request.dart';
import '../rest_service.dart';

class RequestsService {
  RestService get rest => dependency();

  Future<List<Request>> fetchRequests({String id, String type}) async {
    final List jsonPosts = await rest.getPosts('requests/?id=$id&type=$type');
    if (jsonPosts == null || jsonPosts.length == 0) return null;

    final requestList = jsonPosts.map((doc) => Request.fromJson(doc)).toList();

    return requestList;
  }

  Future<Request> makeRequest(data) async {
    final json = await rest.post('requests/create', data);
    if (json == null || json.length == 0) return null;

    final request = Request.fromJson(json);

    return request;
  }

  Future<Request> acceptRequest(id) async {}

  Future<Request> cancelRequest(id) async {}
  Future<Request> rejectRequest(id) async {}
}
