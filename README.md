# coding-challenge


Coding-Challenge (Dart/Flutter): Erstelle eine einfache Flutter-Anwendung, um deine Fähigkeiten in der Bildverarbeitung mit Dart zu demonstrieren. Die App soll es ermöglichen, ein Beispielbild (aus den App-Assets) zu laden und die folgenden Operationen darauf anzuwenden und das Ergebnis anzuzeigen:

    Thumbnail-Erstellung: Implementiere eine Funktion in Dart, die aus einem gegebenen Bild (z.B. als Uint8List oder über das image-Package geladen) ein Thumbnail mit einer festen Breite von 300 Pixeln erstellt, wobei das ursprüngliche Seitenverhältnis beibehalten wird.
    Parametrisierte Overlay-Komposition: Implementiere eine Funktion in Dart, die ein Hauptbild und ein Overlay-Bild (z.B. ein PNG mit transparentem Hintergrund, ebenfalls als Asset) entgegennimmt. Das Overlay soll basierend auf einfachen UI-Eingaben für Position (x,y-Koordinaten), Skalierungsfaktor und Rotationswinkel auf das Hauptbild gezeichnet werden. Das Ergebnis soll wieder als Bild angezeigt werden. (Nutze hierfür z.B. das image-Package).
    Wasserzeichen hinzufügen: Implementiere eine Funktion in Dart, die ein Wasserzeichen-Bild (Logo, als Asset) an einer festen Position (z.B. unten rechts) auf das Hauptbild legt.
