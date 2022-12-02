---
description: >-
  Der einfachste Anwendungsfall für R ist ein umfangreicher Taschenrechner. Wir
  lernen im ersten Schritt die Möglichkeiten kennen, R für mathematische
  Berechnungen einzusetzen.
---

# Rechnen mit R

## Einfache Arithmetik

Wir können auf der R-Konsole arithmetische Ausdrücke eingeben und mit Strg + Enter oder dem Run-Button ausführen. Dabei gibt es die bekannten Operatoren, die in der Tabelle unten gelistet sind:

```r
1 + 1

# Ergebnis in der Konsole:
# > 1 + 1
# [1] 2
```

| Operator | Beschreibung         | Beispiel      | Ergebnis |
| -------- | -------------------- | ------------- | -------- |
| `+`      | Addition             | `41 + 1`      | `42`     |
| `-`      | Subtraktion          | `43 - 1`      | `42`     |
| `*`      | Multiplikation       | `2 * 21`      | `42`     |
| `/`      | Division             | `84 / 2`      | `42`     |
| `^`      | Potenzierung         | `8 ^ 2`       | `64`     |
| `%%`     | Modulo               | `142 %% 100`  | `42`     |
| `%/%`    | Ganzzahlige Division | `142 %/% 100` | `1`      |

## Vergleichsoperationen

R unterstützt die typischen Vergleichsoperationen mit entsprechenden Operatoren, die in der Tabelle unten aufgelistet sind:

| Operator | Beschreibung   | Beispiel     | Ergebnis |
| -------- | -------------- | ------------ | -------- |
| `>`      | Größer         | `42 > 41`    | `TRUE`   |
| `<`      | Kleiner        | `42 < 41`    | `FALSE`  |
| `<=`     | Kleiner gleich | `41 <= 41`   | `TRUE`   |
| `>=`     | Größer gleich  | `41 >= 42`   | `FALSE`  |
| `==`     | Gleich         | `1 + 1 == 2` | `TRUE`   |
| `!=`     | Ungleich       | `42 != 41`   | `TRUE`   |

## Logikoperationen

Logikoperatoren dürfen in keiner Programmiersprache fehlen. Schließlich ist Logik ein wesentlicher Bestandteil der Informationsverarbeitung. Die Tabelle unten listet die wichtigsten Logikoperatoren und deren Umsetzung in R.

Logikoperatoren spielen besonders bei der Verwendung von [Kontrollstrukturen](kontrollstrukturen.md) eine wichtige Rolle. Hier geht es darum, basierend auf definierten Bedingungen zu entscheiden, ob ein bestimmter Codeblock ausgeführt werden soll oder nicht. Um Bedingungen miteinander zu verknüpfen, benötigen wir logische Verknüpfungen wie UND oder ODER.



| Operator | Beschreibung           | Beispiel       | Ergebnis |
| -------- | ---------------------- | -------------- | -------- |
| `!`      | Verneinung             | `!1==1`        | `FALSE`  |
| `&`      | Und (Element-basiert)  | `1==1 & 2==1`  | `FALSE`  |
| `&&`     | Und (Objekt-basiert)   | s. Unten       | -        |
| `\|`     | Oder (Element-basiert) | `1==1 \| 2==1` | `TRUE`   |
| `\|\|`   | Oder (Objekt-basiert)  | s. Unten       | -        |
