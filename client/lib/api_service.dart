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
      // If the server returns a 200 OK response, then parse the JSON.
      print('Party created successfully');
    } else {
      // If the server returns an unexpected response, then throw an exception.
      throw Exception('Failed to create party');
    }
  }
  Future<List<Song>> searchSongs(String query) async {
    // Make a GET request to the Deezer API
    var response = await http.get(
      Uri.parse('https://api.deezer.com/search?q=$query'),
    );

    // If the request was successful, parse the songs from the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var items = data['data'] as List;
      return items.map((item) => Song.fromJson(item)).toList();
    } else {
      // If the request was not successful, throw an error
      throw Exception('Failed to search songs');
    }
  }
}
