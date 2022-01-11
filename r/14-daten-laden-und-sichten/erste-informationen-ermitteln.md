# Erste Informationen ermitteln

Wir haben nun den Datensatz aus dem vorigen Abschnitt als Tibble mit dem Namen `food_production` vorliegen. R und Tibbles bieten uns eine Reihe von Funktionen, um grundlegende Informationen bezüglich eines Dataframes (oder Tibble) zu erhalten.

## Alle Daten anzeigen

Wie bereits gezeigt, können wir in RStudio mit der `view()` Funktion den gesamten Dataframe in einem neuen Tab anzeigen:

```r
view(food_production)
```

## Erste und letzte Zeilen anzeigen

In manchen Fällen reicht und der Blick auf wenige Zeilen. Mit den beiden Funktionen `head()` und `tail()` können wir schnell die obersten und die untersten Zeilen eines Datensatzes anzeigen:

```r
# Zeigt die ersten Zeilen
head(food_production)        
        
# Zeigt die letzten Zeilenn
tail(food_production)                
```

Die beiden Funktionen zeigen standarmäßig 5 Zeilen an. Über das 2. Argument kann gesteuert werden, wie viele Zeilen angezeigt werden sollen:

```r
# Zeigt die ersten 10 Zeilen an
head(food_production, 10)

# Zeigt die letzten 10 Zeilen an
tail(food_production, 10)
```

## Dimensionierung anzeigen

Die Anzahl Spalten und Zeilen können wir mit `dim()` ermitteln:

```r
dim(food_production)
# [1] 43 23
```

Der erste Wert steht für die Anzahl Zeilen, der Zweite für die Anzahl Spalten im Dataframe.

## Struktur anzeigen

Mit dem Befehl `str()` können wir die Spaltennamen und deren Datentyp ausgeben. Dazu erhalten wir weitere Informationen in Abhängigkeit des Datentyps:

```
str(food_production)
```

![](<../../.gitbook/assets/image (50).png>)

### Nur Spaltennamen

Mit `colnames()` bekommen wir eine Liste mit allen Spaltennamen:

```
colnames(food_production)
```

## Zusammenfassung für jede Spalte anzeigen

Eine Zusammenfassung für jede Spalte erhalten wir mit der `summary()` Funktion. In Abhängigkeit vom Datentyp erhalten wir relevante Indikatoren über den Inhalt jeder Spalte. So berechnet die Funktion für numerische Spalten den kleinsten und größten Wert, den Mittelwert und Median, sowie die beiden Quartile. Auch die Anzahl fehlender Werte (NAs) wird ausgegeben:

```
summary(food_production)
```

So sieht das Ergebnis aus:

![](<../../.gitbook/assets/image (41).png>)

Der erste Schritt ist getan, wir haben einen Datensatz in R geladen und ihn auf einer Variable als Dataframe gespeichert. Im nächsten Abschnitt lernen wir, wie wir mit verschiedenen Verben (Funktionen) einen Dataframe nach unseren Wünschen verändern können.
