# Stopwörter filtern

## Unwichtige Wörter entfernen

Wir haben nun jeweils ein Wort pro Zeile in der Spalte `word`.  Das ermöglicht es uns nun theoretisch, Analysen auf den Texten mittels SQL durchzuführen. Wir könnten z.B. zählen, welches Wort in allen Tweets am häufigsten vorkommt:

```sql
select word, count(1) as `Anzahl`
from tweets_words
group by word
order by `Anzahl` desc
```

Je nach Datensatz wird bei euch nun z. B. ein Wort wie "organic" weit oben stehen. Das ist nicht verwunderlich, da wir [im ersten Schritt](prefilter-the-data.md) die Tweets nach diesem Wort gefiltert haben. Sehr weit oben stehen aber auch Wörter wie "a", "the", "is", "to", "rt" usw. Das sind Wörter, die in der englischen Sprache häufig vorkommen, uns aber wenig Aufschluss in der Analyse geben. Deshalb sind sie unerwünscht, und wir nennen sie auch **Stopwörter**.

Wir könnten nun eine Liste von Stopwörtern erstellen und diese aus der Menge mittels `where` Bedingung ausschließen:

```sql
select word, count(1) as `Anzahl`
from tweets_words
-- Ausschluss bestimmter Füllwörter
where word not in ('to', 'the', 'rt', 'a')
group by word
order by `Anzahl` desc
```

Wenn wir die Liste für alle Stopwörter erweitern, wird diese sehr lang und das SQL-Statement unübersichtlich. Zudem dauert das eine Weile. Glücklicherweise sind wir nicht die Ersten mit diesem Problem, und kluge Leute haben Listen für verschiedene Sprachen veröffentlicht, wie z.B. [diese hier](https://gist.github.com/sebleier/554280).

Angenommen, wir haben diese Liste als neue Tabelle `stopwords` in Databricks importiert. Wir können nun eine Unterabfrage statt der manuellen Liste nutzen:

```sql
select word, count(1) as `Anzahl`
from tweets_words
-- Eine Tabelle statt manueller Liste
where word not in (select word from stopwords)
group by word
order by `Anzahl` desc
```

Das Ergebnis aus Schritt 4 als View sähe demnach so aus:

```sql
create or replace view tweets_stop as
  select user
      ,created_at
      ,word
  from tweets_words
  where word not in (select word from stopwords)
```

{% hint style="info" %}
Eine noch bessere und flexiblere Lösung ist das Lesen der Stopwords-Tabelle aus einem Google Spreadsheet direkt aus Databricks heraus. Das ermöglicht es uns, die Liste einfach zu erweitern und die Tabelle auf Knopfdruck neu zu laden. Die Infos dazu gibt es in der Veranstaltung bzw. [hier](broken-reference).
{% endhint %}

## Links

* [German Stopwords](https://github.com/solariz/german\_stopwords/blob/master/german\_stopwords\_full.txt#L1)
