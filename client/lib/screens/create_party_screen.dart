import 'package:flutter/material.dart';
import '../models/party.dart';
import 'party_screen.dart';

class CreatePartyScreen extends StatefulWidget {
  @override
  CreatePartyScreenState createState() => CreatePartyScreenState();
}

class CreatePartyScreenState extends State<CreatePartyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _partyName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Party'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Party Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name for the party';
                }
                return null;
              },
              onSaved: (value) {
                _partyName = value!;
              },
            ),
            ElevatedButton(
              child: Text('Create Party'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PartyScreen(
                        party: Party(
                          id: 'placeholder_id', // Replace with the actual party id
                          name: _partyName,
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
