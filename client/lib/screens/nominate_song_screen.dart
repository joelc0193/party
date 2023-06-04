import 'package:flutter/material.dart';

class NominateSongScreen extends StatefulWidget {
  @override
  _NominateSongScreenState createState() => _NominateSongScreenState();
}

class _NominateSongScreenState extends State<NominateSongScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nominate a Song'),
      ),
      body: Center(
        child: Text('Nominate a Song'),
      ),
    );
  }
}
