import 'package:flutter/material.dart';
import '../models/party.dart';
import '../models/song.dart';

class PartyScreen extends StatelessWidget {
  final Party party;

  PartyScreen({required this.party});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(party.name),
      ),
      body: ListView.builder(
        itemCount: party.songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(party.songs[index].title),
            subtitle: Text(party.songs[index].artist),
            trailing: Text('${party.songs[index].votes} votes'),
            onTap: () {
              // Increment the vote count for the song
            },
          );
        },
      ),
    );
  }
}
