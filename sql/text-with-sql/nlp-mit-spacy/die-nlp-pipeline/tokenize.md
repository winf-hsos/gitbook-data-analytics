# Tokenize

spaCy führt beim Anwenden der `nlp()` Funktion unterschiedliche Operationen auf dem übergebenen Text in einer bestimmten Reihenfolge aus. Der erste Schritt ist der _tokenizer_. Das Wort _tokenize_ bedeutet so viel wie den Text in einzelne kleine Blöcke zu unterteilen. Damit sind zum einen die Wörter gemeint, aber auch Satzzeichen oder Zahlen können ein Token sein. Die Trennung erfolgt normalerweise anhand des Trennzeichens, was im Standard das Leerzeichen ist. Es gibt aber auch Ausnahmen, die als Regeln in spaCy hinterlegt sind. Z. B. wird das Wort "don't" im Englischen ebenfalls in 2 Tokens getrennt: "do" und "'t".

Das Ergebnis des _tokenizers_ liegt nach Ausführen der `nlp()` Funktion im Ergebnisobjekt `doc` vor:

```python
import spacy

# Load English model
nlp = spacy.load("en_core_web_sm")

# Define the text and store it on a variable
text = "I am looking forward to learning about NLP with spaCy!"

# Run the NLP pipeline and save result on variable 'doc'
doc = nlp(text)

# Iterate over the tokens
for token in doc:
    # Print the text for each token
    print(token.text)
```

Im Codebeispiel oben wird ab Zeile 13 in einer Schleife Schritt für Schritt der Wert jedes Tokens ausgegeben. Wir können auf den Wert (oder den Text) des Tokens über `token.text` zugreifen. Die Ausgabe sieht für das Beispiel wie folgt aus:

```
I
am
looking
forward
to
learning
about
NLP
with
spaCy
!
```

Weil es sich bei dem Doc-Objekt prinzipiell um eine Liste von Tokens handelt, können wir auch mit der gewohnten Zugriffsmethode für Arrays auf jedes einzelne Token zugreifen:

```python
print(doc[2])
# Ausgabe: looking
```

## Links

Klickt auf den Link, um mehr über den Tokenizer von spaCy zu erfahren:

{% embed url="https://spacy.io/usage/spacy-101#annotations-token" %}

