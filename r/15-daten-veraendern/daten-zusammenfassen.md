# Zeilen zusammenfassen

## Zählen

### Alle Zeilen im Datensatz

Das Zählen aller Zeilen ist mit der `count()` Funktion ein Kinderspiel:

```r
limo %>%
  count()
  
#  # A tibble: 1 x 1
#      n
#   <int>
# 1   421
```

### Schnelles Zählen von Ausprägungen einer Spalte

Um schnell eine Übersicht über <mark style="background-color:yellow;">Häufigkeit der Werte</mark> einer Spalte zu bekommen, können wir die Funktion `count()` verwenden und eine Spalte als erstes Argument übergeben. In dem Beispiel unten zählen wir die Werte für die Spalte der Geschlechtsangabe aus dem [Limonaden-Datensatz](../../datensaetze-und-uebungen/datensaetze/umfrage-orangenlimonade.md):

```r
limo %>%
  count(f53_geschlecht, sort = TRUE)
  
# # A tibble: 3 x 2
#   f53_geschlecht     n
#            <dbl> <int>
# 1              1   226
# 2              2   193
# 3           -999     2
```

## Durchschnitte berechnen

```
b37 %>% summarise(mean = mean(`Like Overall`), n = n()) 
```

## Zusammenfassen und Gruppieren

```r
b37 %>% 
  group_by(`Sample Name`) %>% 
  summarise(mean = mean(`Like Overall`), n = n()) 
```
