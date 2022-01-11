# Named Entities (NER)

## Benannte Entitäten erkennen

Neben POS-Informationen können die spaCy-Modelle auch benannte Entitäten erkennen und uns die Information zur Verfügung stellen. Eine benannte Entität kann zum Beispiel eine Person, Organisation, Firma oder ein Land sein.

```python
import spacy

# Load English model
nlp = spacy.load("en_core_web_sm")

# Define the text and store it on a variable
text = "With Michael Jordan on the team, the Chicago Bulls won 6 NBA championship titles during the 1990s."

# Run the NLP process pipeline and save result on variable 'doc'
doc = nlp(text)

# Iterate over the predicted entities
for ent in doc.ents:
    # Print the entity text and its label
    print(ent.text, ent.label_)
```

Wenn die `ner`-Komponente ausgeführt wurde, können wir über `doc.ents` auf die Informationen bezüglich der gefundenen Entitäten zugreifen. Dabei beinhaltet `ent.text` den Token selbst und `ent.label_` das Kürzel für den Typ der Entität.

Das Script oben erzeugt folgende Ausgabe:

```
Michael Jordan PERSON
the Chicago Bulls ORG
6 CARDINAL
NBA ORG
the 1990s DATE
```

Um herauszufinden, was die einzelnen Abkürzungen bedeuten, könnt ihr `spacy.explain()` aufrufen:

```python
spacy.explain("ORG")
# Ausgabe: 'Companies, agencies, institutions, etc.'
```

## Visualisierung der erkannten Entitäten

Mit `displaCy` bietet spaCy eine Möglichkeit, erkannte Entitäten in einem Text visuell hervorzuheben:

```python
from spacy import displacy
html = displacy.render(doc, style="ent", page=True)
displayHTML(html)
```

Das Ergebnis sieht in Databricks so aus:

![Visuelle Hervorhebung von erkannten Entitäten in Databricks.](<../../../../.gitbook/assets/image (11).png>)

Wir können auch nur bestimmte Entitäten hervorheben lassen sowie die Farbe ändern:

```python
colors = {"ORG": "linear-gradient(90deg, #009ee3, #ffffff)"}
options = {"ents": ["ORG"], "colors": colors}
html = displacy.render(doc, style="ent", page=True, options=options)
displayHTML(html)
```

Das neue Ergebnis sieht dann so aus:

![Visuelle Hervorhebung von erkannten Organisationen in Databricks.](<../../../../.gitbook/assets/image (12).png>)

## Links

Das Abkürzungs-Schema für das englische Modell findet ihr hier:

{% embed url="https://spacy.io/models/en#en_core_web_sm-labels" %}

Mehr zu den Möglichkeiten der Visualisierung in spaCy findet ihr hier:

{% embed url="https://spacy.io/usage/visualizers" %}
