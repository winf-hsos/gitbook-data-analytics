# Typische Fragen der explorativen Analyse

Die meisten Fragen in der explorativen Datenanalyse lassen sich auf eine kleine Zahl von Grundtypen reduzieren. Wenn wir verstehen, mit welchen Vorgehen wir diese Grundtypen beantworten können, dann haben wir für die meisten Fragen bereits ein Grundgerüst für das Vorgehen bei der Analyse.

Bei komplexen Fragen finden wir oft verschiedene Typen auf einmal. In diesem Fall besteht die Lösung aus mehreren Schritten. In jedem Schritt kann ein anderer Grundtyp das Gerüst für die Abfrage liefern.

Für die Namen der Grundtypen verwende ich Kombinationen aus Buchstaben und Zahlen. Jeder Buchstabe und jede Zahl hat eine bestimmte Bedeutung und gibt Hinweise auf die Logik des Grundtyps geben. Die Tabelle unten listet die verwendeten Abkürzungen und ihre Bedeutung auf.

| Abkürzung | Bedeutung                                                 |
| --------- | --------------------------------------------------------- |
| N         | Alle Daten                                                |
| 1         | Ein einziger Wert, z. B. eine Zahl oder eine Zeichenkette |
| A         | Verdichtung (_aggregation_)                               |
| F         | Filterung einer Menge zu einer Teilmenge (_filter_)       |
| G         | Gruppierung nach einem oder mehreren Merkmalen (_group_)  |
| O         | Sortieren (_order_)                                       |

## Verdichtung aller Daten zu einer Zahl (NA1)

Fragen wie _"Wie viele unterschiedliche Autoren sind im arXiv-Datensatz enthalten?"_ können im einfachsten Fall mit einer einzigen Zahl beantwortet werden. Es findet eine extreme Verdichtung der Daten statt: Alle Daten (Zeilen) werden zu einer Zahl verdichtet oder aggregiert.

![](../../../.gitbook/assets/archetypes\_all\_to\_1.png)

Eine entsprechende Abfrage in SQL formuliert könnte so aussehen. Dabei nehmen wir an, dass wir eine Spalte `author` haben, in der jeweils der Name eines Autors steht. Ein Paper mit mehreren Autoren hätte dann ebenso viele Zeilen:

```sql
select 
    count(distinct author) as `Anzahl Autoren`
from arxiv_metadata
```

## Verdichtung einer Teilmenge der Daten zu einer Zahl (NFA1)

Für die Darstellung des nächsten Archetyps ändern wir die Frage von oben wie folgt ab: _"Wie viele unterschiedliche Autoren haben Beiträge in der Kategorie 'Computer Science' veröffentlicht?"_

Auch diese Frage können wir mit einer einzigen Zahl beantworten. Jedoch ist hier nicht die Aggregation aller Daten (Zeilen) gefragt, sondern nur einer Teilmenge. Nämlich alle Beiträge aus einer bestimmten Kategorie. Wir benötigen somit einen zusätzlichen Schritt in unserer Analyse, um die Filterung der Untermenge vorzunehmen.

![](../../../.gitbook/assets/archetypes\_n\_f\_1.png)

## Gruppierung und Verdichtung zu einer Zahl (NGA1)

## Gruppierung, Verdichtung zu einer Zahl und Sortierung (NGAS1)

