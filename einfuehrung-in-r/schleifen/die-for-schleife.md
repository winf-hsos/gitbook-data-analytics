---
description: >-
  Die FOR-Schleife ist immer dann passend, wenn wir die Anzahl der
  Schleifendurchläufe vorab bestimmen können.
---

# Die For-Schleife

Die FOR-Schleife erlaubt es uns, einen Codeblock eine bestimmte Anzahl Male hintereinander auszuführen, ohne dass wir den Code selbst wiederholen müssen. Nehmt den folgenden Code als Beispiel:

```r
i <- 1
print(i)

i <- i + 1
print(i)

i <- i + 1
print(i)

i <- i + 1
print(i)

i <- i + 1
print(i)
```

Was ist die Ausgabe des obigen Codes? Es wird fünfmal nacheinander die Variable `i` auf der Konsole ausgegeben und jedes Mal hat `i` einen anderen Wert.&#x20;

```
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
```

Nach jeder Ausgabe mit `print` wird der Wert von `i` um Eins erhöht. Wir wissen vor der Ausführung des Codes schon, dass wir `i` insgesamt viermal erhöhen, bis der es den Wert 5 angenommen hat. In einem solchen Fall können wir unseren Code mithilfe einer FOR-Schleife deutlich vereinfachen und verkürzen:

```r
for(i in 1:5) {
    print(i)
}
```

Die Ausgabe ist identisch zum ersten Programm. Der Code aber viel kürzer und übersichtlicher.

## Mehr lesen

{% embed url="https://rstudio-education.github.io/hopr/loops.html#for-loops" %}
