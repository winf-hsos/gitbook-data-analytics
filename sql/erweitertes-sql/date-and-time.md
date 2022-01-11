# Datum und Zeit

## Notebook

Das folgende Notebook enthält Beispiele für die Verwendung wichtiger Datums- und Zeitfunktionen in SQL:

{% embed url="https://winf-hsos.github.io/databricks-notebooks/sql/date_and_time_with_sql.html" %}

## Datumsformate in Spark 3.x

Mit der Einführung von Spark 3.0 wurden auch neue Formatierungsmuster für Datum- und Zeitwerte eingeführt. Eine Übersicht der aktuell gültigen Muster finden ihr hier:

{% embed url="https://spark.apache.org/docs/latest/sql-ref-datetime-pattern.html" %}

Wir können jederzeit die alten Formatierungsmuster verwenden, indem wir den folgenden Scala-Befehl ausführen. Das alte Format ist dann im Kontext des aktuellen Notebooks und seiner laufenden Session gültig:

```scala
spark.conf.set("spark.sql.legacy.timeParserPolicy","LEGACY")
```

Alternativ können wir den Befehl auch direkt als SQL-Befehl ausführen:

```sql
set spark.sql.legacy.timeParserPolicy=LEGACY
```

## Zeitdifferenzen in Sekunden, Minuten oder Stunden

Unten sehen wir ein Beispiel für die Berechnung von Zeitdifferenzen auf Basis von 2 Zeitstempeln:

```sql
select
  id,
  date,
  date_previous_homicide,
  bigint(date) - bigint(date_previous_homicide) as seconds_between,
  (bigint(date) - bigint(date_previous_homicide)) / 60 as minutes_between,
  (bigint(date) - bigint(date_previous_homicide)) / 60 / 60 as hours_between  
from
  (
    select
      id,
      date,
      lag(date) over (
        order by
          date
      ) as date_previous_homicide,
      block
    from
      crimes_chicago
    where
      PrimaryType = "HOMICIDE"
    order by
      date
  )
```
