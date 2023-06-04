import 'package:flutter/material.dart';
import 'package:party/api.dart';
import 'package:party/models/party.dart';
import 'package:party/models/song.dart';

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
            onTap: () async {
              try {
                // Replace 'partyId' and 'songId' with the actual IDs
                await Api.voteForSong(party.id, party.songs[index].id);
              } catch (e) {
                // Handle the error
                print('Failed to vote for song: $e');
              }
            },
          );
        },
      ),
    );
  }
}
