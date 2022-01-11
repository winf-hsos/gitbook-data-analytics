---
description: >-
  spaCy verarbeitet Texte in hintereinander gelagerten Schritten, die auch
  Pipeline genannt werden. Im Standard beinhaltet eine spaCy-Pipeline bereits
  die wichtigsten Operationen.
---

# Die NLP Pipeline

## Die NLP-Pipeline

### Der Aufbau der Pipeline

Das Laden eines Modells für eine bestimmte Sprache über `spacy.load()` resultiert in einem Objekt vom Typ `Language`. Inhaltlich ist dieses Objekt eine sogenannte _Pipeline_, in der hintereinander unterschiedliche Schritte zur Verarbeitung von Textdaten ausgeführt werden. Das Ergebnis einer Pipeline ist ein Objekt vom Typ `Doc`, was die Ergebnisse des NLP-Prozesses beinhaltet. Die Abbildung unten zeigt eine Beispiel-Pipeline:

![Eine Pipeline in spaCy mit verschiedenen Schritten (Quelle: https://spacy.io/usage/spacy-101)](../../../../.gitbook/assets/spacy\_pipeline.svg)

Der folgende Code erstellt eine solche Pipeline und speichert sie auf der Variable `nlp`:

```python
import spacy

# Laden des englischen Modells; gibt eine Pipeline zurück
nlp = spacy.load("en_core_web_sm")
```

Im ersten Schritt importieren wir die spaCy-Bibliothek, damit sie uns überhaupt zur Verfügung steht. Mithilfe des `nlp`-Objekts können wir nun einen Text mithilfe der Pipeline verarbeiten lassen. Der Text durchläuft dabei die unterschiedlichen Schritte, die in der Pipeline definiert sind. Die Pipeline für das kleine englische Modell von oben beinhaltet standardmäßig u. a. die folgenden Komponenten:

| Komponente | Funktion                                                                                                                                     | Modell benötigt? |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| tokenizer  | Zerlegt den Text in Token. Z. B. einzelne Wörter, Satzzeichen oder Sonderzeichen. Immer vorhanden und daher nicht Teil der Pipeline an sich. | Nein             |
| tagger     | Rolle von Wörtern ermitteln (_Part-of-Speech Tagger_)                                                                                        | Ja               |
| parser     | Abhängigkeiten zwischen Wörtern ermitteln (_Dependency Parser_)                                                                              | Ja               |
| ner        | Bennante Entitäten identifizieren (_Named Entity Recognition_)                                                                               | Ja               |
| lemmatizer | Ermitteln der Grundform                                                                                                                      | Ja               |

### Pipeline-Komponenten anzeigen

Wir können jederzeit fragen, welche Komponenten für unsere Pipeline definiert sind:

```python
print(nlp.pipe_names)
# Output: ['tok2vec', 'tagger', 'parser', 'ner', 'attribute_ruler', 'lemmatizer']
```

### Pipeline auf einen Text anwenden

Um die NLP-Pipeline auf einen Text anzuwenden, führen wir das `nlp`-Objekt als Funktion aus:

```python
import spacy

# Load English model
nlp = spacy.load("en_core_web_sm")

# Define the text and store it on a variable
text = "I am looking forward to learning about NLP with spaCy!"

# Run the NLP pipeline and save result on variable 'doc'
doc = nlp(text)
```

Die Variable `doc` beinhaltet nun die Ergebnisse jeder Pipeline-Komponente. In den nächsten Abschnitten schauen wir, wie wir auf die einzelnen Ergebnisse zugreifen können.

### Pipeline-Komponenten deaktivieren

Um kürzere Laufzeiten für unsere NLP-Prozesse zu erreichen, können wir nicht benötige NLP-Komponenten ausschalten, sodass diese nicht ausgeführt werden. Dazu übergeben wir der `nlp()` Funktion eine Liste an Komponenten über das Attribut `disable`:

```python
nlp(text, disable=["ner", "parser"]
```

Alternativ kann auch der folgende Befehl verwendet werden:

```python
nlp.disable_pipe("ner")
```

Um die Komponenten später wieder verwenden zu können, müssen wir sie erneut aktivieren:

```python
nlp.enable_pipe("ner")
```

