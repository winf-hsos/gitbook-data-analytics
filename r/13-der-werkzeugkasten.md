---
description: >-
  Wir verwenden im Folgenden R und das Paket Tidyverse für die explorative
  Datenanalyse. Hier bekommt ihr einen Überblick über die verschiedenen
  Werkzeuge, die uns das Paket bietet.
---

# 13 Der Werkzeugkasten

Bei der Arbeit mit Daten ist es wichtig zu wissen, welches Werkzeug (hier: Paket oder Funktion) wir für welche Aufgabe verwenden. Genauso wie in einer Werkstatt, in der es eine Vielzahl an Werkzeugen gibt, die für unterschiedliche Zwecke geeignet sind.

![](../.gitbook/assets/tool\_set.jpg)

Die Tabelle unten listet wichtige Werkzeuge auf, die wir im weiteren Verlauf dieses Skriptes kennenlernen werden.

| **Paket** | **Funktion**                                                               | **Aufgabe**                                                                                                            |
| --------- | -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `tibble`  | `as.tibble`                                                                | [Erstellt einen modernen Dataframe für tabellarische Daten](14-daten-laden-und-sichten/tidyverse-und-tibbles.md).      |
| `readr`   | `read_csv`                                                                 | [Lesen von tabellarischen Datenformaten wie CSV-Dateien](14-daten-laden-und-sichten/laden-eines-datensatzes.md).       |
| `dplyr`   | `select`                                                                   | [Auswählen von Spalten (Variablen) eines Datensatzes](15-daten-veraendern/spalten-auswaehlen.md).                      |
| `dplyr`   | `filter`                                                                   | [Filtern von Daten auf Basis fast beliebiger Ausdrücke](15-daten-veraendern/zeilen-filtern.md).                        |
| `dplyr`   | `mutate`                                                                   | [Hinzufügen neuer Spalten (Variablen)](15-daten-veraendern/spalten-veraendern/).                                       |
| `dplyr`   | `recode`                                                                   | [Spaltenwerte neu kodieren](15-daten-veraendern/spalten-veraendern/spalten-neu-kodieren.md).                           |
| `dplyr`   | `arrange`                                                                  | [Die Reihenfolge von Zeilen verändern](15-daten-veraendern/zeilen-sortieren.md).                                       |
| `dplyr`   | `group_by`                                                                 | [Gruppieren von Daten](15-daten-veraendern/daten-zusammenfassen.md#zusammenfassen-und-gruppieren).                     |
| `dplyr`   | `summarise`                                                                | [Zusammenfassen von Daten](15-daten-veraendern/daten-zusammenfassen.md#viele-zeilen-zu-einer-kennzahl-zusammenfassen). |
| `ggplot2` | `ggplot`, `aes`, `geom_line`_,_ `geom_bar`, `geom_col` `geom_point` u.v.m. | [Visualisieren von Daten](16-daten-visualisieren-mit-ggplot2/).                                                        |

## Das Paket `tibble`

Das Paket `tibble` führt das moderne Pendant zum klassischen Dataframe in R ein:

{% embed url="https://tibble.tidyverse.org/" %}

## Das Paket `readr`

Das Paket `readr` beinhaltet Funktionen für das Laden von Daten aus strukturierten Datenformaten wie CSV-Dateien. Alle Funktionen zum Datenimport aus readr erzeugen automatisch einen `tibble`.

{% embed url="https://readr.tidyverse.org/" %}

Das folgende Cheat Sheet beinhaltet eine Übersicht der Funktionen:

{% file src="../.gitbook/assets/data-import.pdf" %}
Cheat Sheet readr
{% endfile %}

## Das Paket `dplyr`

Das Paket [`dplyr`](https://dplyr.tidyverse.org) hat einen etwas merkwürdigen Namen. Er setzt sich aus dem Buchstaben „d“ und dem abgekürzten Wort „plyr“ zusammen. Das „d“ steht für Dataframe, während „plyr“ für den englischen Begriff „plier“ steht, was auf Deutsch „Zange“ bedeutet. Passend dazu bildet das offizielle Symbol des Pakets mehrere Zangen ab.

{% embed url="https://dplyr.tidyverse.org/index.html" %}

`dplyr` liefert uns eine Vielzahl wichtiger Funktionen für die Manipulation von Daten, die in Form eines Tibble vorliegen. Eine Übersicht der Funktionen findet ihr in dem bereitgestellten Cheat Sheet:

{% file src="../.gitbook/assets/data-transformation.pdf" %}
Cheat Sheet dplyr
{% endfile %}

## Das Paket `ggplot2`

`ggplot2` ist eines der umfassendsten Pakete für die professionelle Visualisierung von Daten mit R:

{% embed url="https://ggplot2.tidyverse.org/" %}

Das Cheat Sheet beinhaltet alle wichtigen Funktionen im Überblick:

{% file src="../.gitbook/assets/data-visualization-2.1.pdf" %}
Cheat Sheet ggplot2
{% endfile %}
