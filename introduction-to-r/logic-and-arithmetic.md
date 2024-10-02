---
description: >-
  Der einfachste Anwendungsfall für R ist ein umfangreicher Taschenrechner. Wir
  lernen im ersten Schritt die Möglichkeiten kennen, R für mathematische
  Berechnungen einzusetzen.
---

# Logic and Arithmetic

## Einfache Arithmetik

Wir können auf der R-Konsole arithmetische Ausdrücke eingeben und mit Strg + Enter oder dem Run-Button ausführen. Dabei gibt es die bekannten Operatoren, die in der Tabelle unten gelistet sind:

```r
1 + 1

# Ergebnis in der Konsole:
# > 1 + 1
# [1] 2
```

<table><thead><tr><th width="150">Operator</th><th width="218.59398496240604">Beschreibung</th><th width="150">Beispiel</th><th>Ergebnis</th></tr></thead><tbody><tr><td><code>+</code></td><td>Addition</td><td><code>41 + 1</code></td><td><code>42</code></td></tr><tr><td><code>-</code></td><td>Subtraktion</td><td><code>43 - 1</code></td><td><code>42</code></td></tr><tr><td><code>*</code></td><td>Multiplikation</td><td><code>2 * 21</code></td><td><code>42</code></td></tr><tr><td><code>/</code></td><td>Division</td><td><code>84 / 2</code></td><td><code>42</code></td></tr><tr><td><code>^</code></td><td>Potenzierung</td><td><code>8 ^ 2</code></td><td><code>64</code></td></tr><tr><td><code>%%</code></td><td>Modulo</td><td><code>142 %% 100</code></td><td><code>42</code></td></tr><tr><td><code>%/%</code></td><td>Ganzzahlige Division</td><td><code>142 %/% 100</code></td><td><code>1</code></td></tr></tbody></table>

## Vergleichsoperationen

R unterstützt die typischen Vergleichsoperationen mit entsprechenden Operatoren, die in der Tabelle unten aufgelistet sind:

<table><thead><tr><th width="150">Operator</th><th width="218.59398496240604">Beschreibung</th><th width="150">Beispiel</th><th>Ergebnis</th></tr></thead><tbody><tr><td><code>></code></td><td>Größer</td><td><code>42 > 41</code></td><td><code>TRUE</code></td></tr><tr><td><code>&#x3C;</code></td><td>Kleiner</td><td><code>42 &#x3C; 41</code></td><td><code>FALSE</code></td></tr><tr><td><code>&#x3C;=</code></td><td>Kleiner gleich</td><td><code>41 &#x3C;= 41</code></td><td><code>TRUE</code></td></tr><tr><td><code>>=</code></td><td>Größer gleich</td><td><code>41 >= 42</code></td><td><code>FALSE</code></td></tr><tr><td><code>==</code></td><td>Gleich</td><td><code>1 + 1 == 2</code></td><td><code>TRUE</code></td></tr><tr><td><code>!=</code></td><td>Ungleich</td><td><code>42 != 41</code></td><td><code>TRUE</code></td></tr></tbody></table>

## Logikoperationen

Logikoperatoren dürfen in keiner Programmiersprache fehlen. Schließlich ist Logik ein wesentlicher Bestandteil der Informationsverarbeitung. Die Tabelle unten listet die wichtigsten Logikoperatoren und deren Umsetzung in R.

Logikoperatoren spielen besonders bei der Verwendung von [Kontrollstrukturen](../einfuehrung-in-r/kontrollstrukturen.md) eine wichtige Rolle. Hier geht es darum, basierend auf definierten Bedingungen zu entscheiden, ob ein bestimmter Codeblock ausgeführt werden soll oder nicht. Um Bedingungen miteinander zu verknüpfen, benötigen wir logische Verknüpfungen wie UND oder ODER.



<table><thead><tr><th width="150">Operator</th><th width="218.59398496240604">Beschreibung</th><th width="150">Beispiel</th><th>Ergebnis</th></tr></thead><tbody><tr><td><code>!</code></td><td>Verneinung</td><td><code>!1==1</code></td><td><code>FALSE</code></td></tr><tr><td><code>&#x26;</code></td><td>Und (Element-basiert)</td><td><code>1==1 &#x26; 2==1</code></td><td><code>FALSE</code></td></tr><tr><td><code>&#x26;&#x26;</code></td><td>Und (Objekt-basiert)</td><td>s. Unten</td><td>-</td></tr><tr><td><code>|</code></td><td>Oder (Element-basiert)</td><td><code>1==1 | 2==1</code></td><td><code>TRUE</code></td></tr><tr><td><code>||</code></td><td>Oder (Objekt-basiert)</td><td>s. Unten</td><td>-</td></tr></tbody></table>
