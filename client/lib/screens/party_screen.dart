import 'package:flutter/material.dart';
import '../models/party.dart';
import '../models/song.dart';

class PartyScreen extends StatefulWidget {
  final Party party;

  PartyScreen({required this.party});

  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  List<Song> songs = [
    Song(id: '1', title: 'Song 1', artist: 'Artist 1'),
    Song(id: '2', title: 'Song 2', artist: 'Artist 2'),
    // Add more songs here...
  ];

  List<Song> searchSongs(String query) {
    return songs.where((song) {
      return !song.nominated &&
          (song.title.toLowerCase().contains(query.toLowerCase()) ||
              song.artist.toLowerCase().contains(query.toLowerCase()));
    }).toList();
  }

  String searchQuery = '';
  List<Song> searchResults = [];

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      // TODO: Update searchResults based on the new query
    });
  }

  void nominateSong(Song song) {
    setState(() {
      song.nominated = true;
    });
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
                trailing: ElevatedButton(
                  child: Text('Nominate'),
                  onPressed: () => nominateSong(searchResults[index]),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
