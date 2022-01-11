---
description: >-
  Der Lemmatizer erzeugt die Grundform von Wörtern. Das Verb "does" wird zu
  "do", "said" wird zu "say".
---

# Lemmatizer

Wörter in die Grundform zu überführen ist sehr nützlich, wenn wir z. B. daran interessiert sind, welche Wörter in Texten häufig verwendet werden. Sind wir beispielsweise an dem Verb "vaccinate" interessiert, dann wollen wir sowohl Treffer für "vaccinated", "vaccinates" usw. erhalten. Der Lemmatizer erledigt diese Aufgabe für uns:

```python
import spacy

# Load English model
nlp = spacy.load("en_core_web_sm")

# Define the text and store it on a variable
text = "With Michael Jordan on the team, the Chicago Bulls won 6 NBA championship titles during the 1990s."

# Run the NLP process pipeline and save result on variable 'doc'
doc = nlp(text)

# Iterate over the tokens
for token in doc:
    # Print the entity text and its lemma
    print(token.text, token.lemma_)
```

Wenn der _lemmatizer_ ausgeführt wurde, können wir anschließend das Feld `lemma_` des Tokens verwenden, um die Grundform für ein Wort zu erhalten.
