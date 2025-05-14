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
  child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
     // Button um das Bild zu bearbeiten      
  children: [
    ElevatedButton(
    onPressed: () {
      combineAndShow(context);
    },
    child: Text('Bild bearbeiten'), 
    ),
    SizedBox(height: 20),
      Text(
         'Klicke auf den Button, um das Bild mit Overlay und Wasserzeichen zu generieren.',
              textAlign: TextAlign.center,
            ), //Text
          ],
        ), Inhalt, Body 
      ), Center
    ); Scaffold, Layout 
}
}

// Das Overlay anzeigen lassen 
Future<img.Image?> loadOverlayImage() async {
  final ByteData data = rootBundle.load('assets/overlay.png');
  final Uint8List bytes = data.buffer.asUint8List();
  final img.Image? overlayImage = img.decodeImage(bytes);
  return overlayImage;
}


// Funktion die ein Overlay-Bild auf das Hauptbild zeichnet
img.Image drawOverlay(img.Image mainImage, img.Image overlayImage) {
  //das overlay.png kommt auf das hauptbild
  // dstx und dsty sind die Positionen, wo das Overlay hinkommt
  // blend: true sorgt dafür, dass das Overlay transparent ist 
  img.copyInto(
    mainImage,           //  das Hauptbild
    overlayImage,        // Das Overlay-Bild
    dstX: 50,            // X-Position wo das Overlay startet
    dstY: 50,            // Y-Position wo das Overlay startet
    blend: true,         // wichtig damit Transparenz im PNG berücksichtigt wird
  );
