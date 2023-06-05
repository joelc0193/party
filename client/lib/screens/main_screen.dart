import 'package:flutter/material.dart';
import 'create_party_screen.dart';
import 'join_party_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Party App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Create a Party'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePartyScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Join a Party'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JoinPartyScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
