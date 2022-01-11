---
description: >-
  Das relationale Modell wir häufig in klassischen Datenbanksystemen für die
  Modellierung von Informationen verwendet. Bei Analysen stellt es uns vor
  Herausforderungen.
---

# Das relationale Modell

## Das Relationale Modell

### Informationen liegen in mehreren Tabellen vor

Im weit verbreiteten **relationalen Datenbankmodell** werden Informationen zu Objekten in getrennten Tabellen gespeichert. So werden Stammdaten der Kunden z.B. in einer Tabelle `customers` abgelegt, die Verkäufe in der Tabelle `orders`, und die Produkte wiederum in der Tabelle `products`. Das hat Vorteile bei der _Verwaltung_ dieser Informationen, weil wir einen Kunden so nur einmal und nicht redundant mehrfach speichern müssen. Das Gleiche gilt für die Produkte.

![Ein einfaches relationales Modell mit 2 verknüpften Tabellen.](../../.gitbook/assets/Advanced\_SQL\_-\_Joins\_Data\_Model.svg)

### Für Analysen benötigen wir oft Informationen aus mehreren Tabellen

Wollen wir jedoch Analysen durchführen, die Informationen zu allen 3 Objekten benötigen, erhöht sich durch die Aufteilung auf 3 Tabellen die Komplexität: Wir müssen die Tabellen in der SQL-Abfrage zuerst verknüpfen.

Beispiel: Was ist die Top 5 der Produkte nach Umsatz in jedem PLZ-Gebiet? Um diese Frage zu beantworten, benötigen wir Stammdaten der Kunden (PLZ), die Verkäufe (Summe Umsatz) sowie die Produkte (Produktbezeichnung).
