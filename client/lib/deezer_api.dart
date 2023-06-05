import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:party/models/song.dart';

class DeezerApi {
  final String clientId;
  final String clientSecret;
  final String redirectUri;

  DeezerApi({
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
  });

  Future<String> getAccessToken(String code) async {
    final response = await http.post(
      Uri.parse('https://connect.deezer.com/oauth/access_token.php'),
      body: {
        'app_id': clientId,
        'secret': clientSecret,
        'code': code,
        'output': 'json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  Future<List<Song>> searchSongs(String query) async {
    var response = await http.get(
      Uri.parse('https://api.deezer.com/search?q=$query'),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var items = data['data'] as List;
      return items.map((item) => Song.fromJson(item)).toList();
    } else {
      throw Exception('Failed to search songs');
    }
  }
}
