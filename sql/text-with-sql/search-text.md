# In Texten suchen

Das folgende Notebook enthält Beispiele für das einfache Suchen in Textspalten:

{% embed url="https://winf-hsos.github.io/databricks-notebooks/sql/Search%20in%20Text%20with%20SQL.html" %}

## Der `like`-Operator

Mit dem `like-`Operator können wir in Texten nach einzelnen Wörtern und Mustern suchen. Wir nutzen dafür einen Suchbegriff und können nach diesen in Kombination mit dem Wildcard-Symbols `%` in Texten suchen. Das `%`-Zeichen steht stellvertretend für eine beliebige Folge von Zeichen, die vor oder nach dem gesuchten Begriff stehen kann.&#x20;

```sql
select screen_name
      ,text
from tweets
where text like '%covid%'
```

Möchte man einen Text nach mehr als nur einem Wort durchsuchen, können wir mehrere `like-`Operatoren mit dem `or`-Operator verknüpfen. Diese Vorgehensweise wird schnell unübersichtlich.

```sql
select screen_name
      ,text
from tweets
where text like '%covid%'
or text like '%corona%'
or text like '%virus%'
```

## Eine eigene Funktion `str_contains()`

Eine Alternative zum `like`-Operator ist das Zerlegen der Texte in einzelne Wörter. Das bietet sich an, wenn man tiefer gehende Analysen der Texte durchführen möchte. Dazu findet ihr in dem unten verlinkten Abschnitt weitere Informationen:

{% content-ref url="analyzing-words/" %}
[analyzing-words](analyzing-words/)
{% endcontent-ref %}

Will man lediglich auf die Schnelle nach mehr als einem Wort suchen, gibt es dennoch eine einfache Möglichkeit. Über eine **User Defined Function (UDF)** kann zunächst die Funktion abgebildet werden, innerhalb einer Spalte nach einer anderen Spalte (enthält gesuchtes Wort) oder einem Wort zu suchen:

```scala
%scala
def strContains(s: String, k: String): Boolean = {
  val str = Option(s).getOrElse(return false)
  val keyword = Option(k).getOrElse(return false)
  return keyword.r.findAllIn(str).length > 0
}

val strContainsUDF = udf[Boolean, String, String](strContains)
spark.udf.register("str_contains", strContainsUDF)
```

Diese Funktion können wir nun in einem SQL-Statement verwenden. Die Tabelle `keywords` enthält dabei die gesuchten Suchbegriffe in der Spalte `word`. Die Tabelle kann beispielsweise in Google Sheets gepflegt und anschließend geladen werden, oder sie wird mittels SQL-DML erzeugt (s. [Databricks Notebook Template](https://s3.us-east-1.amazonaws.com/nicolas.meseth/databricks-notebooks/template\_vorbereitung\_tweets.html)):

```sql
select t.text
      ,k.keyword
from tweets t
left join keywords k
      on str_contains(t.text, k.keyword)
-- Nur Treffer im Ergebnis behalten
where k.keyword is not null
```

## `collect_list()` und `collect_set()`

Wollt ihr nun jeden Tweet nur einmal im Ergebnis haben, sortiert nach der Anzahl gefundener Schlüsselwörter, dann verwendet das folgende SQL:

```sql
select id
      ,text
      ,collect_list(keyword) as hits
      ,count(keyword) as num_hits
from tweets
left join keywords
  on str_contains(lower(text), keyword)
where keyword is not null
group by id, text
order by num_hits desc
```

Die Funktion `collect_list` in Zeile 3 aggregiert die Keywords, die zuvor auf mehrere Zeilen verteilt waren, in eine Spalte vom Typ Array. Gleichzeitig zählen wir mit `count(word)` die Treffer und gruppieren die restlichen Spalten. Euch ist vielleicht aufgefallen, dass ein Tweet, in dem 3 Mal das Wort _organic_ vorkommt, nun auch 3 Treffer für dieses Wort gut geschrieben wird. Möchte man jedes Wort nur einmal zählen, egal wie häufig es vorkommt, so verwendet diese Variante:

```sql
select id
      ,text
      ,collect_set(keyword) as hits
      ,count(distinct keyword) as num_hits
from tweets
left join keywords
  on str_contains(lower(text), keyword)
where keyword is not null
group by id, text
order by num_hits desc
```

Der Unterschied ist in den Zeilen 3 und 4 zu erkennen. Die Funktion `collect_set` erstellt eine Liste ohne doppelte Elemente (im Gegensatz zu `collect_list`), und `count(distinct word)` zählt jedes Wort nur einmal, egal, wie häufig es vorkommt.&#x20;

{% hint style="info" %}
Bei größeren Tabellen kann die Verwendung der UDF langsamer sein, als wenn die Texte in einzelne Wörter zerlegt wurden. Daher sollte bei komplexen Textanalysen die Variante des [Tokenizing](broken-reference) verwendet werden.
{% endhint %}

Beachtet, dass ihr mit eigenen UDFs **keine persistenten Views** mittels `create or replace view` erstellen könnt. Verwendet stattdessen `create or replace temporary view`. Ihr müsst bei Verwendung eines neuen Clusters den View dann erst erneut erstellen.
