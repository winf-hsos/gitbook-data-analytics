---
description: >-
  Manchmal ist die Information hilfreich, zu welchem Wort in einem Satz ein
  anderes Wort gehört und welche Beziehung die Wörter untereinander haben.
---

# Syntaktische Abhängigkeiten

## Der syntaktische Baum

Wenn der parser Teil der NLP-Pipeline ist, haben wir Zugriff auf unterschiedliche syntaktische Informationen der einzelnen Tokens. Der folgende Code zeigt ein Beispiel für die Ausgabe des gesamten syntaktischen Baums. In diesem Baum hat jedes Token einen sogenannten Kopf (_head_), das den übergeordneten Knoten im Baum angibt. Zudem hat jedes Token möglicherweise Kinder (_children_), die wiederum dieses Token als Kopf haben.

```python
import spacy

nlp = spacy.load("en_core_web_sm")

doc = nlp("With Michael Jordan on the team, the Chicago Bulls won 6 NBA championship titles during the 1990s.")

for token in doc:
    print(token.text, token.dep_, token.head.text, token.head.pos_, [child for child in token.children])
```

Die Ausgabe des Beispiels sieht wie folgt aus:

```
With prep won VERB [Jordan]
Michael compound Jordan PROPN []
Jordan pobj With ADP [Michael, on]
on prep Jordan PROPN [team]
the det team NOUN []
team pobj on ADP [the]
, punct won VERB []
the det Bulls PROPN []
Chicago compound Bulls PROPN []
Bulls nsubj won VERB [the, Chicago]
won ROOT won VERB [With, ,, Bulls, titles, during, .]
6 nummod titles NOUN []
NBA compound titles NOUN []
championship compound titles NOUN []
titles dobj won VERB [6, NBA, championship]
during prep won VERB [1990s]
the det 1990s NUM []
1990s pobj during ADP [the]
. punct won VERB []
```

## Visualisierung des syntaktischen Baums

Eine Baumstruktur biete sich für die visuelle Darstellung an. spaCy bietet mit `displaCy` eine Möglichkeit für die direkte Visualisierung von Syntaxbäumen sowie den Export als Vektorgrafik (`.svg`).

Zunächst zeigen wir die Visualisierung in Databricks an. Das können wir, indem wir die Grafik als HTML rendern lassen und mit dem `displayHTML()` Befehl anzeigen:

```python
from spacy import displacy
html = displacy.render(doc, style="dep", page=True)
displayHTML(html)
```

Das Ergebnis sieht ungefähr so aus (die Grafik ist rechts abgeschnitten):

![Die Visualisierung eines Syntaxbaumes direkt in Databricks .](<../../../../.gitbook/assets/image (10).png>)

Um die Grafik weiterverwenden zu können, bietet sich ein Export an. Mit displaCy können wir eine Vektorgrafik erzeugen und speichern. Im ersten Schritt erzeugen wir die Grafik:

```python
from pathlib import Path

# Erzeuge die Grafik
svg = displacy.render(doc, style="dep", jupyter=False)

# Bestimme den Dateinamen und Pfad
fileName = "dependency_tree.svg"
output_path = Path("/tmp/" + fileName)

# Speichern der Grafik
output_path.open("w", encoding="utf-8").write(svg)
```

Anschließend können wir die Grafik in den öffentlich zugänglichen Dateibereich in Databricks kopieren (`FileStore`) und von dort mittels eines HTML-Links herunterladen:

```python
# Kopieren aus dem tmp-Ordner in den öffentlichen Dateibereich
dbutils.fs.cp("file:/tmp/" + fileName, "dbfs:/FileStore/plots/")

# Erzeugen und Anzeigen eines Links
url = "http://community.cloud.databricks.com/files/plots/" + fileName
html = '<a href="' + url + '">Download SVG Image</a>'
displayHTML(html)
```

## Zusammengesetzte Nomen (_Noun Chunks_)

Der parser kann auch Wörter identifizieren, die zusammengehören:

```python
import spacy

nlp = spacy.load("en_core_web_sm")

doc = nlp("With Michael Jordan on the team, the Chicago Bulls won 6 NBA championship titles during the 1990s.")

for chunk in doc.noun_chunks:
    print(chunk.text, chunk.root.text, chunk.root.dep_, chunk.root.head.text)
```

Die Ausgabe sieht wie folgt aus:

```
Michael Jordan Jordan pobj With
the team team pobj on
the Chicago Bulls Bulls nsubj won
6 NBA championship titles titles dobj won
```

Der _parser_ hat erkannt, dass "Michael Jordan" zwei Wörter sind, die zusammengehören. Ebenso wie "the team" oder "the Chicago Bulls".

## Links

Erfahrt mehr über das _Dependency Parsing_ in spaCy unter diesem Link:

{% embed url="https://spacy.io/usage/linguistic-features/#dependency-parse" %}

Mehr zu den Möglichkeiten der Visualisierung in spaCy findet ihr hier:

{% embed url="https://spacy.io/usage/visualizers" %}
