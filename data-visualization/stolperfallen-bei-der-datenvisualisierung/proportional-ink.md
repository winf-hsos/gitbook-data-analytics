# Non-Proportional Ink

Das Konzept des _Proportional Ink_ wird in [Kapitel 17 des Buches Fundamentals of Data Visualization](https://clauswilke.com/dataviz/proportional-ink.html) beschrieben. Zusammengefasst sagt es aus, dass die Dimensionen (Fläche, Länge, Breite) der verwendeten visuellen Objekte (_Shapes_) proportional zu den numerischen Werten sein müssen, die sie repräsentieren. Das ist deshalb wichtig, weil ansonsten ein verzerrtes Bild erzeugt wird.

## Unten abgeschnittene Balken

Ein typisches Beispiel, bei dem das Prinzip des _Proportional Ink_ verletzt ist, ist ein Balkendiagramm, dessen y-Achse nicht bei null beginnt. Das Balkendiagramm unten ist ein anschauliches Beispiel. Hier fängt die numerische Achse bei 36 an und nicht bei 0. Durch das Abschneiden erscheint der Balken für Deutschland fast doppelt so lang wie der schwedische Balken. Die Visualisierung suggeriert also einen doppelt so großen Wert für Deutschland im Vergleich zu Schweden. Schaut man auf die Zahlen, so ist der Unterschied 40,4 % zu 38,6 %, also nicht einmal 5 %.

![Der Balken für Deutschland sieht doppelt so groß aus wie z. B. der von Schweden. Die Zahlen sagen etwas anderes.](<../../.gitbook/assets/image (43).png>)

Das korrekte Schaubild sehen wir unten, bei dem die numerische Achse bei null beginnt und die Unterschiede proportional zu den Werten dargestellt sind:

![Jetzt sind die Balken nur noch geringfügig unterschiedlich, genau wie die Zahlen.](<../../.gitbook/assets/image (40).png>)

## Fahrlässige oder böswillige Verzerrung

Während das Beispiel oben in den meisten Fällen auf Unkenntnis zurückzuführen ist, gibt es auch Beispiele, bei denen man entweder fahrlässig oder im schlimmsten Fall sogar böswilliges Handeln unterstellen muss.

Im unten gezeigten Bild, das kurz nach der Bundestagswahl 2021 im TV gezeigt wurde, wird das Prinzip des _Proportional Ink_ in extremer Weise verletzt. Betrachtet man die erste Zeile, in der auf der linken Seite 38 % der Unions-Anhänger aussagen, dass Armin Laschet ein guter Bundeskanzler wäre. Die auf der gegenüberliegenden Seite stehenden 54 % werden merkwürdigerweise durch einen deutlich kleineren Balken dargestellt. Die Abbildung suggeriert, dass deutlich mehr Unions-Anhänger Herrn Laschet für einen guten Bundeskanzler hielten. Nur, wenn man die Zahlen genau liest und vergleicht, fällt einem das Problem auf. Das aber ist genau nicht der Sinn von Visualisierungen.

![Wie kann der Balken für 38 % größer sein als der für 54 % ?](<../../.gitbook/assets/image (45).png>)

## Weitere Beispiele

Einige Beispiele mit weiteren Ausführungen findet ihr auch im Buch _Calling Bullshit_ sowie dessen Webseite:

* [https://www.callingbullshit.org/tools/tools\_proportional\_ink.html](https://www.callingbullshit.org/tools/tools\_proportional\_ink.html)

{% embed url="https://twitter.com/raykwong/status/1324330586215911426" %}

