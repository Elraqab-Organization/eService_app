import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  final String _baseUrl;
  const RestService({baseUrl}) : _baseUrl = baseUrl;

  // Send a GET request to retrieve data from a REST server
  Future get(dynamic endpoint) async {
    // final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    final response = await http.post(
      Uri.parse('$_baseUrl/users/login/auth'),
      body: json.encode(endpoint),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
