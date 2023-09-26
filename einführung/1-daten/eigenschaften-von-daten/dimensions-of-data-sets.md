---
description: >-
  Um Datensätze genauer beschreiben und einordnen zu können, schauen wir uns
  wichtige Dimensionen und deren möglichen Ausprägungen an.
---

# Datensätze

Die folgende Abbildung skizziert Dimensionen von Datensätzen, die bei der Analyse wichtig sein können.

![Important dimensions to classify data sets for analysis.](<../../../.gitbook/assets/dataset\_dimensions\_2x (1).png>)

## Die 3V

Eine Reihe von Definitionen schlagen die sogenannten 3Vs vor, um zu entscheiden, ob Daten "Big" sind oder nicht. Unabhängig davon, ob wir von "Big Data" sprechen oder nicht, dienen die 3Vs als nützliche Dimensionen bei der Entscheidung über die Methoden zur Verarbeitung und Analyse eines gegebenen Datensatzes.

### Volume

Das erste "V" steht für das Volumen des Datensatzes. Wir messen das Datenvolumen mit den Begriffen Bits, Bytes, Megabytes, Gigabytes und so weiter. Das V beantwortet die Frage: Wie viele Nullen und Einsen benötigen wir, um die Daten auf einem Speichermedium wie einer Festplatte oder dem Arbeitsspeicher (RAM) des Computers abzubilden?&#x20;

Abhängig von der Antwort müssen wir unterschiedliche Maßnahmen ergreifen, um die Daten zu analysieren. Die wichtigste Frage dabei ist, ob die Daten auf einer einzelnen Maschine (Laptop, Server) verarbeitet und analysiert werden können? Oder benötigen wir eine Reihe von miteinander verbundenen Maschinen (ein sogenanntes Cluster), um die Daten und die Verarbeitungslast auf mehrere Knoten zu verteilen?&#x20;

Es gibt keine einheitliche Antwort auf diese Frage, da sie von der verwendeten Hardware sowie von den Arten der Analyse abhängt, die wir durchführen wollen. Benötigt eine Abfrage den gesamten Datensatz? Oder benötigen wir nur eine Teilmenge der Daten? Da die Hardware immer leistungsfähiger wird, werden die Grenzen jeden Tag weiter verschoben.

### Velocity

Das zweite "V" befasst sich mit der Häufigkeit, mit der neue Daten von der Quelle erzeugt werden. Nehmen wir das Beispiel von Sensordaten in einer Fertigung. Hier werden potenziell Millionen von Datensätzen pro Sekunde erzeugt. Das erhöht die Geschwindigkeit (_Velocity_) und entsprechend die Anforderungen an unsere Datenerfassungslösung.

Die Frequenz der Datenerzeugung ist nicht der einzige relevante Faktor. Es ist ein großer Unterschied, ob wir neue Datensätze in Echtzeit analysieren müssen, oder ob wir die Daten lediglich sammeln und etwa alle 24 Stunden eine Batch-Analyse durchführen. Ersteres erfordert eine aufwändige Echtzeit-Streaming-Lösung. Letzteres kann durch einfache Batch-Skripte (z. B. SQL, Python oder R) erreicht werden, die einmal pro Tag laufen. Weil Batch-Analysen oft in den Randzeiten stattfinden (können), also beispielsweise nachts, spielt die Laufzeit der Skripte in der Regel eine untergeordnete Rolle. Das ist bei der Echtzeit-Analyse nicht der Fall und Geschwindigkeit ist hier ein entscheidender Faktor.

{% hint style="info" %}
Mit dem Begriff Batch meinen wir in diesem Zusammenhang die Betrachtung von Daten aus einem bestimmten Zeitraum, die wir in einem "Stapel" (Englisch: Batch) zusammenfassen. Typische Zeiträume für ein Batch sind 24 Stunden, 1 Woche oder 1 Monat.
{% endhint %}

### Variety

Das dritte "V" komplettiert das Trio und berücksichtigt die Vielfalt der Daten. Mit welchen Arten von Daten haben wir es zu tun?&#x20;

Auf der höchsten Ebene können wir zwischen **strukturierten und unstrukturierten Daten** unterscheiden. Strukturierte Daten sind die Daten, die wir in Tabellenkalkulationen oder relationalen Datenbanken finden. Strukturierte Daten sind in Spalten und Zeilen organisiert. Eine Spalte hat einen Datentyp und einen klar definierten Bereich von Werten, die sie enthalten kann. Strukturierte Daten können direkt abgefragt werden, indem Operationen wie Filtern, Gruppieren oder Sortieren verwendet werden.

Bei unstrukturierten Daten fehlt diese klare Definition des Datentyps und Wertebereichs. Ein anschauliches Beispiel sind Textdaten, etwa Beiträge in sozialen Medien, Nachrichtenartikel oder Dokumente im Allgemeinen. Bei einer Spalte mit Textdaten haben wir keine Möglichkeit, die typischen Operationen wie Filtern, Gruppieren und Sortieren anzuwenden, da jeder Eintrag, den wir vorfinden, ein Unikat sein wird und aus einer einzigartigen Komposition von alphanumerischen Zeichen besteht. Das bedeutet nicht, dass wir unstrukturierte Daten nicht analysieren können. Wir müssen nur zuerst eine Struktur definieren und diese den Daten auferlegen.

> In Data Analysis, there is no such thing as unstructured data. Only data that structure hasn't been applied to yet.

Einige Definitionen schließen zusätzlich semistrukturierte Daten wie Listen oder Objekte ein. Diese Datenstrukturen eignen sich nicht für die direkte Analyse und Abfrage, aber sie haben eine klar definierte Struktur, die leicht genutzt werden kann.

## Qualität

### Vollständigkeit

* Wie gut sind Spalten mit Werten befüllt? (`NA)`
* Fehlen ganze Spalten?
* Fehlen Datensätze (Zeilen)?

### Richtigkeit

* Sind die Daten korrekt?
* Sind die Daten die richtigen Daten für den Kontext der Analyse?
  * Sample Bias

### Aktualität

### Konsistenz

* Bei relationalen Daten: Gibt es fehlende Bezugsdaten (z. B. fehlender Kunde in Kundentabelle)
* Einheitliche Formate in den Spalten
* Hat auch Bezug zur Vollständigkeit

## Format

### Text-basierte Formate

* CSV, TSV ...
* JSON
* XML

### Binäre Formate

* [Parquet](https://parquet.apache.org/)
* [Feather](https://arrow.apache.org/docs/python/feather.html#feather-file-format) (Apache Arrow)

### Proprietäre Formate

* RDS (R data files)
* Tableau

## Anzahl Tabellen

{% hint style="info" %}
Coming soon.
{% endhint %}

## Originärer Zweck der Daten

{% hint style="info" %}
Coming soon.
{% endhint %}
