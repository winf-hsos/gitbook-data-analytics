# spaCy und UDFs

## TED-Talks mit spaCy analysieren

### Datensatz laden

In diesem Abschnitt verwenden den TED Talk Datensatz als Beispiel. Falls noch nicht geschehen, importiert euch das Notebook und ladet den Datensatz, sodass ihr auf die Tabelle `ted_text` zugreifen könnt.

{% content-ref url="../../../../data-sets-and-exercises/datensaetze/ted-talk-transcripts.md" %}
[ted-talk-transcripts.md](../../../../data-sets-and-exercises/datensaetze/ted-talk-transcripts.md)
{% endcontent-ref %}

### spaCy installieren und Sprachmodell laden

Zudem müssen wir bevor wir loslegen spaCy in unserem Notebook installieren und ein geeignetes Sprachmodell laden. Wir verwenden hier das kleine englische Modell (`en_core_web_sm`).

{% content-ref url="../spacy-in-databricks-installieren.md" %}
[spacy-in-databricks-installieren.md](../spacy-in-databricks-installieren.md)
{% endcontent-ref %}

### Erstellen einer eigenen SQL-Funktion (UDF)

Wir wollen in diesem Beispiel eine eigene Funktion erstellen, die alle Verben aus einem TED-Talk extrahiert und gleichzeitig in seine Grundform überführt. Wie das geht, haben wir im Abschnitt zum [Part-of-Speech (POS)](../die-nlp-pipeline/part-of-speech.md) sowie [Lemmatizer](../die-nlp-pipeline/lemmatizer.md) bereits gelernt. Wir verpacken den Code nun in einer Python-Funktion, die wir anschließend als SQL-Funktion mit dem Namen `getVerbs` registrieren:

```python
from pyspark.sql.types import ArrayType, StringType
import spacy
nlp = spacy.load("en_core_web_sm")

nlp.disable_pipe("ner")
nlp.disable_pipe("parser")

def getVerbs(text):
  doc = nlp(text)
  print(doc)
  verbs = [token.lemma_ for token in doc if token.pos_ == "VERB"]
  return verbs

spark.udf.register("getVerbs", getVerbs, ArrayType(StringType()))
```

Um möglichst effizient zu sein, deaktivieren wir alle nicht benötigten Pipeline-Komponenten mittels der `disable_pipe` Funktion. In diesem Fall benötigen wir keine Named Entity Recognition (_ner_) oder syntaktische Merkmale (_parser_).

### Anwenden der neuen Funktion auf die Textspalte

Wir können jetzt die neue SQL-Funktion `getVerbs` wie gewohnt verwenden und als Parameter eine Textspalte übergeben. Für die TED-Talks ist das die Spalte `text` aus der Tabelle `ted_text`:

```sql
select
  getVerbs(text) as list_of_verbs,
  text
from
  ted_text
where
  youtube_id = "YDvbDiJZpy0"
```

Im obigen Beispiel wenden wir die neue Funktion vorsichtshalber nur auf einen einzigen Text an, um schnell ein Ergebnis zu bekommen. Bei Anwendung auf alle > 2000 Texte kann es eine Weile dauern, bis ein Ergebnis vorliegt.

![Das Ergebnis der NLP-Funktion mit SQL.](<../../../../.gitbook/assets/image (9).png>)

Um die Anwendung auf mehrere Texte zu erweitern, könnt ihr folgende Abfrage verwenden und den Filter entsprechend verändern:

```sql
select
  getVerbs(text) as list_of_verbs,
  text
from
  (
    select
      rank() over (
        order by
          youtube_id
      ) as rank,
      text
    from
      ted_text
  )
where
  rank <= 100
```

Für die Verarbeitung größerer Mengen an Texten empfiehlt es sich, die Analyse direkt in Python durchzuführen, die Daten mit `nlp.pipe()` zu streamen sowie das Ergebnis in einer neuen Tabelle zu persistieren, um damit effizient weiterarbeiten zu können. Auf diese Punkte gehen wir in den folgenden Abschnitten genauer ein.
