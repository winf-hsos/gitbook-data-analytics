# Überblick

## Welches Werkzeug ist das richtige?

Für die Arbeit mit Daten existieren viele gute Werkzeuge. Die Funktionen der Werkzeuge überlappen oft und gleichzeitig hat jedes Werkzeug seine individuellen Stärken. In diesem Abschnitt gebe ich euch meine Einschätzung zu den Werkzeugen, die euch in diesem Buch begegnen und mit denen wir in den meinen Kursen mit Bezug zur Datenanalyse arbeiten.

## SQL

{% hint style="info" %}
SQL hat seine Stärken in der **Abfrage von Datenbanken** sowie in der **Verarbeitung von Daten**, wie beispielsweise der **Filterung**, **Aggregation** und **Sortierung**.
{% endhint %}

SQL steht für _Structured Query Language_ und hat seine Wurzeln bei den relationalen Datenbanken. Relationale Datenbanken wurden in den 1970er-Jahren zuerst entwickelt und kommerziell eingeführt. Sie werden vorrangig für die Verwaltung von strukturierten, operativen Geschäftsdaten verwendet. Bis heute sind relationale Datenbanken weitverbreitet, wir finden sie zum Beispiel in großen Informationssystemen wie einem ERP-System der Firma SAP.

Die Abfragesprache SQL wurde entwickelt, um relationale Datenbanken möglichst einfach abfragen zu können. Dabei lassen sich mit SQL Daten nicht nur abfragen, sondern auch erzeugen, verändern oder löschen. In diesem Buch geht es um die _Analyse_ von Daten und wir betrachten deshalb nur die Möglichkeiten zur Abfrage von Daten.

Weil es viele unterschiedliche kommerzielle Hersteller relationaler Datenbanken gibt (z. B. [Oracle](https://www.oracle.com/database/), [SAP](https://www.sap.com/products/hana.html), [Microsoft](https://www.microsoft.com/de-de/sql-server), [Teradata](https://www.teradata.de)) und daneben viele Open Source Produkte (z. B. [MySQL](https://www.mysql.com), [PostgreSQL](https://www.postgresql.org)) wurde SQL 1986 standardisiert (s. ANSI  X3.135 und  [ISO 9075-1987](https://www.iso.org/standard/16661.html)). Trotz der Standardisierung, in der die grundlegende Syntax und der Funktionsumfang festgelegt wurden, gibt es heute unterschiedliche Dialekte von SQL. Diese unterscheiden sich in Details wie ob eine spezifische erweiterte Funktion existiert oder nicht. Durch die Standardisierung gilt aber: Wenn man SQL in _einem_ Dialekt beherrscht, dann ist es ohne Probleme möglich auch andere Dialekte zu verwenden.

SQL ist somit unverzichtbar, wenn wir Daten aus relationalen Datenbanken abfragen oder exportieren wollen. Da viele Informationssysteme in Unternehmen auf relationalen Datenbanken basieren, spielt SQL gerade im betriebswirtschaftlichen Kontext eine große Rolle. Wegen der weiten Verbreitung von SQL ermöglichen auch andere Werkzeuge, Daten mit dieser Sprache zu analysieren. Ein Beispiel ist [Apache Spark](https://spark.apache.org), ein Open-Source Werkzeug für die Verarbeitung und Analyse großer Datenmengen (Big Data). Hier gibt es eine eigene Schnittstelle (API) für SQL, die den Namen [Spark SQL](https://databricks.com/glossary/what-is-spark-sql) trägt. Wir verwenden Spark SQL in meinen Kursen in der [Databricks Cloud-Umgebung](https://databricks.com). Klickt auf den Link unten, um direkt mit SQL zu beginnen.

{% content-ref url="../../sql/grundlagen-sql/" %}
[grundlagen-sql](../../sql/grundlagen-sql/)
{% endcontent-ref %}

## R

{% hint style="info" %}
Die Stärken von R liegen in der **Anwendung statistischer Methoden** und der **professionellen** **Visualisierung von Daten**. Durch die Open-Source-Verfügbarkeit und die zahlreichen Pakete bietet R einen **sehr großen Funktionsumfang für die Datenanalyse**.
{% endhint %}

Während SQL seine Stärken in der Abfrage und Verarbeitung von Daten hat, liegt die große Stärke von [R](https://www.r-project.org) in der Anwendung von statistischen Berechnungen sowie der Visualisierung von Daten. R ist eine Programmiersprache und Entwicklungsumgebung zugleich. R ist eine sehr beliebte Sprache für die Datenanalyse, was auf drei Gründe zurückzuführen ist. Zum einen ist R als Open-Source-Software kostenlos nutzbar. Gleichzeitig ist R für alle Betriebssysteme verfügbar und kann relativ einfach auf jedem Rechner installiert werden. Beides hat zu einer hohen Verbreitung und in der Konsequenz zu einer großen Community geführt, die eine Fülle an [hochwertigem Material für das Erlernen von R](../../linksammlung-zu-r.md) erstellt hat. Daneben gibt es eine Menge an sogenannten _Packages_, die in einem R-Programm geladen werden können und die den Funktionsumfang der Sprache erweitern.

Ein Beispiel für ein Package ist [`ggplot2`](https://ggplot2.tidyverse.org), das Teil des Meta-Package [Tidyverse](https://www.tidyverse.org) ist. Tidyverse ist eine sorgfältig zusammengestellte Sammlung an Packages speziell für Data Science Aufgaben. Alle Pakete im Tidyverse folgen einer gemeinsamen Idee, wie wir über Daten denken und wie Werkzeuge für die Datenanalyse funktionieren sollen. Mit `ggplot2` lassen sich fast beliebige Visualisierungen erstellen. Der Vorteil der Datenvisualisierung mit R im Vergleich zu Tools wie Tableau liegt darin, dass die Visualisierung in einem Skript erstellt wird. Das macht sie wiederholt ausführbar und somit automatisierbar. Ändern sich etwa die Daten in der Datenquelle, kann das R-Skript erneut ausgeführt werden und sämtliche darin erzeugt Grafiken sind auf dem aktuellen Stand. Auch ist ein Skript leicht mit anderen teilbar (z. B. via [GitHub](https://github.com)) und somit die Wiederverwendung einfacher möglich. Änderungen, etwa die Schriftart für die Achsenbeschriftungen, müssen nur einmal verändert werden und gelten sofort für alle Visualisierungen (existierende oder neue).

## Python

{% hint style="info" %}
Python als vollwertige Programmiersprache wird nicht nur in der Datenanalyse verwendet. Auch wenn Python in der Datenanalyse vielfältig einsetzbar ist, liegt seine Stärke in der Anwendung von **Maschinellem Lernen**. Bekannte und weitverbreitete Bibliotheken wie [TensorFlow](https://www.tensorflow.org) von Google, [PyTorch](https://pytorch.org) von Facebook oder [scikit-learn](https://scikit-learn.org/stable/index.html) wurden in Python geschrieben.
{% endhint %}

## Tableau

{% hint style="info" %}
[Tableu Desktop](https://www.tableau.com/products/desktop) ist ein Werkzeug für die **Visualisierung von Daten**. Im Vergleich zu der Skript-basierten Datenvisualisierung mit R oder Python arbeiten wir in Tableau auf einer grafischen Benutzeroberfläche mittels Drag & Drop. Besonders die Möglichkeit, **interaktive Visualisierungen und Dashboards** zu erstellen, zeichnet Tableau aus. Tableau basiert wie `ggplot2` auf der Grammar of Graphics.
{% endhint %}
