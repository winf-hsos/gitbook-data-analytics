---
description: >-
  Datensätze haben oft sehr viele Spalten. Für eine bestimmte Analyse
  interessiert uns meistens nur ein kleiner Teil davon. Mit R können wir Spalten
  flexibel auswählen.
---

# Spalten auswählen

## Bestimmte Spalten anhand des Namens auswählen

Wir können mit R einzelne Spalten eines Dataframes anzeigen:

{% tabs %}
{% tab title="Tibble" %}
```r
# Der select-Befehl kann für die Auswahl bestimmter Spalten verwendet werden
food_production %>% select("food_product")
```
{% endtab %}

{% tab title="R-Dataframe" %}
```r
food_production["food_product"]
```
{% endtab %}
{% endtabs %}

Es lassen sich auch mehr als eine Spalte angeben, wenn wir die Namen mit Komma separiert auflisten:

{% tabs %}
{% tab title="Tibble" %}
```r
# Auch mehrer Spalten lassen sich auswählen
food_production %>% select("food_product", "transport")
```
{% endtab %}

{% tab title="R-Dataframe" %}
```r
fp_df[ c("food_product", "transport") ]
```
{% endtab %}
{% endtabs %}

## Spalten mit einem Namensmuster auswählen

Oft beabsichtigen wir Spalten auszuwählen, die ein bestimmtes Namensmuster aufweisen. Antwortspalten beinhalten etwa zu einer bestimmten Frage in der Marktforschung oft das Kürzel der Frage. Um alle Antwortspalten zu einer bestimmten Frage zu selektieren, könnten wir nach diesem Kürzel suchen. Mit `dplyr` und `select()` ist das einfach umsetzbar:

```r
# Alle Spalten, die mit "freshwater" beginnen
food_production %>% select(starts_with("freshwater"))

# Alle Spalten, die "liter_per" im Namen haben (egal wo)
food_production %>% select(contains("liters_per"))

# Alle Spalten, die auf "protein" enden
food_production %>% select(ends_with("protein"))
```

Zu diesen drei Funktionen kommt noch eine sehr flexible Möglichkeit, Spalten anhand eines [regulären Ausdrucks](https://en.wikipedia.org/wiki/Regular\_expression) zu selektieren:

```r
# Spalten, die mindestens ein Leerzeichen enthalten (Ergebnis hier: keine)
food_production %>% select(matches("\\s"))
```

Weiterführende Dokumentation zu diesen vier Funktionen findet ihr hier:

{% embed url="https://tidyselect.r-lib.org/reference/starts_with.html" %}

## Bestimmte Spalten aus der Auswahl ausschließen

Wir können mit der `select()` Funktion auch Spalten aus der Auswahl ausschließen, indem wir ein Minuszeichen vor den Spaltennamen setzen:

```r
# Alle Spalten außer "land_use_change" und "animal_feed"
food_production %>% select(-"land_use_change", -"animal_feed")
```

Wir können das Minuszeichen auch in Kombination mit den bereits vorgestellten Funktionen verwenden:

```r
# Alle Spalten ausschließem, die auf "protein" enden
food_production %>% select(-ends_with("protein"))
```

## Die ersten und letzten Spalten auswählen

Mit `last_col()` können wir die letzte Spalte eines Tibble auswählen:

```r
food_production %>% select(last_col())
```

Als Parameter der Funktion können wir ein Offset übergeben, um die x-letzte Spalte auszuwählen:

```r
# Auswählen der vorletzten Spalte
food_production %>% select(last_col(2))
```

In Kombination mit dem Doppelpunkt `:` können wir so bestimmte aufeinanderfolgende Spalten auswählen:

```r
# Alle Spalten ab der Zweiten bis zur vorletzten
food_production %>% select(2 : last_col(2))
```

## Spalten nach Datentyp selektieren

Wir können mit der `where()` Funktion auch Spalten bezüglich des Datentyps auswählen:

```r
food_production %>% select(where(is.numeric))
food_production %>% select(where(is.character))
food_production %>% select(where(is.logical))
food_production %>% select(where(is.factor))
```

Für Datumsspalten existiert leider keine Funktion. Wir können uns diese aber selbst erstellen und anschließend verwenden (s. [Eintrag auf Stackoverflow](https://stackoverflow.com/questions/18178451/is-there-a-way-to-check-if-a-column-is-a-date-in-r)):

```r
# Funktion, um Datumsspalten zu erkennen
is.Date <- function(x) {
  inherits(x, c("Date", "POSIXt"))
}

covid %>% select(where(is.Date))
```

## Mengen von Spalten definieren und selektieren

Häufig benötigt man mehrmals die gleichen Spalten. Um nicht jedes Mal die gesamte Liste aufführen zu müssen, können wir in diesem Fall einen Vektor definieren, der die Namen der Spalten enthält. Mit der `all_of()` Funktion können wir dann alle Spalten in diesem Vektor auswählen:

```r
# Erstellen eines Vektors mit gewünschten Spaltennamen
vars_logistics <- c("transport", "packging", "retail")

# Selektieren auf Basis dieser Menge
food_production %>% select(all_of(vars_logistics))

# Selektieren auf Basis dieser Menge, aber ohne "transport"
food_production %>% select(all_of(vars_logistics), -transport)
```

Mit `any_of()` können wir auch Spalten im Vektor aufnehmen, die nicht existieren. Es werden alle Spalten selektiert, die in der Liste vorkommen und auch tatsächlich im Tibble vorhanden sind. So können wir einen Vektor erstellen, der Spaltennamen aus unterschiedlichen Datensätzen beinhaltet:

```r
# Erstellen eines Vektors mit gewünschten Spaltennamen, "shipping" existiert nicht im Tibble
vars_logistics <- c("transport", "packging", "retail", "shipping")

# Selektieren auf Basis dieser Menge, "shipping" ist jedoch nicht vorhanden
food_production %>% select(all_of(vars_logistics))
```

## Weiterführende Quellen

Die offizielle Dokumentation beinhaltet weitere Informationen und Beispiele:

{% embed url="https://dplyr.tidyverse.org/reference/select.html" %}

In Kapitel 5 des Buches „R for Data Science“ wird die Datentransformation mit `dplyr` behandelt. Der folgende Link führt direkt zum Abschnitt über die `select` Funktion:

{% embed url="https://r4ds.had.co.nz/transform.html#select" %}
