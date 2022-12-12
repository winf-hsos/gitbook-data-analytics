---
description: >-
  Für die Arbeit mit Daten bietet R für jeden Anwendungsfall eine geeignete
  Struktur. In diesem Abschnitt lernen wir die wichtigsten davon kennen.
---

# Data structures

In R gibt es eine Vielfalt an Datenstrukturen, mit denen wir Informationen abbilden können:

* Skalare Werte
* Vektoren
* Matrizen
* Listen
* Dataframes (und [Tibbles](../data-visualization-with-r/14-daten-laden-und-sichten/tidyverse-und-tibbles.md#tibbles))

## Skalare Werte

Kommt bald.

## Vektoren

Ein Vektor beinhaltet Elemente **des gleichen Datentyps**. Das ist der Unterschied zu einer Liste, in der ganz unterschiedliche Elemente nebeneinander existieren können.&#x20;

### Vektoren erzeugen

Wir können einen Vektor mit der Funktion `c()` erstellen:

```r
# Mit der Funktion c() erstellen wir einen Vektor
vec <- c(1, 3, 5, 7)
```

### Die Länge eines Vektors bestimmen

Wir können Vektoren nach ihrer Anzahl Elemente fragen:

```
length(vec)
# [1] 4
```

### Elemente eines Vektors adressieren

```r
# Das erste Element eines Vektors steht an der nullten Stelle
vec[0]
```

### Vektoren miteinander kombinieren

Wir können auch Vektoren miteinander verbinden, indem wir sie der `c()` Funktion als Parameter übergeben:

```r
vec1 <- c(1, 3, 5, 7)
vec2 <- c("Apple", "Banana")
vec3 <- c(vec1, vec2)
vec3
# [1] "1"  "3"  "5"  "7" "Apple" "Banana"
```

In dem Beispiel oben sehen wir, was passiert, wenn wir versuchen einen Vektor mit Elementen unterschiedlicher Datentypen zu erstellen. Der erste Vektor besteht aus Zahlen, während der zweite aus Zeichenketten besteht. Fügen wir nun beide zusammen, konvertiert R alle Elemente in den kleinsten gemeinsamen Datentyp. In diesem Fall ist das die Zeichenkette (String), da die beiden Werte „Apple“ und „Banana“ nicht in eine Zahl überführbar sind.

## Matrizen

Folgt bald.

## Listen

Folgt bald.

## Dataframes

Folgt bald.

{% content-ref url="broken-reference" %}
[Broken link](broken-reference)
{% endcontent-ref %}
