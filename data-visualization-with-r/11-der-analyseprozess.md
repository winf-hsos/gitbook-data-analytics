# Der Analyseprozess

## Explorative Datenanalyse mit R

Dieser Abschnitt führt euch in die Grundlagen der <mark style="background-color:yellow;">explorativen Datenanalyse</mark> mit R ein. In der explorativen Datenanalyse versuchen wir einen unbekannten Datensatz mit geeigneten Verfahren kennenzulernen und schnell Muster in den Daten zu erkennen. Auf Basis dieser Muster formulieren wir Hypothesen. Diese Hypothesen können anschließend mit statistischen Modellen aus dem Bereich der schließenden Statistik auf ihre Gültigkeit überprüft werden. Dieser Schritt ist jedoch nicht Teil der explorativen Datenanalyse.

Eine ausgezeichnete Einführung in die explorative Datenanalyse mit R gibt auch das Buch [R for Data Science](https://r4ds.had.co.nz/) von Hadley Wickham und Garrett Grolemund. Das Buch ist als Online-Buch frei zugänglich.

![Der Datenanalyseprozess nach Wickham & Grolemund 2016.](<../.gitbook/assets/image (46) (1).png>)

Wickham und Grolemund definieren den Datenanalyseprozess durch eine Abfolge bestimmter Schritte, wie in der Abbildung gezeigt. In diesem Abschnitt stehen die rot markierten Schritte im Fokus.&#x20;

### Die Arbeitsumgebung

Im ersten Schritt lernen wir die Arbeitsumgebung kennen. Diese besteht aus der <mark style="background-color:yellow;">R-Software</mark> und dem <mark style="background-color:yellow;">RStudio als Entwicklungsumgebung</mark>, die wir im ersten Schritt installieren und die wichtigsten Funktionen kennenlernen.

{% content-ref url="../einfuehrung-in-r/die-arbeitsumgebung.md" %}
[die-arbeitsumgebung.md](../einfuehrung-in-r/die-arbeitsumgebung.md)
{% endcontent-ref %}

### Daten laden

Jeder Analyseprozess beginnt mit dem <mark style="background-color:yellow;">Laden eines Datensatzes</mark>. Dabei gibt es verschiedene Datenquellen, die in Betracht gezogen werden müssen. Ein häufig verwendetes Format sind Komma-separierte Werte (_**c**omma **s**eparated **v**alues_ = CSV) in einfachen Textdateien. Dieses Format steht auch hier im Vordergrund.

{% content-ref url="broken-reference" %}
[Broken link](broken-reference)
{% endcontent-ref %}

Gemäß der Abbildung aus Wickham und Grolemund 2016 folgt auf das Laden der Daten der Arbeitsschritt „Tidy“. Dieser ist dann notwendig, wenn die Daten nicht in der typischen Form bestehend aus Spalten und Zeilen vorliegen. Leider ist das in der Praxis oft der Fall. In diesem Kurs wird aber zunächst davon ausgegangen, dass die Daten das entsprechende Format aufweisen. Die interessierte Leserin verweise ich auf das [Kapitel 12 im Buch „R for Data Science“](11-der-analyseprozess.md#explorative-datenanalyse-mit-r).

### Daten transformieren

Das Ziel der explorativen Datenanalyse ist die Visualisierung der Daten mit geeigneten Diagrammen, um interessante Muster sichtbar werden zu lassen. Visualisierungen benötigen häufig nur einen Teil der Daten (wenige Spalten oder bestimmte Zeilen). Auch müssen wir oft neue Spalten berechnen oder bestehende Daten aggregieren, bevor wir sie visualisieren können. Alle diese Aufgaben können wir unter dem Bereich der <mark style="background-color:yellow;">Datentransformation</mark> zusammenfassen.

Für diese Aufgaben bietet R mit dem Paket `dplyr` mächtige Funktionen. Insbesondere lernen wir in dem Abschnitt:

* Wie wir bestimmte Spalten auswählen können (`select`).
* Wie wir Zeilen fast beliebig filtern können (`filter`).
* Wie wir neue, berechnete Spalten hinzufügen können (`mutate`).
* Wie wir Zeilen sortieren können (`arrange`).
* Wie wir Zeilen zusammenfassen und gruppieren können (`summarize` und `group_by`)

{% content-ref url="../data-transformation-with-r/five-transformations.md" %}
[five-transformations.md](../data-transformation-with-r/five-transformations.md)
{% endcontent-ref %}

### Daten visualisieren

Das wichtigste Werkzeug in der explorativen Datenanalyse ist die <mark style="background-color:yellow;">Visualisierung von Daten</mark>. In R steht uns dafür mit `ggplot2` ein leistungsfähiges Instrument zur Verfügung. Wir lernen für bestimmte Anwendungsfälle die richtigen Visualisierungen zu identifizieren und mit `ggplot2` umzusetzen.

{% content-ref url="16-daten-visualisieren-mit-ggplot2/" %}
[16-daten-visualisieren-mit-ggplot2](16-daten-visualisieren-mit-ggplot2/)
{% endcontent-ref %}

## Literatur

### Bücher

Wickham, Hadley, and Garrett Grolemund. R for Data Science: Import, Tidy, Transform, Visualize, and Model Data. First edition, O’Reilly, 2016. Online verfügbar: [https://r4ds.had.co.nz/](https://r4ds.had.co.nz/)

Wickham, Hadley. ggplot2. Springer Science+Business Media, LLC, 2016. Online verfügbar: [https://ggplot2-book.org/](https://ggplot2-book.org/)

Kabacoff, Robert. R in Action: Data Analysis and Graphics with R. Second edition, Manning, 2015.

Sauer, Sebastian. Moderne Datenanalyse mit R: Daten einlesen, aufbereiten, visualisieren, modellieren und kommunizieren. Springer Gabler, 2019. Online verfügbar: [https://link.springer.com/book/10.1007/978-3-658-21587-3](https://link.springer.com/book/10.1007/978-3-658-21587-3)

### Online-Dokumentationen

Die offizielle Dokumentation der Tidyverse-Bibliotheken:

{% embed url="https://www.tidyverse.org/" %}

Ein Tutorial für die Einführung in R mit RStudio:

{% embed url="https://ourcodingclub.github.io/tutorials/intro-to-r/" %}

Ein Tutorial zu den Grundlagen der Datenmanipulation mit R, `tidyr` und `dplyr`:

{% embed url="https://ourcodingclub.github.io/tutorials/data-manip-intro/" %}

Zwei weiterführende Anleitungen zur Datenmanipulation mit `dplyr`:

{% embed url="https://ourcodingclub.github.io/tutorials/data-manip-efficient/" %}

{% embed url="https://ourcodingclub.github.io/tutorials/data-manip-creative-dplyr/" %}
