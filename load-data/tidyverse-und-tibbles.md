# Tidyverse und Tibbles

## Tibbles

R eignet sich besonders für die Arbeit mit **strukturierten Daten**. Dafür verwenden wir in R einen sogenannten **Dataframe**. Wir können uns einen Dateframe als eine Tabelle mit Spalten und Zeilen vorstellen.&#x20;

Neben den Dataframes in R gibt es mit der Bibliothek [Tidyverse](https://www.tidyverse.org/) ein verbessertes und einfacher nutzbares Datenobjekt. Tidyverse führt das sogenannte [Tibble](https://tibble.tidyverse.org/) als moderne Form des R-Dataframes ein. Wie wir lernen werden, bringt ein Tibble zusammen mit der Bibliothek [dplyr](https://dplyr.tidyverse.org/) **** Möglichkeiten mit, um einfach auf Daten zuzugreifen und sie zu manipulieren. Ein Tibble können wir mit dem Befehl `as.tibble()` aus einem herkömmlichen R-Dataframe erzeugen.

{% hint style="info" %}
Für die Datenmanipulation mit `dplyr` findet ihr hier ein nützliches [Cheat Sheet](https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf).
{% endhint %}

Viele der Operationen, die mit Tibbles und `dplyr` möglich sind, könnten wir auch mit den normalen R-Dataframes durchführen. Allerdings ist es damit oft umständlicher. Im Folgenden führe ich daher die Nutzung von Tidyverse und Tibbles auf. In einigen Fällen ist eine Operation auch nur mit Tibbles möglich.

## Tidyverse installieren

Ihr müsst Tidyverse einmalig installieren und könnt es anschließend in euren Skripten verwenden. Das Installieren funktioniert über eine Zeile Code, die ihr einmal ausführen müsst:

```r
install.packages("tidyverse")
```

Alternativ könnt ihr Tidyverse auch über RStudios grafische Benutzeroberfläche installieren. Dazu klickt ihr im unteren rechten Bereich auf „Packages“ und scrollt zum Buchstaben „t“. Klickt anschließend auf das kleine Kästchen neben dem Tidyverse-Package. Die Installation wird nun im Hintergrund durchgeführt.

![Installation von Tidyverse über die RStudio GUI.](<../../.gitbook/assets/image (27).png>)

Lasst uns nun unseren ersten Tibble erstellen und einen Datensatz mit R laden.

##
