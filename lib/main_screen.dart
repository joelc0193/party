import 'package:flutter/material.dart';

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
                // Navigate to the Create Party screen
              },
            ),
            ElevatedButton(
              child: Text('Join a Party'),
              onPressed: () {
                // Navigate to the Join Party screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
