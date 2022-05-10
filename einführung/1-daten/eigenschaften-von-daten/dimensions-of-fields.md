---
description: >-
  Auch auf Spaltenebene können wir wichtige Dimensionen identifizieren und
  daraus bestimmte Eigenschaften ableiten.
---

# Eigenschaften einer Spalte

![Important dimensions of data records and fields with regard to analysis.](../../../.gitbook/assets/dataset\_record\_\_highlight\_fields\_2x.png)

## Skalierung

![A tree of scales data can be measured on.](../../../.gitbook/assets/tree\_of\_data\_scales.png)

### Kategorische Werte

#### Nominal

#### Binär

Die binäre Skala ist ein Spezialfall der Nominalskala. Die binäre Skala lässt nur 2 Werte zu, nämlich Wahr oder Falsch (`TRUE`/ `FALSE`).

Die binäre Skala wird in Werkzeugen und Datenbanken durch entsprechende Datentypen umgesetzt. In R gibt es dafür den Datentyp `LOGICAL`. In den meisten Programmiersprachen gibt es den Datentyp `BOOLEAN`, abgeleitet aus der [Bool'schen Algebra](https://de.wikipedia.org/wiki/Boolesche\_Algebra).

#### Ordinal

* Faktor

### Numerische Werte

#### Diskret

#### Kontinuierlich

## Datentyp

Unterschiedliche Werkzeuge und Datenbanken verwenden für die Darstellung von Daten unterschiedlicher Skalierung (s. oben) bestimmte Datentypen. Indem wir einer Variable einen Datentyp zuweisen, definieren wir, wie die Werte dieser Spalte grundsätzlich aussehen müssen.

### Datentypen in R

R unterscheidet grundsätzlich vier primitive Datentypen:

* `INTEGER`
* `DOUBLE`
* `CHARACTER`
* `LOGICAL`

Überdies gibt es weitere Datentypen in R, die sich jedoch aus diesen vier primitiven Datentypen ableiten. So gibt es etwa den `FACTOR`, der einen diskreten primitiven Datentyp (`INTEGER`, `CHARACTER`, `LOGICAL`) auf eine Nominalskala überträgt. Es gibt dann eine definierte Menge erlaubter Werte, denen implizit auch eine bestimmte Reihenfolge zugrunde liegt. Diese Reihenfolge ist intern immer vorhanden, muss aber nicht im Sinne einer Ordinalskala (z. B. besser/schlechter) verstanden werden, kann aber.

### Datentypen in relationalen Datenbanken

Relationale Datenbanken verfügen in den meisten Fällen über eine große Fülle an Datentypen. Je nach Anwendungsfall kann hier aus unterschiedlichen Varianten des gleichen Datentyps gewählt werden.&#x20;

#### Ganze Zahlen unterschiedlicher Größe

Die Oracle-Datenbank [unterscheidet allein für die Speicherung ganzer Zahlen die drei Datentypen](https://docs.oracle.com/cd/B19306\_01/olap.102/b14346/dml\_datatypes002.htm) `INTEGER`, `SHORTINTEGER` und `LONGINTEGER`. Die drei Datentypen unterscheiden sich nach der reservierten Größe in Byte und somit dem Wertebereich ganzer Zahlen, die abgebildet werden können. Wenn wir etwa das Alter einer Person in einer Spalte speichern wollen, so können wir den kleinsten der drei auswählen (`SHORTINTEGER`) und so unsere Datenbank insgesamt verkleinern.

#### Datum mit oder ohne Zeitangabe?

Wie auch R unterscheiden die meisten Datenbanken zwischen einem einfachen Datum im [ISO-Format](https://en.wikipedia.org/wiki/ISO\_8601) und einer Datumsangabe inklusive Uhrzeitangabe (ebenfalls im ISO-Standard definiert).

Die Microsoft SQL Server Datenbank in der Version 2019 [kennt gleich sechs verschiedene Formate für den Umgang mit Datum und Zeit](https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver15#date-and-time):

* `DATE`
* `DATETIME`
* `DATETIME2`
* `SMALLDATETIME`
* `DATETIMEOFFSET`
* `TIME`

Der einfache `DATE`-Typ kann zum Beispiel nur Werte wie "`2022-01-01`" speichern, während `DATETIME` so etwas wie "`2022-01-01 22:34`" abbilden kann, also auch die Uhrzeit mit Sekundengenauigkeit.

## Datenqualität

* Wie viele `NA`s?

## Wertebereich

##
