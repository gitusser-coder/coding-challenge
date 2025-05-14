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

  // Gibt das fertige Bild zurück
  return mainImage;
}


// Diese Funktion lädt beide Bilder, kombiniert sie und zeigt das Ergebnis
Future<void> combineAndShow(BuildContext context) async {
  // Hauptbild laden
  final ByteData mainData = await rootBundle.load('assets/gojo_zeigt_bg.png');
  final Uint8List mainBytes = mainData.buffer.asUint8List();
  final img.Image? mainImage = img.decodeImage(mainBytes);

  // Overlay laden
  final ByteData overlayData = await rootBundle.load('assets/overlay.png');
  final Uint8List overlayBytes = overlayData.buffer.asUint8List();
  final img.Image? overlayImage = img.decodeImage(overlayBytes);

  // Prüfen ob alles richtig geladen wurde
  if (mainImage == null || overlayImage == null) {
    print('Bild konnte nicht geladen werden');
    return;
  }

  // Beide Bilder kombinieren
  final img.Image resultImage = drawOverlay(mainImage, overlayImage);

  // Ergebnis als PNG kodieren
  final Uint8List resultBytes = Uint8List.fromList(img.encodePng(resultImage));

  // Ergebnis anzeigen 
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: Image.memory(resultBytes), // Zeigt das kombinierte Bild
    ),
  );
}


//  Wasserzeichen unten rechts auf Hauptbild setzt
img.Image addWatermark(img.Image mainImage, img.Image watermark) {
  // Berechne Position unten rechts
  int x = mainImage.width - watermark.width - 10;  // 10 Pixel Abstand vom Rand
  int y = mainImage.height - watermark.height - 10;

  // Kopiere Wasserzeichen rein 
  img.copyInto(
    mainImage,        // Hauptbild
    watermark,        // Wasserzeichen
    dstX: x,          // X-Koordinate (rechts)
    dstY: y,          // Y-Koordinate (unten)
    blend: true,      // blend = true sorgt für weiche
  );

  return mainImage;
}
