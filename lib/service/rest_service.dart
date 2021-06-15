import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  final String _baseUrl;
  const RestService({baseUrl}) : _baseUrl = baseUrl;

  // Send a GET request to retrieve data from a REST server
  Future get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }
}
