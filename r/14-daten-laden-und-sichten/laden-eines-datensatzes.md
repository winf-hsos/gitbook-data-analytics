---
description: >-
  Der Beginn jeder Analyse ist das Laden der Daten. In R steht uns mit readr ein
  mächtiges Paket für die häufig verwendeten CSV-Dateien zur Verfügung.
---

# Laden eines Datensatzes

In diesem Abschnitt lernen wir die ersten Schritte im Umgang mit Tibbles am Beispieldatensatz [Environment Impact of Food Production](https://ourworldindata.org/environmental-impacts-of-food). Der Datensatz ist relativ klein und überschaubar und eignet sich daher gut für die Einführung der wichtigsten Konzepte.

{% file src="../../.gitbook/assets/food_production.csv" %}
Environment Impact of Food Production
{% endfile %}

## Einen Datensatz als Tibble laden

Der folgende Code lädt die oben verlinkte Datei und erstellt daraus ein Tibble:

```r
library(readr)
food_production <- read_csv("food_production.csv")
```

### Das Arbeitsverzeichnis setzen

Damit wir den Dateinamen ohne Pfadangabe verwenden können, müssen wir vorher das **Arbeitsverzeichnis** (Working Directory) in RStudio auf den Ordner festlegen, in dem die Datei liegt. Alternativ können wir auch einen absoluten oder relativen Pfad inklusive Dateinamen angeben.

![So ändert man das Arbeitsverzeichnis in RStudio.](<../../.gitbook/assets/image (26).png>)

Wir können das Arbeitsverzeichnis auch zu Beginn unseres Skripts festlegen:

```r
# Setzen des Arbeitsverzeichnisses
setwd("c:/r/my-analysis")
```

Auch das Lesen des aktuellen Arbeitsverzeichnisses ist möglich:

```r
# Ausgabe des aktuellen Arbeitsverzeichnisses
getwd()
```

{% hint style="warning" %}
Achtung: Die Pfadangabe für `setwd()` muss immer mit Forward-Slashes (`/`) erfolgen. Unter Windows enthalten Pfade den Backslash (`\`). Dieser muss vorher ersetzt werden.
{% endhint %}

### Einlesen von CSV-Dateien mit `readr`

Für das Laden strukturierter Daten wie etwa CSV-Dateien eignet sich das in Tidyverse enthaltene Paket [readr](https://readr.tidyverse.org). Wenn wir Tidyverse bereits installiert haben, müssen wir in unserem Skript nur noch angeben, dass wir das Paket `readr` nutzen wollen. Anschließend steht uns die Funktion `read_csv()` zur Verfügung, die entweder einen Pfad- und Dateinamen auf dem lokalen Rechner erwartet oder die Angabe einer URL. Das ist beispielsweise dann nützlich, wenn wir einen Datensatz laden wollen, der im Internet frei zugänglich ist.

Das fertige Tibble wird auf einer Variable mit dem Namen `food_production` gespeichert. Eine Zuweisung eines Wertes zu einer Variablen nehmen wir in R mit der Zeichenfolge `<-` vor.

## Den Datensatz anzeigen

Wir können jetzt überprüfen, ob der Datensatz korrekt geladen wurde. Dazu geben wir in unser Skript einfach den Befehl `view()` ein und übergeben als Parameter den Namen des gerade erstellen Tibble. Mit  ⌨ Strg + Enter oder über den Button „Run“ in der rechten oberen Ecke des Skriptfensters führen wir die Zeile aus. Es öffnet sich ein neuer Tab mit einer tabellarischen Ansicht der Daten.

![Tabellarische Ansicht eines Datensatzes in RStudio.](<../../.gitbook/assets/image (28).png>)

Eine Alternative zu Verwendung der `view()` Funktion ist die direkte Eingabe des Tibble-Namens in den Skripteditor und das anschließende Ausführen. In diesem Fall erscheint die Ausgabe in der Konsole (s. unten). Im Vergleich zu einem Standard-Dataframe ist die Ausgabe eine Tibbles besser durchdacht. So wird direkt zu Beginn die Dimensionierung angegebene (Zeilen x Spalten). Zudem gibt einTibble für jede Spalte den Datentyp als Kürzel mit aus. Die Ausgabe der Daten an sich wird auf wenige Beispielzeilen beschränkt, sodass man nicht lange scrollen muss. Als Ausgleich wird unten angegeben, wie viele weitere Spalten (Variables) und Zeilen (Rows) im Datensatz enthalten sind.

{% tabs %}
{% tab title="Tibble" %}
```r
# Ein Tibble gibt mehr Informationen von sich Preis als ein R-Dataframe
food_production
```

![Ein Tibble gibt viele zusätzliche Informationen über sich Preis.](<../../.gitbook/assets/image (17).png>)
{% endtab %}

{% tab title="R-Dataframe" %}
```r
# Der Name reicht, um den Dataframe als Text auszugeben
food_production_df
```

![](<../../.gitbook/assets/image (14).png>)
{% endtab %}
{% endtabs %}

Nachdem wir unseren ersten Datensatz geladen haben, wollen wir uns im nächsten Abschnitt anschauen, wie wir erste Informationen zum Datensatz mit R extrahieren können.
