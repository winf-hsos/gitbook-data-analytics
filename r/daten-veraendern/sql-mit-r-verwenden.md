---
description: >-
  Für alle Datenenthusiasten mit SQL-Hintergrund gibt es die Möglichkeit, mit
  SQL direkt auf Dataframes Abfragen durchzuführen.
---

# SQL mit R verwenden

Mit dem Paket `sqldf` können wir SQL verwenden, um Dataframes (und Tibbles) abzufragen. Das ist besonders hilfreich, wenn ihr bereits SQL kennt. Zuerst müssen wir das Paket installieren und laden:

```r
install.packages("sqldf")
library(sqldf)
```

Eine Abfrage stellen wir mit der Funktion `sqldf`:

```r
after1990 <- sqldf("select * from limo where f39_geburtsjahr > 1990")
```

Diese Funktion liefert einen klassischen R-Dataframe zurück, den wir in ein [Tibble](../14-daten-laden-und-sichten/tidyverse-und-tibbles.md#tibbles) umwandeln können:

```r
after1990 <- as_tibble(
  sqldf("select * from limo where f39_geburtsjahr > 1990")
  )
```

