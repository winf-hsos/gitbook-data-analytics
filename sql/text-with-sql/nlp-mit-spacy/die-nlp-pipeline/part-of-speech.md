# Part-of-Speech (POS)

Ein Token hält neben dem reinen Text noch weitere Informationen für uns bereit, wenn zusätzlich auch der _parser_ ausgeführt wurde (was standardmäßig der Fall ist). Dazu gehören die sogenannten Part-of-Speech (POS) Informationen. Diese geben an, welche Rolle ein Token (oder Wort) in dem Text spielt. Also ob es sich um ein Verb, Adjektiv, Nomen oder vielleicht eine Zahl oder ein Satzzeichen handelt. Auf diese Information können wir wie folgt zugreifen:

```python
# Iterate over the tokens
for token in doc:
    # Print the text and POS tag for each token
    print(token.text, token.pos_)
```

Die Ausgabe ist folgende:

```
I PRON
am AUX
looking VERB
forward ADV
to ADP
learning VERB
about ADP
NLP PROPN
with ADP
spaCy PROPN
! PUNCT
```

Wie ihr seht, enthält das `pos_` Attribut Abkürzungen für die Art des Tokens, den spaCy erkannt hat. Hier die wichtigsten davon:

| Abkürzung | Bedeutung   |
| --------- | ----------- |
| ADJ       | Adjektiv    |
| ADV       | Adverb      |
| AUX       | Hilfsverb   |
| NOUN      | Nomen       |
| PRON      | Pronomen    |
| PUNCT     | Satzzeichen |
| VERB      | Verb        |

{% hint style="info" %}
Für jedes Kürzel existiert auch eine Codierung als Zahl, die ihr über das Attribut `pos` (ohne Underscore am Ende) abrufen könnt.
{% endhint %}

Eine umfassende Liste mit den verwendeten Tags und Kürzeln erhaltet ihr hier:

{% embed url="https://spacy.io/api/annotation" %}

Ihr könnt auch spaCy selbst bitten, eine bestimmte Abkürzung zu erklären:

```python
spacy.explain("AUX")
# Ausgabe: 'auxiliary'
```

{% hint style="info" %}
Solltet ihr detailliertere Infos zur Rolle eines Tokens benötigen, schaut euch die Attribute `tag_` bzw `tag` an. Die Bedeutung der Werte in diesen Feldern könnt ihr auch dem obigen Link entnehmen.
{% endhint %}
