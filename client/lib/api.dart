import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'http://localhost:3000';

  static Future<void> createParty(String partyName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/party'),
      body: {'partyName': partyName},
    );

    if (response.statusCode == 200) {
      print('Party created: ${response.body}');
    } else {
      throw Exception('Failed to create party');
    }
  }

  // TODO: Add other API functions here
}
