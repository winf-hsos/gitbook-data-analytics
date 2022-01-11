---
description: >-
  Wir lernen, wie wir die Python-Bibliothek spaCy installieren können, um es
  direkt in einem Databricks-Notebook verwenden zu können.
---

# spaCy in Databricks installieren

## Das spaCy Modul installieren

In einem Python-Notebook in Databricks können wir mittels des Präfixes `%pip` direkt auf den `pip`-Befehl zugreifen und spaCy installieren. Details zur Installation findet ihr auch auf der[ offiziellen Dokumentation](https://spacy.io/usage):

```
%pip install spacy
```

**Hinweis**: Durch den `pip`-Befehl wird spaCy nur im Scope des aktuellen Notebooks installiert. Sobald der Cluster ausgetauscht wird oder das Notebook vom Cluster getrennt und wieder verbunden wurde, muss der Befehl erneut ausgeführt werden. Das gilt auch für die geladenen Sprachmodelle. Mehr dazu findet ihr [hier](https://docs.databricks.com/libraries/notebooks-python-libraries.html).

## Ein vortrainiertes Modell für eine Sprache installieren

Um spaCy mit einer bestimmten Sprache wie Deutsch oder Englisch verwenden zu können, also um Texte in dieser Sprache analysieren zu können, müssen wir zuerst die entsprechenden Modelle herunterladen. Die Modelle beinhalten u. a. Listen für Stopwörter. Aber auch statistische Modelle in Form von neuronalen Netzen, die für genau diese Sprache mit einem sehr großen Trainingsdatensatz trainiert wurden. Mit diesen Modellen können wir z. B. Entitäten erkennen, POS-Tagging vornehmen, syntaktische Analysen durchführen oder Ähnlichkeiten zwischen Wörtern oder Texten bestimmen.

spaCy bietet für sehr viele Sprachen vortrainierte Modelle an, die wir herunterladen und verwenden können. Im Folgenden sind die Modelle für Deutsch und Englisch aufgeführt. Für jede der beiden Sprachen gibt es Modelle unterschiedlicher Größe. Der Unterschied zwischen den Modellen ist die Informationsmenge und die zugrunde liegenden Trainingsdaten. Kleinere Modelle sind schneller und verwenden weniger Speicherplatz, sind dafür aber tendenziell ungenauer in ihren Vorhersagen.

### Modelle für englische Texte

```bash
# Kleines Modell (small) (13 MB)
%pip install "https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.0.0/en_core_web_sm-3.0.0.tar.gz"

# Mittleres Modell (medium) (45 MB)
%pip install "https://github.com/explosion/spacy-models/releases/download/en_core_web_md-2.2.5/en_core_web_md-2.2.5.tar.gz"

# Großes Modell (large) (743 MB)
%pip install "https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-2.2.5/en_core_web_lg-2.2.5.tar.gz"
```

### Modelle für deutsche Texte

Für die deutsche Sprache stehen nur 2 Modellgrößen zur Verfügung:

```bash
# Kleines Modell (small) (18 MB)
%pip install "https://github.com/explosion/spacy-models/releases/download/de_core_news_sm-2.2.5/de_core_news_sm-2.2.5.tar.gz"

# Mittleres Modell (medium) (47 MB)
%pip install "https://github.com/explosion/spacy-models/releases/download/de_core_news_md-2.2.5/de_core_news_md-2.2.5.tar.gz"
```

Das war es schon, wir können im nächsten Schritt ein vorher heruntergeladenes Modell auf Texte anwenden.

## Links

Weitere Modelle für andere Sprachen:

{% embed url="https://spacy.io/usage/models" %}

Dokumentation der deutschen Modelle:

{% embed url="https://spacy.io/models/de" %}

Dokumentation der englischen Modelle:

{% embed url="https://spacy.io/models/en" %}
