---
description: >-
  Bei der deskriptiven Analyse werden große Datensätze zu wenigen Zahlen und
  Visualisierungen aggregiert. Das Ziel ist es, einen schnellen Überblick über
  einen unbekannten Datensatz zu erhalten.
---

# Daten zusammenfassen

Das Zusammenfassen von Daten nennen wir auch deskriptive Analyse. Dabei geht es in der deskriptiven Analyse nur um die _Darstellung_ der aggregierten Daten und nicht etwas um die Interpretation oder Aufstellung von Hypothesen, was bereits in die explorative Analyse fallen würde. Ein typisches und gleichzeitig extremes Beispiel für die Zusammenfassung von Daten ist die Frage nach der Anzahl an Datensätzen: Wie viele Kunden gibt es in der Datenbank? Wie viele Produkte haben wir? Wie viele Messpunkte wurden registriert? All diese Beispiele verdichten eine Vielzahl an Datensätzen zu nur einer einzigen Zahl (s. auch [den Abschnitt zu typischen Fragen der explorativen Analyse](broken-reference)), indem wir sie zählen.

Eine etwas differenzierte deskriptive Analyse wäre die Unterscheidung der Kunden nach PLZ, der Produkte nach Produktkategorie, oder der Messpunkte nach der Stunde am Tag. In diesem Fall ist das Ergebnis der Verdichtung nicht eine einzige Zahl, [sondern eine Zahl pro Gruppe](broken-reference) (PLZ, Produktkategorie, Stunde).

Zusammenfassen bedeutet nicht zwangsweise Zählen. Auch andere Berechnungen sind denkbar. Die Frage nach dem Umsatz eines Jahres könnten wir beispielsweise über eine Summenbildung beantworten. Die Frage nach dem durchschnittlichen Umsatz pro Bestellung dagegen über das arithmetische Mittel. Auch die Ermittlung des kleinsten oder größten Wertes ist eine Verdichtung von Daten. Weitere typische Größen in der deskriptiven Analyse sind der Median oder andere Perzentile, der häufigste Wert (Modus) sowie Streuungsmaße, wie die Standardabweichung oder die Spannweite (größter minus kleinster Wert).

| Art                | Größe                  |
| ------------------ | ---------------------- |
| Lageparameter      | Arithmetisches  Mittel |
|                    | Median                 |
|                    | Modus                  |
| Streuungsparameter | Minimum                |
|                    | Maximum                |
|                    | Spannweite             |
|                    | Varianz                |
|                    | Standardabweichung     |
