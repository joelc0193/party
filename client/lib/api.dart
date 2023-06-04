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

  static Future<void> nominateSong(String partyId, String songId) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/party/$partyId/nominate'),
      body: {'songId': songId},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to nominate song');
    }
  }

  static Future<void> voteForSong(String partyId, String songId) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/party/$partyId/vote'),
      body: {'songId': songId},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to vote for song');
    }
  }
}
