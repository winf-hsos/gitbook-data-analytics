---
description: >-
  Bei komplexen Analysen rate ich dazu, dass ihr euch zunächst ein Vorgehen
  unabhängig von der Umsetzung überlegt. Anschließend löst ihr das Problem
  schrittweise.
---

# Strukturieren komplexer Analysen

## Komplexe Probleme schrittweise lösen

In der Datenanalyse begegnen uns häufig Fragen, die wir nicht mit einer einzigen SQL-Abfrage beantworten können. Stattdessen müssen wir uns überlegen, welche Schritte zur Beantwortung notwendig sind und wie wir diese Schritte technisch implementieren. Im Englischen nennen wir diese Vorgehensweise auch _Divide & Conquer._

Wir wollen uns das an einem Beispiel aus der [Fallstudie des Sommersemester 2021](../../../data-sets-and-exercises/datensaetze/arxiv-papers.md) verdeutlichen. Hier lautete eine Frage:

> Welche Physiknobelpreisträger(innen) der Jahre 2000 bis 2020 haben jeweils wie viele Paper auf arXiv veröffentlicht?

Das Problem ist nicht ohne Weiteres lösbar, denn es sind nicht alle Informationen in den Daten selbst vorhanden. Es gibt etwa in dem Datensatz keine Information darüber, welche Autor\*innen Nobelpreise gewonnen haben. Deshalb sind mehrere Schritte notwendig, die wir uns im ersten Schritt aufschreiben können:

1. Recherchieren der Nobelpreisträger\*innen für Physik der Jahre 2000 - 2020.
2. Einfügen der Nobelpreisträger\*innen für Physik in ein Google Spreadsheet.
3. Laden des Google Spreadsheets als neue Tabelle in Databricks.
4. Verknüpfen der neuen Tabelle mit der Autoren-Spalte im Datensatz.
5. Plausibilisieren der Ergebnisse.
6. Erstellen einer geeigneten Visualisierung.

Beim Ausführen unseres Plans wird uns spätestens im 5. Schritt der Bedarf für Nachbesserungen auffallen. Zum Beispiel ist die Schreibweise der Namen im arXiv-Datensatz nicht einheitlich, sodass viele Paper der Nobelpreisträger\*innen nicht von unserer Abfrage erfasst werden. Wir müssen also einen weiteren Schritt in unseren Plan aufnehmen, um die unterschiedlichen Schreibweisen der Namen zu berücksichtigen.

![Ein großes Problem kann man in viele kleine Probleme teilen, die sich individuell einfacher lösen lassen.](../../../.gitbook/assets/divide\_and\_conquer.png)

## Möglichkeiten zur Umsetzung

### Unterabfragen

{% content-ref url="../../../sql/erweitertes-sql/subqueries.md" %}
[subqueries.md](../../../sql/erweitertes-sql/subqueries.md)
{% endcontent-ref %}

### Views

{% content-ref url="../../../sql/erweitertes-sql/views.md" %}
[views.md](../../../sql/erweitertes-sql/views.md)
{% endcontent-ref %}

### Common Table Expressions (CTEs)

{% embed url="https://spark.apache.org/docs/latest/sql-ref-syntax-qry-select-cte.html" %}

## Ansprechende Dokumentation mit Markdown

Komplexe Analysen erfordern neben einer guten Struktur auch eine gute und lesbare Dokumentation. Technisch könnt ihr diese in Databricks Notebooks mittels Markdown umsetzen. Wie das geht, ist an andere Stelle im Skript beschrieben:

{% content-ref url="die-arbeit-mit-notebooks/dokumentation-mit-markdown.md" %}
[dokumentation-mit-markdown.md](die-arbeit-mit-notebooks/dokumentation-mit-markdown.md)
{% endcontent-ref %}

