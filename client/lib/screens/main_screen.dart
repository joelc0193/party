import 'package:flutter/material.dart';
import 'create_party_screen.dart';
import 'join_party_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Party App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Create a Party'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePartyScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Join a Party'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JoinPartyScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
