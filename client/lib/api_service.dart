import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "http://localhost:3000";

  Future<void> createParty(String partyName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/party'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'partyName': partyName,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then parse the JSON.
      print('Party created successfully');
    } else {
      // If the server returns an unexpected response, then throw an exception.
      throw Exception('Failed to create party');
    }
  }
}
