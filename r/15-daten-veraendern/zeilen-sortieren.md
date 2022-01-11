# Zeilen sortieren

Wir können mit der Funktion `arrange` aufsteigend und absteigend (in Kombination mit `desc`) sortieren:

```r
food_production %>%
    arrange(total_emissions)

food_production %>%
    arrange(desc(total_emissions))
```
