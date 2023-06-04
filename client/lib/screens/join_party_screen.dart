import 'package:flutter/material.dart';

import '../models/party.dart';
import 'party_screen.dart';

class JoinPartyScreen extends StatefulWidget {
  @override
  JoinPartyScreenState createState() => JoinPartyScreenState();
}

class JoinPartyScreenState extends State<JoinPartyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _partyId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join a Party'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Party ID'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the party ID';
                }
                return null;
              },
              onSaved: (value) {
                _partyId = value!;
              },
            ),
            ElevatedButton(
              child: Text('Join Party'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PartyScreen(
                        party: Party(
                          id: _partyId,
                          name:
                              'Party Name', // Replace with the actual party name
                          owner:
                              'Owner Name', // Replace with the actual owner name
                          songs: [], // Replace with the actual list of songs
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
