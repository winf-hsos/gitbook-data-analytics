---
description: >-
  Für die Visualisierung von zahlenmäßigen Mengen und Verhältnissen zwischen
  verschiedenen Datenkategorien eignen sich Balkendiagramme. Hier lernt ihr,
  diese mit ggplot2 zu erstellen.
---

# Mengen und Proportionen

## Beispieldatensatz

Wir verwenden in den folgenden Beispielen den Datensatz [Environmental Impacts of Food Production](../../data-sets-and-exercises/datensaetze/environmental-impacts-of-food-production.md) von Our World in Data. Ladet euch den Datensatz auf euren Rechner herunter, speichert ihn in eurem aktuellen R-Arbeitsverzeichnis, und ladet den mit der bekannten Funktion aus dem `readr` Paket:

```r
# Set your working directory
setwd("...")

# Read the data file as a tibble
food_production <- read_csv("food_production.csv")
```

## Einfache Balkendiagramme

Einfache Balkendiagramme sind nützlich, um Zahlen über verschiedene Kategorien hinweg zu vergleichen. Menschen sind ausgezeichnet darin, die Höhe oder Breite von Balken im Vergleich zu anderen Balken einzuschätzen. Das Beispiel unten erzeugt ein Diagramm, in dem jeder Balken die Anzahl der Produkte in einer Produktkategorie aus dem [REWE-Datensatz](../../data-sets-and-exercises/datensaetze/rewe-online-products.md) repräsentiert:

```r
# Wie viele Produkte hat jede Kategorie?
rewe %>%
  filter(!is.na(productCategory)) %>%
  ggplot(aes(x = productCategory)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle = -45, hjust = 0)) +
  xlab("Product Category") + 
  ylab("Number Products")
```

Wir geben für das Diagramm nur an, welche Variable für die x-Achse verwendet werden soll. Standardmäßig verwendet R die Anzahl an Datensätzen pro Ausprägung der Variable als Größe für die Höhe der Balken. Das entspricht hier der Anzahl Produkte pro Kategorie.

Damit die Beschriftungen der x-Achse besser lesbar ist, drehen wir die Texte um minus 45 Grad (Zeile 6). Außerdem benennen wir die Achsen mit aussagekräftigen Labeln (Zeile 7 und 8).

## Sortierung in Balkendiagrammen

Bei Balkendiagrammen ist es meistens sinnvoll, die Balken nach Werten zu sortieren. So sieht man schneller, wo die größten oder kleinsten Werte sind und wie die Proportionen dazwischen verlaufen.

### Sortierung bei vorhandenem y-Wert

Wir müssen bei der Sortierung zwischen zwei Fällen unterscheiden:

1. Wir haben im Datensatz eine Größe, die wir auf der y-Achse über die Höhe eines Balkens zeigen wollen.
2. Wir haben keine Größe im Datensatz, sondern wollen die Werte pro Ausprägung auf der x-Achse zählen und die Balkengröße danach bestimmen lassen.

Der zweite Fall wird unten gezeigt. Für den ersten Fall können wir die `reorder()` Funktion verwenden. Zunächst die unsortierte Variante eines Balkendiagramms, das die Gesamtemissionen für jedes Lebensmittelprodukt zeigt:

```
food_production %>%
  ggplot(aes(x = food_product, y = total_emissions)) +
  coord_flip() +
  geom_col()
```

![Unsortierte Balken.](<../../.gitbook/assets/image (49) (1).png>)

Mit der `reorder()` Funktion können wir die Variable auf der Achse nach einer zweiten Variable sortieren lassen:

```r
food_production %>%
  ggplot(aes(x = reorder(food_product, total_emissions), y = total_emissions)) +
  coord_flip() +
  geom_col()
```

![](<../../.gitbook/assets/image (35).png>)

Die Sortierung können wir mit der `desc()` Funktion umkehren:

```r
food_production %>%
  ggplot(aes(x = reorder(food_product, desc(total_emissions)), y = total_emissions)) +
  coord_flip() +
  geom_col()
```

### Sortierung bei automatisch errechneten y-Wert

Die Funktion `geom_bar()` errechnet automatisch einen Wert für die y-Achse. Standardmäßig zählt sie die Anzahl Datensätze in jeder Kategorie. Der folgende Code erzeugt ein Balkendiagramm für die Anzahl Produkte pro Kategorie:

```r
rewe %>%
  filter(!is.na(productCategory)) %>%
  ggplot(aes(x = productCategory)) + 
  geom_bar() +
  xlab("Product Category") + 
  ylab("Number Products") +
  coord_flip()
```

Das Ergebnis seht ihr unten. Die Balken sind nicht sortiert.

![Unsortierte Balken.](<../../.gitbook/assets/image (31).png>)

Um die Balken nach der Anzahl Produkte auf zu sortieren, können wir die Funktion `fct_infreq()` verwenden:

```r
rewe %>%
  filter(!is.na(productCategory)) %>%
  ggplot(aes(x = fct_infreq(productCategory))) + 
  geom_bar() +
  xlab("Product Category") + 
  ylab("Number Products") +
  coord_flip()

```

![Aufsteigend sortierte Balken.](<../../.gitbook/assets/image (29) (1).png>)

Mit der Funktion `fct_rev()` können wir die Sortierung umdrehen und absteigend sortieren:

```
rewe %>%
  filter(!is.na(productCategory)) %>%
  ggplot(aes(x = fct_rev(fct_infreq(productCategory)))) + 
  geom_bar() +
  xlab("Product Category") + 
  ylab("Number Products") +
  coord_flip()
```

![](<../../.gitbook/assets/image (44).png>)
