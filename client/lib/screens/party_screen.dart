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
  String searchQuery = '';
  List<Song> searchResults = [];

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      // TODO: Update searchResults based on the new query
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
                  trailing: Text('${searchResults[index].votes} votes'),
                  onTap: () {
                    // Increment the vote count for the song
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
