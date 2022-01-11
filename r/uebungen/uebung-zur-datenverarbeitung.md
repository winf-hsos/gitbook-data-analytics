# 💻 Übung zur Datenverarbeitung

## 1 Laden und Sichten der Daten

Ladet euch für diesen Teil der Übungsaufgabe die folgende CSV-Datei auf euren Computer herunter und speichert sie in einem Ordner eurer Wahl.

{% file src="../../.gitbook/assets/rewe_products (1).csv" %}

Öffnet nun eine neue R-Skriptdatei und setzt das Arbeitsverzeichnis für eure Sitzung auf den Ordner, in dem die Datei liegt. Versucht, die folgenden Aufgaben mittels R zu lösen. Speichert alle Kommandos in eurem R-Skript und verwendet Kommentare, um den Code den Aufgaben zuordnen zu können.

### 1.1 Daten als Tibble einlesen

Schreibt den notwendigen Code, um die Datei als Dataframe, genauer gesagt, als Tibble, zu laden. Welches Paket könnt ihr dafür verwenden?

### 1.2 Anzahl Zeilen und Spalten ausgeben

Wie viele Spalten und Zeilen sind im Datensatz enthalten? Gebt die Spaltennamen auf der Konsole aus!

### 1.3 Daten sichten

Findet Lösungen für die folgenden Aufgaben zur Sichtung der Daten:

1. Lasst euch die ersten 20 Produktnamen ausgeben! Wie könnt ihr alle Produkte sehen?
2. Gebt die ersten 30 Hersteller aus. Was fällt euch auf? Wie könntet ihr das lösen?
3. Gebt die 5 Produkte mit dem höchsten Fettgehalt aus.

### 1.4 Spaltenzusammenfassungen&#x20;

Verschafft euch einen Überblick über die Wertebereiche der Spalten und löst die folgenden Aufgaben:

1. Fasst die Spalten `vegan` und `vegetarian` zusammen. Was sagt ihr zu der Datenqualität der beiden Spalten?
2. Erstellt eine Zusammenfassung aller Spalten, die einen Wert in Gramm enthalten. Welche verschiedenen Möglichkeiten findet ihr, das zu erreichen?

## 2 Einfache Transformationen

### 2.1 Auswählen von Spalten

1. Erstellt einen neuen Dataframe, der den Produktnamen, die Produktkategorie und den Verkaufspreis enthält.
2. Erstellt einen neuen Dataframe mit allen Nährwertangaben sowie dem Produktnamen und der Produktkategorie.
3. Erstellt einen neuen Dataframe, der nur numerische Spalten enthält. Prüft die Spalten und schreibt auf, was euch auffällt.

### 2.2 Zeilen filtern

1. Filtert die Daten, sodass nur Produkte aus Deutschland enthalten sind. Behaltet nur den Produktnamen und das Herkunftsland im Ergebnis.
2. Findet all veganen Bioprodukte.
3. Welche Biersorten werden im REWE-Onlineshop angeboten?
4. Findet alle Rotweine unter 2 EUR.
5. Findet alle Produkte, die das Allergen Soja enthalten. Schaut euch dafür die Funktion `str_detect()` an.

### 2.3 Spalten verändern

1. Ändert den Datentyp der beiden Spalten `productId` und `gtin` in Zeichenketten (_chr_) um.
2. Erstellt eine neue Spalte `sum_nutrition`, in der ihr die Summe aller Nährwertangaben bildet. Belasst im Ergebnis nur die neue Summenspalte und die einzelnen Nährwertspalten.
3. Berechnet, ob ein Produkt mehr als 90% Fett enthält und speichert diese Information auf einer neuen Spalte `high_fat`. Zeigt zur Überprüfung nur Zeilen an, bei denen der Wert `TRUE` ist. Die neue Spalte soll vor der Spalte `productDescription` eingefügt werden.
4. Erstellt eine Spalte `foreign_bio`, die `TRUE` enthalten soll, wenn das Produkt ein Bioprodukt ist und gleichzeitig nicht aus Deutschland stammt.

### 2.4 Daten zusammenfassen

1. Wie viele Produkte befinden sich im Datensatz?
2. Wie viele Produkte hat jede Produktkategorie?
3. Gebt zusätzlich zur Produktkategorie und der Anzahl der Produkte nun auch den durchschnittlichen Verkaufspreis mit an.
4. Listet alle Produktkategorien nach dem durchschnittlichen Fettgehalt ihrer Produkte auf. Auf welches Problem stoßt ihr dabei und wie könnt ihr das lösen?
5. Verwendet das vorige Ergebnis und behaltet nur die Top 5 der Kategorien mit dem höchsten durchschnittlichen Fettgehalt ihrer Produkte.
6. Welche Hersteller (`brand`) haben die Produkte mit dem höchsten Proteingehalt im Sortiment? Listet die Top 10.

