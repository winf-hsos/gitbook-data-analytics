# Zeilen aggregieren und gruppieren

## Mehrere Zeilen verdichten

Bisher entsprach jede Zeile im Ergebnis einer SQL-Abfrage immer einer Zeile im Datensatz. Die Daten wurden bisher nicht verdichtet. Die Verdichtung von Daten ist ein wichtiges Kernelement bei der Datenanalyse. Wir lernen in diesem Artikel Möglichkeiten kennen, viele Zeilen zu wenigen oder nur einer zu aggregieren.

## Einfache Aggregationsfunktionen

Gerade bei großen Datenmengen interessieren wir uns oft nicht für einzelne Zeilen, sondern für **berechnete Größen auf Basis vieler Zeilen**. Hier kommen die **Aggregationsfunktionen** ins Spiel. Die Liste zeigt einige wichtige Aggregationsfunktionen:

* `count()`
* `sum()`
* `avg()`
* `min()`
* `max()`
* `distinct`

### Zeilen zählen

Für vielen Analysen beinhalten das einfache Zählen von Zeilen:

* Wie viele Bestellungen gab es im letzten Monat?
* Wie viele Tweets zum Thema Covid19 gab es im Dezember 2020?
* Wie viele Kunden kauften die Campusbier-Weihnachtskiste?

SQL stellt uns dafür die `count()`-Funktion zur Verfügung. Nehmen wir an, wir wollen alle TED-Talks im Datensatz zählen:

```sql
select count(*) as `Anzahl Talks` from ted_meta
```

![Das Ergebnis der Abfrage oben besteht aus einer Zahl.](<../../.gitbook/assets/image (6).png>)

Wir haben in der Abfrage oben als Parameter der Funktion `count()` den Wert `*` angegeben. Was hat es damit auf sich? Ähnlich wie bei der Selektion aller Spalten mit `select * from` steht das `*` auch hier als Platzhalter für alle Spalten in der Tabelle. Warum aber können und müssen wir überhaupt einen Parameter für das Zählen von Zeilen übergeben? Dazu schauen wir uns die offizielle Definition der `count()`-Funktion an:

> _The count() function returns the number of rows in a table satisfying the criteria specified in the WHERE clause. It returns the number of rows or non NULL column values_.

Wir können die Funktion grundsätzlich auf 2 Arten verwenden:

* `count(*)` - Zählen aller Zeilen einer Tabelle, egal ob `null`-Werte vorhanden sind oder nicht
* `count(*expression*)` - Zählen alle Werte einer Spalte oder eines Ausdrucks, die nicht `null` sind.

Erinnert euch, dass der Wert `null` kein Wert an sich ist, sondern im Datenbankumfeld als Platzhalter für einen fehlenden Wert verwendet wird.

#### Nicht-leere Werte eine Spalte zählen

Die unten stehende Abfrage zählt somit nicht alle Zeilen der Tabelle `ted_meta`, sondern nur die Werte in der Spalte `youtube_id`, die unterschiedlich von `null` sind:

```sql
select count(youtube_id) from ted_meta
```

### Werte summieren

Wie viele Views hatten alle Talks des TED 2010 Events?

```sql
select sum(views) as `Summe der Views`
from ted_meta
where event = 'TED2010'
```

### Arithmetische Mittel berechnen

Was ist die durchschnittliche Länge eines TED-Talks?

```sql
select avg(duration / 60) as `Durchschnittliche Länge in Minuten`
from ted_meta
```

### Größte oder kleinste Werte ermitteln

Wie lang ist der längste und kürzeste TED-Talk?

```sql
select max(duration / 60) as `Dauer des längsten Talks in Minuten`
      ,min(duration / 60) as `Dauer des kürzesten Talks in Minuten`
from ted_meta
```

### Wertebereich (eindeutige Werte) bestimmen

Wie sieht die Liste aller Sprecher aus (nur eindeutige Sprecher)?

```sql
select distinct main_speaker
from ted_meta
```

## Gruppieren von Daten

Ihr habt gerade gesehen, wie man einfache Aggregationen, wie das Zählen oder Summieren einer Spalte, auf alle Datensätze in einer Tabelle anwenden kann. Oftmals möchte man aber **einen Wert pro Gruppe** innerhalb der Daten ermitteln. Das funktioniert mit der `group by` Klausel.

```sql
select event
      ,avg(duration / 60) as `Durchschnittliche Dauer in Minuten`
from ted_meta
group by event
order by avg(duration /60) desc
```

Die SQL-Abfrage oben ermittelt die durchschnittliche Dauer eines Talks in Minuten **pro Event.** Das heißt, es gibt nicht eine Zeile als Ergebnis, sondern eine Zeile pro Event. Zusätzlich wird noch nach der Dauer sortiert, sodass die Events mit den durchschnittlich längsten Talks oben erscheinen.

Wir können auch nach mehreren Spalten oder Kriterien gruppieren:

```sql
select event
      ,speaker_occupation
      ,avg(duration / 60) as `Durchschnittliche Dauer in Minuten`
from ted_meta
group by event, speaker_occupation
order by avg(duration /60) desc
```

Unsere Gruppen sind nun etwas feiner, d. h. wir bekommen im Ergebnis mehr Zeilen und damit durchschnittliche Dauern in Minuten. Nämlich eine pro Event und Beruf der Speakers.

### Achtung: Beliebte Fehlerquelle

Ein häufiger Fehler beim Erstellen von SQL-Abfragen ist das Vergessen von Spalten in der Gruppierung. In diesem Fall bekommt man die folgende Fehlermeldung, die immer die gleiche Lösung hat:

Beliebter Fehler: Vergessen zu gruppieren.

![https://gblobscdn.gitbook.com/assets%2F-LIAGGBJMP1kBzA4YD-z%2F-LZshPtDRqrm9SAWyMfN%2F-LZsijG9RhSYFNfiuqWr%2Fimage.png?alt=media\&token=eb40dc5e-79ae-4f95-a686-b8c7c0200655](https://gblobscdn.gitbook.com/assets%2F-LIAGGBJMP1kBzA4YD-z%2F-LZshPtDRqrm9SAWyMfN%2F-LZsijG9RhSYFNfiuqWr%2Fimage.png?alt=media\&token=eb40dc5e-79ae-4f95-a686-b8c7c0200655)

Im Screenshot oben wurde die Spalte `speaker_occupation` nicht in der Gruppierung aufgeführt, was zu diesem Fehler führt.

{% hint style="info" %}
Als Faustregel gilt: Alle Spalten, auf die keine Aggregationsfunktion angewendet werden, müssen in der `GROUP BY` Klausel auftauchen.
{% endhint %}
