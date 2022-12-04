---
description: >-
  Datenvisualisierungen mit ggplot2 basieren auf der umfassenden Grammar of
  Graphics. Visualisierungen werden hier immer nach dem gleichen Muster
  aufgebaut.
---

# Einführung in ggplot2

Dem Visualisierungspaket `ggplot2` liegt eine fundierte Theorie über das Erstellen von Grafiken zugrunde: die <mark style="background-color:yellow;">Grammar of Graphics</mark>. Wir führen kurz die wichtigsten Aspekte dieser Theorie ein. Für mehr Informationen findet ihr im [Kapitel 1 des Buches ggplot2 - Elegant Graphics for Data Analysis](https://ggplot2-book.org/introduction.html#what-is-the-grammar-of-graphics) eine gute Zusammenfassung.&#x20;

Ferner empfehle ich die fantastische Einführung von Bradley Boehmke von der University of Cincinnati in `ggplot2`. Er ist auch der Autor des Buches [Data Wrangling with R](https://link.springer.com/book/10.1007/978-3-319-45599-0).

{% embed url="https://uc-r.github.io/ggplot_intro" %}
Eine hervorragende Einführung in ggplot2 (englischsprachig).
{% endembed %}

## Die Grammar of Graphics

Gemäß der Grammar of Graphics sind die Grundelemente jeder Visualisierung <mark style="background-color:yellow;">die Daten</mark>, eine <mark style="background-color:yellow;">Zuordnung von Variablen in den Daten zu ästhetischen Elementen der Visualisierung</mark> sowie mindestens eine <mark style="background-color:yellow;">geometrische Figur</mark>, die für die Darstellung verwendet wird. Die Daten sind in R ein Dataframe bestehend aus Spalten und Zeilen. Die Zuordnung von Spalten zu ästhetischen Elementen, auch Mapping genannt, meint solche Aspekte wie welche Variablen auch der x- und y-Achse abgetragen werden sollen oder welche Variablen die Farben oder Größen der geometrischen Figuren bestimmen sollen. Geometrische Figuren stellen als dritter Bestandteil jeder Visualisierung die sichtbaren Elemente der Visualisierung dar. Typische Figuren sind Balken, Kreise oder Linien.

![Jede Visualisierung besteht in ggplot aus mindestens drei Elementen.](../../.gitbook/assets/grammar\_of\_graphics\_basic\_elements.png)

## Aufbau einer Visualisierung in ggplot2

Der folgende Pseudo-Code beschreibt den typischen minimalen Aufbau einer Visualisierung in `ggpot2`:

```r
ggplot(<DATAFRAME>, mapping = <MAPPING>) +
geom_<SHAPE>()
```

Die drei Begriffe `<DATAFRAME>`, `<MAPPING>` und `<SHAPE>` sind Platzhalter für die oben beschriebenen Elemente und werden in einer konkreten Visualisierung durch entsprechende gültige Angaben ersetzt.

## Die verwendeten Daten

Als ersten Wert erwartet die `ggplot` Funktion einen Dataframe. Dieser enthält die Daten für die Visualisierung. Alternativ können wir auch hier den [Pipe-Operator](../../einfuehrung-in-r/pipes-in-r.md) `%>%` verwenden, und damit den Parameter weglassen:

```
<DATAFRAME> %>% 
    ggplot(mapping = <MAPPING>) +
    geom_<SHAPE>()
```

Für die verschiedenen Elemente der Visualisierung können wir auf alle Felder des Dataframes zugreifen. Das ist insbesondere für das Ästhetik-Mapping relevant. Dort werden Felder (oder Variablen) aus dem Dataframe den beiden Achsen der Visualisierung zugeordnet. Auch Farben oder die Größe der geometrischen Figuren können über Felder in den Daten gesteuert werden.

## Das Ästhetik-Mapping

Das Feld `mapping` ist zentral für jede Visualisierung und wird der `ggplot` Funktion mitgegeben. Das Ästhetik-Mapping definieren wir mit der `aes()` Funktion, die in Abhängigkeit der verwendeten Visualisierungsform unterschiedliche Parameter verarbeiten kann.

### x- und y-Achse

Fast jede Visualisierung benötigt die Information, welche Daten auf der <mark style="background-color:yellow;">x- und y-Achse</mark> dargestellt werden sollen. Deshalb können diese beiden Parameter als Erstes unbenannt übergeben werden:

```
<DATAFRAME> %>%
    ggplot(aes(dataX, dataY)) +
    geom_<SHAPE>()
```

Der obige Code ist äquivalent zu diesem:

```
<DATAFRAME> %>%
    ggplot(aes(x = dataX, y = dataY)) +
    geom_<SHAPE>()
```

### Farben

Farben können in Visualisierungen für unterschiedliche Funktionen verwendet werden. So können zum Beispiel in einem Liniendiagramm verschiedene Serien in unterschiedlicher Farbe dargestellt werden. In diesem Fall handelt es sich um eine diskrete Farbpalette.

Farben können auch für kontinuierliche Größen verwendet werden. So könnte in einem Balkendiagramm jeder Balken in Abhängigkeit eines Feldes entsprechend auf einer kontinuierlichen Skala von Grün bis Rot eingefärbt werden.

```
<DATAFRAME> %>%
    ggplot(aes(x = dataX, y = dataY, color = dataZ)) +
    geom_<SHAPE>()
```

### Größe

Ein anschauliches Beispiel für die Steuerung der Größe einer geometrischen Figur ist das Punktediagramm. Hier kann die Größe jedes individuellen Punkts über eine Variable aus dem Dataframe gesteuert werden.

```
<DATAFRAME> %>%
    ggplot(aes(x = dataX, y = dataY, size = dataZ)) +
    geom_point()
```

In der Visualisierung unten werden sowohl die Farbe als auch die Größe der Kreise über Felder in den Daten gesteuert. Die Größe ist proportional zur durchschnittlichen Lebenserwartung eines Landes. Die Farbe kodiert den Kontinent, zu dem ein Land gehört.

![Ein Punktediagramm mit Farbe und Größe der Punkte durch Felder in den Daten gesteuert.](<../../.gitbook/assets/image (38).png>)

### Symbole

Auch die Symbole, die in einer Visualisierung verwendet werden, können über ein Feld in den Daten  bestimmt werden.

```
<DATAFRAME> %>%
    ggplot(aes(x = dataX, y = dataY, shape = dataZ)) +
    geom_point()
```

In der Abbildung unten wird der Kontinent, zu dem ein Land gehört, für die Auswahl des Symbols verwendet:

![Verwendung eines Feldes zur Bestimmung des verwendeten Symbols.](<../../.gitbook/assets/image (37).png>)



## Die verwendete Geometrie

