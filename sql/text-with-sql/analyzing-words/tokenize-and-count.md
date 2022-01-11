# Tokenisieren und Zählen

## Aus einem Text werden mehrere Zeilen <a href="#aus-einem-text-werden-mehrere-zeilen" id="aus-einem-text-werden-mehrere-zeilen"></a>

Der View aus dem [Schritt 2](clean-and-normalize.md) gibt uns eine bereinigte und normalisierte Form des Ursprungs-Tweets. Aus:

```
RT @pugandcat: Whisker licking good food from @lilyskitchen
```

wird:

```
rt pugandcat whisker licking good food from lilyskitchen
```

Nun ist es Zeit, aus dem zusammenhängenden Text einzelne Wörter zu erstellen. Dabei hilft uns die Funktion `split()`:

```sql
create or replace view tweets_words as
  select user
        ,created_at
        ,split(text, ' ') as `words`
  from tweets_cleaned
```

Das `split(text, ' ')` in Zeile 4 hat zur Folge, dass wir in der neuen Spalte `words` dieses Ergebnis sehen:

```
["rt","pugandcat","whisker","licking","good","food","from","lilyskitchen"]
```

Kommt euch das bekannt vor? Richtig! Es handelt sich um ein Array, was wir an den eckigen Klammern außen erkennen können. Arrays können wir mit `explode()` in seine Einzelteile zerlegen, sodass wir jedes Element in einer eigenen Zeile vorliegen haben:

```sql
-- Array von Wörtern in Zeilen zerlegen
select explode(words) as `word` from tweets_words
```

Wenn wir nun beide Funktionen verschachtelt anwenden, haben wir unseren fertigen View für Schritt 3:

```sql
create or replace view tweets_words as
select id
      ,screen_name
      ,created_at
      ,lang
      ,posexplode(split(text, ' ')) as (position, word)
from tweets_cleaned
```

[\
](https://docs.datalit.de/data-literacy/nlp-with-sql/prepare-text-with-sql/2-texte-bereinigen-und-normalisieren)
