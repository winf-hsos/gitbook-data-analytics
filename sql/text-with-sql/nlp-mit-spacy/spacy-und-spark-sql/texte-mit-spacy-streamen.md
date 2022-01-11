---
description: >-
  Wenn wir viele Texte mit spaCy analysieren wollen, empfiehlt es sich, ein paar
  Dinge zu beachten. So sollte unbedingt nlp.pipe() verwendet werden.
---

# Texte mit spaCy streamen

## Verwendung von Python und Streaming

Der Weg, spaCy über eine [User Defined Function (UDF)](spacy-und-udfs.md) zu verwenden, ist für kleine Anwendungen bequem und einfach. Für die Analyse größerer Datenmengen ist dieser Weg aber ineffizient. Wir lernen jetzt einen Weg direkt mit Python kennen, via Streaming mit `nlp.pipe()` (statt `nlp()`) mehrere Dokumente gleichzeitig verarbeiten zu können.

Der folgende Code beinhaltet alles Notwendige. Wir erläutern die einzelnen Zeilen anschließend:

{% hint style="info" %}
**Achtung**: Der Code unten analyisiert alle > 2000 Texte im Datensatz. Das kann einige Minuten dauern, bei meiner letzten Ausführung dauerte es \~19 Minuten. Für eine schnellere Ausführung empfehle ich, im SQL-Statement ein `LIMIT 50` einzufügen, bis das gewünschte Resultat erzeugt wurde.
{% endhint %}

```python
import numpy as np
import pandas as pd 
import spacy

# The name of the output table
tableName = "ted_text_nlp"

# Load English model
nlp = spacy.load("en_core_web_sm")

# Get the tweets into a Spark dataframe
ted_text = spark.sql('''
  select youtube_id
        ,text
  from ted_text
''')

# Convert the youtube_id and text into separate numpy arrays
id_array = np.array(ted_text.select("youtube_id").collect()).flatten().tolist()
text_array = np.array(ted_text.select("text").collect()).flatten().tolist()

# Stream all TED talks through spaCy
docs = list(nlp.pipe(text_array))

result = []

# Define the POS we want to include
pos_list = ["VERB", "NOUN", "ADJ", "PROPN", "ADP", "NUM", "AUX"]

for num, doc in enumerate(docs, start=0):
  
    row = []
    
    # Append the original youtube_id and the text
    row.append(id_array[num])
    row.append(text_array[num])

    # Append the NLP results we want to include
    row.append([token.text for token in doc if token.pos_ in pos_list])
    row.append([token.lower_ for token in doc if token.pos_ in pos_list])
    row.append([token.lemma_ for token in doc if token.pos_ in ["VERB", "AUX"]])
    row.append([token.lemma_ for token in doc if token.pos_ == "ADJ"])      
    row.append([token.lemma_ for token in doc if token.pos_ in ["NOUN", "PROPN"]])
    row.append([chunk.text for chunk in doc.noun_chunks])
      
    entities = []
    for entity in doc.ents:
      entities.append({ "text" : entity.text, "label" : entity.label_ })
   
    row.append(entities)
    result.append(row)

# Create a dataframe and save it as a table
df = pd.DataFrame(result) 
df = spark.createDataFrame(df, ["youtube_id", "text", "token", "token_lower", "verbs", "adjectives", "nouns", "noun_chunks", "entities"])
spark.sql("drop table if exists " + tableName)
df.write.saveAsTable(tableName)
```

In Zeile 1 - 3 laden wir benötigte Bibliotheken für die Ausführung des Skriptes. Neben spaCy sind dies die Bibliotheken numpy und pandas. Beide stellen Funktionen für die Verarbeitung von Daten in Form von Arrays dar und werden für die Umwandlung benötigt. Während Spark SQL einen pandas-Dataframe erwartet (Zeile 54), benötigt spaCy einen numpy-Array (Zeile 20).

In Zeile 6 definieren wir den Namen der Tabelle, in der wir das Ergebnis am Ende speichern (Zeile 57). Ändert diesen Namen nach Belieben.

In Zeile 9 laden wir das Sprachmodell für die NLP-Pipeline. Da die TED-Talks auf Englisch sind, verwenden wir das kleine englische Modell. In Zeile 23 wenden wir das Modell auf die Texte an. Anstatt der Funktion `nlp()` verwenden wir jetzt `nlp.pipe()`, was dafür sorgt, dass die Texte nicht einzeln verarbeitet werden, sondern als Ganzes durch die Pipeline gestreamt werden.

Vorher erzeugen wir uns mittels SQL in Zeile 12 - 16 die benötigen Daten, nämlich alle Texte aus den TED Talks.

In Zeile 28 definieren wir die POS-Typen, die wir im Ergebnis benötigen und iterieren anschließend ab Zeile 30 in einer `FOR`-Schleife durch alle verarbeiteten Texte. Innerhalb der Schleife extrahieren wir die NLP-Ergebnisse, die uns interessieren (ändert das nach Belieben, aber passt dann auch unten das Schema der Tabelle in Zeile 55 an) und fügen die Zeile für Zeile dem Ergebnis-Array `result` hinzu.

Am Ende konvertieren wir das Ergebnis in einen pandas-Dataframe (Zeile 54) und erzeugen daraus einen Spark-Dataframe (Zeile 55), den wir letztlich als Tabelle speichern (Zeile 57).

## Neue Metadaten für die Analyse

Das obige Skript hat im Ergebnis die neue Tabelle `ted_text_nlp` erzeugt. Diese beinhaltet neben der youtube\_id und dem Originaltext auch sämtliche Ergebnisse der NLP-Verarbeitung, die wir in der Schleife oben extrahiert haben.

| Spalte        | Inhalt                                              |
| ------------- | --------------------------------------------------- |
| `token`       | Alle Token des Textes.                              |
| `token_lower` | Alle Token des Textes in Kleinschreibung.           |
| `verbs`       | Alle Verben des Textes in der Grundform.            |
| `adjectives`  | Alle Adjektive des Textes in der Grundform.         |
| `nouns`       | Alle Nomen des Textes in der Grundform.             |
| `noun_chunks` | Zusammengehörende Wörter (Nomen).                   |
| `entities`    | Gefundene Named Entities mit dem Token und dem Typ. |

Auf Basis dieser neuen, abgeleiteten Metadaten können wir viele spannende explorative Analysen mit SQL durchführen. Zum Beispiel können wir jetzt ganz einfach die Frage beantworten, welche Nomen in allen Talks am häufigsten vorkommen:

```python
select
  noun,
  count(1) as num_occurrences
from
  (
    select
      explode(nouns) as noun
    from
      ted_text_nlp
  )
group by
  noun
order by
  num_occurrences desc
```
