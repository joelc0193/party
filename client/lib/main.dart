import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // Make sure to use the correct path

void main() {
  runApp(const PartyApp());
}

class PartyApp extends StatelessWidget {
  const PartyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
