---
description: >-
  Bei großen Datensätze kann es bei komplexen Analysen zu langsamen
  Antwortzeiten kommen. Hier lernt ihr ein paar Tricks wie ihr diese verkürzen
  könnt.
---

# Die Arbeit mit großen Datenmengen

## Große Datenmengen und komplexe Verarbeitungen

Die Databricks Community-Edition stellt uns ein vorkonfiguriertes Spark-Cluster bereit, mit dem wir die Datensätze aus diesem Kurs mit guter Abfragegeschwindigkeit analysieren können. Wenn wir größere Datenmengen mit Databricks verarbeiten wollen, oder auf unseren Daten komplexe und damit rechenintensive Operationen (wie z. B. [NLP mit spaCy](../../../sql/text-with-sql/nlp-mit-spacy/)) ausführen wollen, haben wir mehrere Möglichkeiten.

### Daten vorfiltern

Die erste Option besteht darin, die Daten zu reduzieren, indem wir sie vorfiltern. Dieses Vorgehen ist oft per se sinnvoll, wenn sich eine Frage z. B. nur auf eine bestimmte Untermenge des gesamten Datensatzes bezieht.&#x20;

Am besten speichert ihr das Ergebnis der Vorfilterung in einem View und anschließend in einer neuen persistenten Tabelle. Dadurch reduziert ihr die Datenmenge und die folgende Weiterverarbeitung wird signifikant beschleunigt. Zur technischen Umsetzung könnt ihr folgendes Beispiel als Vorlage verwenden. Zunächst legt ihr einen temporären View für die Filterung an. Hier könnt ihr sinnvollerweise auch andere Verarbeitungsschritte, wie Datumskonvertierungen oder die Formatierung von JSON-Objekten, vornehmen:

```sql
create or replace temporary view v_tweets_filtered as
-- Spalten die ihr benötigt und Transformationen, die ihr für sinnvoll erachtet
select
  id,
  screen_name,
  text,
from
  tweets
where
  screen_name in ("...", "...")
```

Im zweiten Schritt führt ihr den View aus und speichert das Ergebnis als Dataframe. Diese Operation führen wir mit PySpark durch und wechseln deshalb in eine Python-Zelle:

```python
%python 

# Den View abfragen und als Dataframe speichern
df = spark.sql("select * from v_tweets_filtered ");

# Tabelle löschen, falls bereits vorhanden
spark.sql("drop table if exists tweets_filtered")

# Persistente Tabelle erstellen
df.write.saveAsTable("tweets_filtered")
```

Als Ergebnis liegt die neue Tabelle `tweets_filtered` vor, die wir nun nur einen Teil der gesamten Daten enthält.

### Zufällige Stichprobe ziehen

Wenn ihr keine sinnvolle Filterung vornehmen könnt, bietet sich die zufällige Auswahl einer Anzahl von Zeilen (_sampling_) als zweite Option an. Dabei reduziert ihr ebenfalls die Datenmenge, erhaltet aber eine repräsentative Stichprobe mit allen Facetten der ursprünglichen Daten und müsst euch nicht auf einen (künstlichen) Filter festlegen:

```python
%python

# Tabelle abfragen und als Dataframe speichern
df = spark.sql("select * from tweets");

# Zufällige Stichprobe mit Umfang 5% der Gesamtdaten erzeugen
df_sample = df.sample(0.05)

# Es kann auch der Seed mitgegeben werden, um bei mehrfacher Ausführung die gleichen Daten zu erhalten
#df_sample = df.sample(0.05, 1)

# Tabelle löschen, falls bereits vorhanden
spark.sql("drop table if exists tweets_sampled")

# Persistente Tabelle erstellen
df_sample.write.saveAsTable("tweets_sampled")
```

Die neue Tabelle tweets\_sampled enthält in dem Beispiel oben noch 5 % der ursprünglichen Tweets und somit signifikant weniger. Ihr könnt auf diese Weise auch mehrere unabhängige Stichproben erstellen, wie es beim [Bootstrapping](https://en.wikipedia.org/wiki/Bootstrapping\_\(statistics\)) der Fall ist. Mit dem zweiten Parameter der `sample()` Funktion könnt ihr den Startwert für den Zufallsgenerator festlegen, um bei erneutem Ausführen die gleiche Stichprobe zu erhalten.

### Filtern UND Stichprobe ziehen

Sollte trotz Vorfilterung eine zu große Datenmenge übrig bleiben, kann auch anschließend noch eine Stichprobe gezogen und somit beide Verfahren kombiniert werden. So könnt ihr euch in der Analyse auf eine bestimmte Untermenge der Daten beschränken und gleichzeitig die Vorteile des _Sampling_ nutzen.

### Größeres Cluster mieten

Die naheliegende aber auch kostspielige Option ist das Mieten eines echten Clusters mit genügend Knoten (Anzahl Rechner im Cluster), um die Verarbeitungslast stemmen zu können. Diese Option müssen wir letztlich anwenden, wenn wir alle Zeilen eines sehr großen Datensatzes in die Analyse einbeziehen wollen und die anderen beiden Optionen deshalb nicht funktionieren.
