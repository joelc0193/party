import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // Make sure to use the correct path

void main() {
  runApp(PartyApp());
}

class PartyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
