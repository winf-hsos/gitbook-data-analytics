# 📂 REWE Online Products

## Datensatz herunterladen

Der Datensatz enthält einen Abzug der im Jahr 2018 im REWE-Onlineshop erhältlich Produkte mit sämtlichen Informationen zu Nährwerten etc.

{% file src="../../.gitbook/assets/rewe_products.csv" %}

## Datensatz mit R laden

Speichert den Datensatz in eurem Arbeitsverzeichnis und öffnet RStudio. Mit dem folgenden R-Code könnt ihr den Datensatz als Tibble (erweiterter Dataframe) laden. Ersetzt den Wert für das Arbeitsverzeichnis in Zeile 2 mit dem richtigen Wert für eure Arbeitsumgebung:

```r
library(tidyverse)
setwd("C:/rcode/rewe")
rewe <- read_csv("rewe_products.csv")
```
