---
description: >-
  Der Datensatz enthält aktuelle Kennzahlen zur Covid19-Pandemie und kann als
  CSV-Datei heruntergeladen werden.
---

# 📂 Covid19

## Databricks Template mit Übungsaufgaben

Das folgende Notebook enthält den Code für das automatisierte Einlesen der Daten sowie eine Reihe von Übungsaufgaben. Importiert das Notebook in euren eigenen Databricks-Account und versucht, die Übungsaufgaben direkt im Notebook zu lösen:

{% embed url="https://s3.us-east-1.amazonaws.com/nicolas.meseth/databricks-notebooks/fallbeispiel_1_kennzahlen_zur_covid_19_pandemie.html" %}

{% embed url="https://s3.us-east-1.amazonaws.com/nicolas.meseth/databricks-notebooks/fallbeispiel_1_kennzahlen_zur_covid_19_pandemie_mit_loesungen.html" %}

## Download als CSV-Datei

Der Datensatz kann ich der aktuellsten Version direkt als CSV-Datei heruntergeladen werden:

* [Als CSV-Datei herunterladen](https://covid.ourworldindata.org/data/owid-covid-data.csv)

Informationen zu dem Datensatz findet ihr auf der offiziellen GitHub-Seite von Our World in Data:

{% embed url="https://github.com/owid/covid-19-data/tree/master/public/data" %}

## Datensatz mit R laden

Mit dem folgenden Code könnt ihr den Datensatz zu jederzeit in der aktuellen Fassung als Tibble (erweiterter Dataframe) laden:

```r
library(tidyverse)

# Read the latest version of the covid19 data set
covid <- read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")
```
