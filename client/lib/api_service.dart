import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:party/models/song.dart';

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
      print('Party created successfully');
    } else {
      throw Exception('Failed to create party');
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
