---
description: >-
  Das Filtern von Zeilen innerhalb eines Datensatzes ist essenziell für die
  Datenanalyse. R und das Paket dplyr bieten dafür umfassende Möglichkeiten.
---

# Zeilen filtern

> &#x20;The `filter()` function is used to subset a data frame, retaining all rows that satisfy your conditions. To be retained, the row must produce a value of `TRUE` for all conditions. Note that when a condition evaluates to `NA` the row will be dropped \[..] (Source: [Offizielle Tidyverse Dokumentation](https://dplyr.tidyverse.org/reference/filter.html))

## Filtern von Zeichenketten

```r
food_production %>% filter(food_product == "Rice")
```

```r
food_production %>% filter(food_product %in% c("Rice", "Oatmeal"))
```

## Filtern aus Basis von numerischen Werten

### Größer und Kleiner (gleich)

Wir können einfache numerische Vergleiche mit den gängigen Operatoren durchführen:

```r
food_production %>% filter(total_emissions > 2.0)
food_production %>% filter(total_emissions < 1.0)
food_production %>% filter(total_emissions >= 2.0)
food_production %>% filter(total_emissions <= 2.0)
```

## Verknüpfen mehrerer Bedingungen mit UND und ODER

### UND-Verknüpfungen

```r
# UND-Verknüpfungen können mit dem &-Operator erstellt werden
food_production %>% filter(animal_feed > 0 & total_emissions > 10)

# Zwei Bedingungen mit Komma getrennt werden als UND-Verknüpfung interpretiert
food_production %>% filter(animal_feed > 0, total_emissions > 10)
```

### ODER-Verknüpfungen

```r
# ODER-Verknüpfungen können mit dem Pipe-Operator erstellt werden
food_production %>% filter(animal_feed > 0 | total_emissions > 10)
```

## Filtern aus Basis von Ausdrücken

```r
# Die Summe aus "transport" und "packaging" muss größer als 1 sein
food_production %>% filter(transport + packging > 1.0)
```

