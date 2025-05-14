import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bildbearbeitung',
      home: Mintano(),
    );
  }
}


class Mintano extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text('Bildbearbeitung')), 
      body: Center( 
        child: Image.asset(
          'assets/gojo_zeigt_bg.png',
          width: 300,
        ), //Image.asset, Bild anzeigen 
      ), // Center, Inhalt 
    ); //Scafold, Layout 
  }
}
