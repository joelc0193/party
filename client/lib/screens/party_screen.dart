import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:party/api_service.dart';

import '../models/party.dart';
import '../models/song.dart';

class PartyScreen extends StatefulWidget {
  final Party party;

  PartyScreen({required this.party});

  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  final ApiService apiService = ApiService();
  List<Song> songs = [
    Song(id: '1', title: 'Song 1', artist: 'Artist 1'),
    Song(id: '2', title: 'Song 2', artist: 'Artist 2'),
    // Add more songs here...
  ];

  Future<List<Song>> searchSongs(String query) async {
    final response = await http.get(
      Uri.parse('https://api.deezer.com/search?q=$query'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.
      final data = jsonDecode(response.body);
      final List<Song> songs = [];
      for (var item in data['data']) {
        songs.add(Song.fromJson(item));
      }
      return songs;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load songs');
    }
  }

  String searchQuery = '';
  List<Song> searchResults = [];

  void updateSearchQuery(String newQuery) async {
    setState(() {
      searchQuery = newQuery;
    });
    searchResults = await apiService.searchSongs(newQuery);
  }

  void nominateSong(Song song) {
    setState(() {
      song.nominated = true;
    });
  }

  void voteForSong(Song song) {
    setState(() {
      song.votes++;
    });
  }

  Timer? songTimer;
  Song? currentSong;
  Duration songDuration = Duration.zero;
  Duration elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Initialize songDuration and elapsedTime
    songDuration = Duration(minutes: 3); // Assume a 3-minute song for now
    elapsedTime = Duration.zero;

    // Start the song timer
    startSongTimer();
  }

  void startSongTimer() {
    songTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime += Duration(seconds: 1);

        if (elapsedTime.inSeconds >= (songDuration.inSeconds / 2) &&
            elapsedTime.inSeconds < (songDuration.inSeconds * 3 / 4)) {
          // Open nomination period
          // TODO: Change the state of the app to indicate that the nomination period is open
        } else if (elapsedTime.inSeconds >= (songDuration.inSeconds * 3 / 4)) {
          // Close nomination period and open voting period
          // TODO: Change the state of the app to indicate that the voting period is open
        } else if (elapsedTime >= songDuration) {
          // Close voting period and determine next song
          timer.cancel();
          determineNextSong();
        }
      });
    });
  }

  void determineNextSong() {
    // Sort the songs in descending order of votes
    songs.sort((a, b) => b.votes.compareTo(a.votes));

    // The next song is the one with the most votes
    currentSong = songs[0];

    // Reset votes for all songs
    for (var song in songs) {
      song.votes = 0;
    }

    // Reset elapsedTime
    elapsedTime = Duration.zero;

    // Start the song timer again
    startSongTimer();
  }

  @override
  void dispose() {
    songTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.party.name),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: updateSearchQuery,
            decoration: InputDecoration(
              labelText: 'Search for songs',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index].title),
                  subtitle: Text(searchResults[index].artist),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('Nominate'),
                        onPressed: () {
                          if (elapsedTime.inSeconds >=
                                  (songDuration.inSeconds / 2) &&
                              elapsedTime.inSeconds <
                                  (songDuration.inSeconds * 3 / 4)) {
                            nominateSong(searchResults[index]);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Nominations are closed.'),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        child: Text('Vote'),
                        onPressed: () {
                          if (elapsedTime.inSeconds >=
                              (songDuration.inSeconds * 3 / 4)) {
                            voteForSong(searchResults[index]);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Voting has not started yet.'),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
