# Spalten und Ausdrücke auswählen

## Spalten auswählen

Mit SQL können wir einzelne Spalten einer Tabelle auswählen. Die folgende Abfrage wählt nur den Titel und die Beschreibung eines TED-Talks aus der Tabelle `ted_meta` aus.

```sql
select title, description 
from ted_meta
```

Die Syntax ist einfach: Zu selektierende Spalten (oder allgemein Ausdrücke) werden mit Kommata getrennt hinter dem `select`-Schlüsselwort aufgezählt:

```sql
-- Allgemeine Syntax für das Auswählen von Spalten
select <spalte 1>, <spalte 2>, ..., <spalte n>
from <tabellenname>
```

Im Code-Block oben stellt die erste Zeile einen Kommentar dar. Kommentare beginnen mit einem doppelten Minuszeichen (`--`) und werden nicht als SQL interpretiert und somit nicht ausgeführt. Kommentare erlauben uns, verständliche Hinweise zu unseren SQL Abfragen zu formulieren.

Es ist immer eine gute Idee, Kommentare zu verwenden. Gute Kommentare helfen anderen und euch selbst beim Verstehen des SQL-Codes.

Mit SQL können wir genau die Spalten auszuwählen, die für die Beantwortung einer Frage benötigt werden. Manchmal möchten wir dennoch alle Spalten einer Tabelle auswählen, weil wir z. B. die Spaltennamen noch nicht kennen. Für diesen Fall gibt es den sogenannten Wildcard-Selektor `*`. Die folgende SQL-Abfrage gibt alle Spalten der Tabelle `ted_meta` zurück:

```sql
select * from ted_meta
```

## Ausdrücke selektieren

Mit SQL können wir nicht nur Spalten einer Tabelle auswählen und im Ergebnis anzeigen. Wir können beliebige Ausdrücke verwenden und damit neue Spalten im Ergebnis definieren:

```sql
select 1 + 1 as `zwei`
from ted_meta
```

Die obige Abfrage liefert eine Spalte mit dem Namen zwei zurück, die für jede Zeile in der Tabelle ted\_meta den konstanten Wert 2 enthält. Dieses Beispiel ist zugegeben sinnlos. Wir können Ausdrücke auch dafür verwenden, um neue Berechnungen auf Basis von existierenden Spalten durchzuführen:

```sql
select comments / views as `Comments per View` 
from ted_meta
```

Die neue Spalte `Comments per View` beinhaltet für jeden TED-Talk die Angabe, wie viele Kommentare der Talk pro View im Internet erhalten hat.
