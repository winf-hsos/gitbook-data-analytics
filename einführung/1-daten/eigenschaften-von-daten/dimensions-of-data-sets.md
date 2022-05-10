---
description: >-
  Um Datensätze genauer beschreiben und einordnen zu können, schauen wir uns
  wichtige Dimensionen und deren möglichen Ausprägungen an.
---

# Eigenschaften eines Datensatzes

Die folgende Abbildung skizziert wichtige Dimensionen, die bei der Analyse eines Datensatzes wichtig sein können.

![Important dimensions to classify data sets for analysis.](<../../../.gitbook/assets/dataset\_dimensions\_2x (1).png>)

## Die 3V

Eine Reihe von Definitionen schlagen die sogenannten 3Vs vor, um zu entscheiden, ob Daten "Big" sind oder nicht. Unabhängig davon, ob wir von "Big Data" sprechen oder nicht, dienen die 3Vs als nützliche Dimensionen bei der Entscheidung über die Methoden zur Verarbeitung und Analyse eines gegebenen Datensatzes.

### Volume

Das erste V steht für das Volumen des Datensatzes. Wir messen das Datenvolumen mit den Begriffen Bits, Bytes, Megabytes, Gigabytes und so weiter. Die Frage ist: Wie viele 0 und 1 braucht es, um die Daten auf einem Speichermedium wie einer Festplatte oder dem Arbeitsspeicher (RAM) des Computers zu speichern?&#x20;

Abhängig von der Antwort müssen wir unterschiedliche Maßnahmen ergreifen, um die Daten zu analysieren. Die wichtigste Frage dabei ist, ob die Daten auf einer einzelnen Maschine (Laptop, Server) verarbeitet und analysiert werden können? Oder benötigen wir eine Reihe von miteinander verbundenen Maschinen (einen sogenannten Cluster), um die Daten und die Verarbeitungslast auf mehrere Knoten zu verteilen? Es gibt keine einheitliche Antwort auf diese Frage, da sie von der Hardware des Rechners sowie von den Arten der Analyse abhängt, die wir durchführen wollen. Benötigt eine Abfrage den gesamten Datensatz? Oder benötigen wir nur eine Teilmenge der Daten? Da die Hardware immer leistungsfähiger wird, werden die Grenzen jeden Tag weiter verschoben.

### Velocity

Das zweite V befasst sich mit der Häufigkeit, mit der neue Datensätze in der Quelle erzeugt werden. Nehmen wir das Beispiel von Sensordaten in einer Fertigung. Hier werden potenziell Millionen von Datensätzen pro Sekunde erzeugt. Das erhöht die Geschwindigkeit (_Velocity_) und somit auch die Anforderungen an unsere Datenerfassungslösung.

Die Produktionsfrequenz der Daten ist nicht der einzige relevante Faktor. Es macht einen großen Unterschied, ob wir neue Datensätze in Echtzeit analysieren müssen, oder ob wir die Daten lediglich sammeln und etwa alle 24 Stunden eine Batch-Analyse durchführen. Ersteres erfordert eine Echtzeit-Streaming-Lösung, letzteres kann durch einfache Batch-Skripte (z. B. SQL, Python, R) erreicht werden, die einmal pro Tag laufen.

### Variety

Das dritte V komplettiert das Trio und berücksichtigt die Vielfalt der Daten. Mit welchen Arten von Daten haben wir es in unserem Datensatz zu tun?&#x20;

Auf der höchsten Ebene können wir zwischen strukturierten und unstrukturierten Daten unterscheiden. Strukturierte Daten sind die Daten, die wir in Tabellenkalkulationen oder relationalen Datenbanken finden, bei denen Daten in Spalten und Zeilen organisiert sind. Eine Spalte hat einen Datentyp und einen klar definierten Bereich von Werten, die eine Spalte enthalten kann. Strukturierte Daten können direkt mit SQL abgefragt werden, indem Operationen wie Filtern, Gruppieren und Sortieren verwendet werden.

Auf der anderen Seite fehlt bei unstrukturierten Daten diese klare Definition des Datentyps und Wertebereichs. Ein anschauliches Beispiel sind Textdaten, wie Beiträge in sozialen Medien, Nachrichtenartikel oder Dokumente im Allgemeinen. Bei einer Spalte mit Textdaten haben wir keine Möglichkeit, die typischen Operationen wie Filtern, Gruppieren und Sortieren anzuwenden, da jeder Eintrag, den wir vorfinden, eindeutig sein wird. Das bedeutet nicht, dass wir unstrukturierte Daten nicht analysieren können, aber wir müssen zuerst eine Struktur definieren und diese den Daten auferlegen.

> In Data Analysis, there is no such thing as unstructured data. Only data that structure hasn't been applied to yet.

Einige Definitionen schließen zusätzlich semistrukturierte Daten wie Listen oder Objekte ein. Diese Datenstrukturen eignen sich nicht für die direkte Analyse und Abfrage, aber sie haben eine klar definierte Struktur, die leicht genutzt werden kann.

## Qualität

{% hint style="info" %}
Coming soon.
{% endhint %}

## Format

{% hint style="info" %}
Coming soon.
{% endhint %}

## Anzahl Tabellen

{% hint style="info" %}
Coming soon.
{% endhint %}

## Originärer Zweck der Daten

{% hint style="info" %}
Coming soon.
{% endhint %}
