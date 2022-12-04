---
description: >-
  Das Paket dplyr enthält mächtige Funktionen für die Datentransformation. Wir
  lernen in diesem Abschnitt die wichtigsten kennen.
---

# Daten verändern

![Fünf häufige Operationen in der Datentransformation.](../../.gitbook/assets/actions\_in\_data\_transformation.png)

Die Abbildung oben visualisiert die fünf häufigsten Operationen bei der Datentransformation. Im Zentrum steht <mark style="background-color:yellow;">der Dataframe (oder Tibble) mit seinen Spalten und Zeilen</mark>. Wir lernen in diesem Abschnitt, wie wir die abgebildeten Operationen auf den Spalten und Zeilen eines Dateframe mit dem `dplyr` Paket umsetzen können.

Das folgende Video ist eine Aufzeichnung aus der Vorlesung im WS 2021/22, in der die Abbildung erläutert wird:

{% embed url="https://youtu.be/3fT93Z5jZfY" %}
Die 5 Operationen bei der Datentransformation mit dplyr.
{% endembed %}

## Pipes

Bevor wir mit der Transformation der Daten beginnen, müssen wir das Konzept der <mark style="background-color:yellow;">Pipes</mark> in R verstehen. Pipes erlauben uns, die Lesbarkeit unserer R-Skripte signifikant zu verbessern. Wir verwenden sie deshalb durchgängig in allen folgenden Analysen mit R:

{% content-ref url="pipes-in-r.md" %}
[pipes-in-r.md](pipes-in-r.md)
{% endcontent-ref %}

## Spalten auswählen

Die erste Möglichkeit der Datentransformation besteht in der Einschränkung der Spalten. Ein Datensatz hat häufig sehr viele Spalten. Für eine Analyse interessieren uns oft nur wenige davon. Wie können wir möglichst effizient nur bestimmte Spalten auswählen?

{% content-ref url="spalten-auswaehlen.md" %}
[spalten-auswaehlen.md](spalten-auswaehlen.md)
{% endcontent-ref %}

## Zeilen filtern

Neben der Einschränkung der Spalten benötigen wir eine Möglichkeit zur Reduzierung der betrachten Zeilen. Oft interessiert uns für eine Analyse nur eine Teilmenge der Daten. Wie können wir diese Teilmenge möglichst effizient erstellen?

{% content-ref url="zeilen-filtern.md" %}
[zeilen-filtern.md](zeilen-filtern.md)
{% endcontent-ref %}

## Spalten verändern

In manchen Fällen müssen wir weitere Berechnungen anstellen, die auf existierenden Spalten basieren. Dazu können wir eine neue Spalte in unseren Datensatz einfügen. Welche Möglichkeiten bietet uns R dazu?

{% content-ref url="spalten-veraendern/" %}
[spalten-veraendern](spalten-veraendern/)
{% endcontent-ref %}

## Zeilen sortieren

Das Sortieren von Zeilen so einfach wie mächtig. Mit einfacher auf- oder absteigender Sortierung finden wir die Zeilen mit den kleinsten oder größten Werten in einer bestimmten Spalte und können Top N Listen erstellen.

{% content-ref url="zeilen-sortieren.md" %}
[zeilen-sortieren.md](zeilen-sortieren.md)
{% endcontent-ref %}

## Daten zusammenfassen

Der Kern der Datenanalyse besteht in der Aggregation von Daten zu einer oder mehrerer aussagekräftiger Kennzahlen und deren anschließender Visualisierung. Wie können wir unsere Daten auf unterschiedliche Weise zusammenfassen und gruppieren?

{% content-ref url="daten-zusammenfassen.md" %}
[daten-zusammenfassen.md](daten-zusammenfassen.md)
{% endcontent-ref %}
