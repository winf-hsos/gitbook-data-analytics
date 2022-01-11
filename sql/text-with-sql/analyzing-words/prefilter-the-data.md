---
description: >-
  Word-based analysis of text data can result in compute intensive queries. To
  reduce the amount of data initially, it is a good idea to apply a filter to
  the data (if possible).
---

# Daten vorfiltern

## Die Datenmenge reduzieren und präzisieren

Bevor wir mit dem Zerlegen der Texte beginnen ist es ratsam, die Datenmenge (wenn möglich) einzuschränken. Häufig wissen wir, dass nur eine Untermenge der gesamten Daten für unsere Fragen relevant ist. Für das Beispiel der Tweets könnten Untermengen z.B. sein:

* Nur Tweets einer bestimmten Menge von Nutzern
* Nur Tweets, in denen bestimmte Hashtags vorkommen
* Nur Tweets aus einem bestimmten Zeitraum

Das a priori Einschränken der Daten hat zur Folge, dass die anschließenden, sehr rechenintensiven Operationen der folgenden Schritte weniger Daten verarbeiten müssen.&#x20;

Um das Ergebnis aus jeden Schritt getrennt, prüfen zu können, definieren wir für jeden Schritt einen eigenen View:

```sql
-- View enthält im Ergebnis nur Tweets mit dem Hashtag #organic
create or replace view tweets_filtered as
  select user
      ,text
      ,created_at
  from tweets
  where array_contains(hashtags, 'organic')
```

Wir können nun diesen neu definierten View wie eine Tabelle abfragen:

```sql
select * from tweets_filtered
```
