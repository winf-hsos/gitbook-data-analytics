# Zeilen filtern

## Bestimmte Zeilen auswählen

Bei der Analyse von Daten benötigen wir eine Möglichkeit, nur bestimmte Zeilen im Ergebnis zu behalten.  Beispielsweise könnte unsere Frage sich nur auf einen bestimmten Zeitraum unserer Daten beziehen. Möglicherweise interessieren uns nur die Tweets eines bestimmten Nutzers oder die einer Nutzergruppe. Oder wir wollen in einer Umfrage nur Teilnehmer_innen_ betrachten. In jedem dieser Fälle benötigen wir eine Möglichkeit, auf einer Spalte eine Filterung vorzunehmen. In SQL steht uns dafür der `WHERE`-Befehl zur Verfügung.

![Visuelle Darstellung des WHERE-Befehls.](<../../.gitbook/assets/Basic SQL - Filter.svg>)

Mit dem `WHERE`-Befehl leiten eine oder mehrere Bedingungen ein, die für jede unserer Zeilen im Ergebnis gelten sollen. Bei der Definition von Filterbedingungen spielt der Datentyp die betrachtete Spalte eine wichtige Rolle. Je nach Typ können wir unterschiedliche Bedingungen formulieren. Im Folgenden betrachten wir die wichtigsten Datentypen und lernen Beispiele für Filterbedingungen kennen.&#x20;

## Filtern von Strings (oder Zeichenketten)

### Der `=`-Operator

Im vorherigen Schritt haben wir gelernt, wie wir die Menge der **Spalten** im Ergebnis einschränken können. Häufig müssen wir für die Beantwortung einer Frage nur bestimmte die **Zeilen** heranziehen. Auch das geht mit SQL, und zwar mit der `where`-Klausel. Die folgende SQL-Abfrage gibt nur Zeilen zurück, in denen die Spalte `main_speaker` dem Wert "Al Gore" entspricht:

```sql
select * from ted_meta
where main_speaker = 'Al Gore'
```

Im Beispiel oben verwenden wir die `where`-Klausel, um ein Feld vom Datentyp `string` zu filtern. Genauer gesagt wird für alle Datensätze der Wert in der Spalte `main_speaker` mit dem Wert "Al Gore" verglichen. Es werden nur die Datensätze im Ergebnis behalten, bei denen der Vergleich _wahr_ (`true`) zurückliefert.

Bei Vergleichen zweier Zeichenketten (oder _Strings_) müssen wir immer **Anführungszeichen** (einfache oder doppelte, aber konsistent) verwenden. Weil Strings auch Leerzeichen oder andere Sonderzeichen enthalten können, wäre sonst nicht klar, wo das Ende der Zeichenkette ist.

### Der `LIKE`-Operator

Neben dem `=` Operator für Zeichenkettenvergleiche gibt es mit dem `LIKE` Operator eine weitere Möglichkeit, um Vergleiche von Zeichenketten durchzuführen. Der `LIKE` Operator erlaubt es uns, Strings mit Teilstrings oder Mustern zu vergleichen. Die folgende SQL-Abfrage liefert alle TED-Talks zurück, bei denen im Titel das Wort "food" vorkommt:

```sql
select * from ted_meta
where title like '%food%'
```

Bitte beachtet, dass SQL _case sensitive_ ist. Was heißt das? Es ist ein Unterschied, ob wir nach dem Wort "**f**ood" oder "**F**ood" im Titel suchen. Groß- und Kleinschreibung wird unterschieden. Die obige Abfrage würde somit einen Titel wie "Food is important" nicht im Ergebnis enthalten. Um das zu umgehen, wird häufig die zu vergleichende Spalte mit der Funktion `lower()` in Kleinbuchstaben umgewandelt:

```sql
select * from ted_meta
where lower(title) like '%food%'
```

Das `%` Zeichen in der obigen Abfrage ist so zu lesen: Es ist egal, was vor oder nach dem Wort "food" kommt. Wichtig ist nur, dass das Wort oder die Zeichenkette _irgendwo_ vorkommt. Wir können das `%` Zeichen auch so setzen, dass wir z.B. nur Titel mit "food" am Anfang eines Textes im Ergebnis haben:

```sql
select * from ted_meta
where lower(title) like 'food%'
```

Jetzt muss "food" am Anfang der Spalte `title` stehen, und es ist egal was danach kommt. Genauso können wir auch nach "food" am Ende suchen:

```sql
select * from ted_meta
where lower(title) like '%food'
```

Wir können die `%` Zeichen auch beliebig setzen, um nach dem Vorkommen unterschiedlicher Wörter in einer bestimmten Reihenfolge zu suchen:

```sql
select * from ted_meta
where lower(title) like '%food%smart'
```

Die obige Abfrage liefert TED-Talks zurück, deren Titel die Wörter "food" und "smart" in genau dieser Reihenfolge beinhaltet. Ihr seht schon, der `LIKE` Operator kann sehr mächtig sein.

Ein letztes Beispiel: Ihr wollt sicherstellen, dass vor dem Wort "food" nicht noch ein anderes Wort steht, wie z. B. wie in "seafood". Das könnt ihr so lösen:

```sql
select * from ted_meta
where lower(title) like '% food%'
```

Seht ihr den dezenten Unterschied? Es wurde vor "food" ein Leerzeichen gesetzt, also " food". Das Wort "seafood" würde somit nicht von diesem Vergleich gefunden werden. Allerdings wäre so auch ein Titel mit "food" am Anfang außen vor, weil ein Titel nie mit einem Leerzeichen beginnt. Um das zu lösen, müssen wir **mehrere** `WHERE`-**Bedingungen miteinander verknüpfen**:

```sql
select * from ted_meta
where lower(title) like '% food'
or lower(title) like 'food%'
```

## Verknüpfung mehrerer Bedingungen (`AND` / `OR`)

Wie oben gezeigt können wir mit `WHERE` die eine Filterbedingung definieren und anschließend weitere mit den logischen Verknüpfungen `OR` oder `AND` hinzufügen. So können wir beliebig viele Bedingungen definieren, die allesamt wahr sein müssen, damit eine Zeile im Ergebnis bleibt. Dabei können sich Bedingungen auf jede beliebige Spalte und beliebige Ausdrücke beziehen:

```sql
select * from ted_meta
where title like '%food%'
and event = 'TED2010'
```

Bei der Anwendung der Bedingungen gelten die Regeln der Logik. Das bedeutet, wir können auch Klammern verwenden, um Gruppen von Bedingungen zu bilden und diese miteinander zu verknüpfen.

```sql
select * from ted_meta
where 
(title like '%food%' and event = 'TED2010')
or 
(title like '%agriculture%' and event = 'TED2011')
```

Im Beispiel oben gibt es zwei Gruppen von Bedingungen, die in Klammern stehen. Innerhalb jeder Gruppe werden zwei Bedingungen definiert, die wahr sein müssen, damit die Gruppe, zu der sie gehören, wahr ist. Sollte eine der beiden Bedingungen title `like '%food%'` oder `event = 'TED2010'` falsch sein, so wird für die erste Gruppe `false` zurückgeben. Das gleiche gilt für die zweite Gruppe. Durch die Verknüpfung beider Gruppen mittels `or` reicht es aus, wenn eine der beiden Gruppen `true` zurückliefert.

## Filtern von Zahlenwerten

Beim Filtern von numerischen Spalten haben wir alle Möglichkeiten, die uns die Arithmetik bereitstellt, um Zahlen miteinander zu vergleichen:

* `=` : zwei Zahlen müssen exakt gleich sein.
* `>` und `>=`: die erste Zahl muss größer oder größer gleich der zweiten Zahl sein.
* `<` und `<=`: die erste Zahl muss kleiner oder kleiner gleich der zweiten Zahl sein.
* `<>`: zwei Zahlen müssen ungleich sein.

Im Beispiel unten nutzen wir den `=` Operator, um einen TED-Talk mit einer bestimmten `id` zu finden:

```sql
select * from ted_meta 
where id = 1
```

Die `id` ist eine ganze Zahl (Datentyp Integer) und wir benötigen bei numerischen Datentypen keine Anführungszeichen, wie das bei Zeichenketten der Fall ist.

### Der `IN`-Operator

Angenommen wir wollen nun nicht nur den Talk mit der `id = 1`, sondern zusätzlich den mit der `id = 100` selektieren. Wir können hier auf die bereits bekannte Verknüpfung von Bedingungen mit logischen Operatoren zurückgreifen:

```sql
select * from ted_meta
where id = 1
or id = 100
```

Hätten wir nun eine Liste mit 5 IDs, könnten wir entsprechend 3 weitere Bedingungen mit `OR` verknüpfen. Glücklicherweise gibt es eine einfachere und besser lesbare Möglichkeit:

```sql
select * from ted_meta
where id IN (1, 100, 101, 102, 200)
```

Mit dem `in` Operator können wir den Wert einer Spalte auf die Zugehörigkeit zu einer Menge, die wir mit Kommata getrennt in Klammern definieren, überprüfen. Wenn der Wert sich in der Menge befindet, wird die Bedingung wahr und die Zeile bleibt im Ergebnis.

### Größer (gleich) und kleiner (gleich)

Das nächste Beispiel fragt nach allen TED-Talks, die länger als 20 Minuten sind. Das Feld `duration` enthält die Länge in Sekunden:

```sql
select * from ted_meta 
where duration > 60 * 20
```

Wie ihr an dem Beispiel oben erkennt, können wir auf beiden Seiten der Gleichung nicht nur atomare Werte wie Zahlen oder Spaltennamen verwenden. Wir können auch **Ausdrücke** für Bedingungen verwenden. Im Beispiel oben ist der rechte Teil `60 * 20` ein Ausdruck, der die beiden Zahlen 60 und 20 miteinander multipliziert und das Ergebnis `1200` mit dem Wert der Spalte `duration` vergleicht.

Ein weiteres Beispiel zeigt, wie Zahlenvergleiche kombiniert werden können, um in diesem Fall alle TED-Talks mit mindestens 5 Minuten Länge und maximal 10 Minuten Länge zu erfragen:

```sql
select * from ted_meta
where duration >= 5 * 60 
and duration <= 10 * 60
```

### Der `BETWEEN`-Operator

Für Abfragen, in denen wir den Wert einer Spalte auf ein bestimmtes Intervall eingrenzen, gibt es den `between`-Operator als kürzere Variante. Wir erzielen mit der folgenden Abfrage dasselbe Ergebnis wie oben:

```sql
select * from ted_meta
where duration between 5 * 60 and 10 * 60
```

Der `between`-Operator schließt immer die angegebenen Grenzen mit in das Ergebnis ein (_inklusive_).

### Der `NOT`-Operator

Um das Ergebnis des letzten Beispiels umzukehren, also alle TED-Talks zu finden, deren Länge außerhalb der Spanne 5 - 10 Minuten liegen, können wir den `not`-Operator verwenden. Dieser negiert eine Bedingung:

```sql
select * from ted_meta
where duration not between 5 * 60 and 10 * 60
```

Der `not`-Operator kann beliebigen bool'schen Ausdrücken (wahr/falsch) vorangestellt werden, um diese in das Gegenteil zu verwandeln.

## Filtern Bool'scher Werte

Ein Bool'scher Wert kann nur die Werte wahr oder falsch annehmen (`true` oder `false`). Der entsprechende Datentyp einer solchen Spalte heißt `boolean`. Für Spalten vom Datentyp `boolean` kommen in den meisten Fällen nur die Operatoren `=` und `<>` infrage. Angenommen die Tabelle `ted_meta` hätte Spalte `best_talk` vom Typ `boolean`. Wir könnten dann alle TED-Talks, die für ihr jeweiliges Event zum besten Talk gewählt wurden, mit folgender SQL-Abfrage ermitteln:

```sql
select * from ted_meta
where best_talk = true
```

## Filtern von Datums- und Zeitwerten

Der Vergleich von Datums- und Zeitwerten funktioniert grundsätzlich über die arithmetischen Vergleichsoperatoren `<`, `<=`, `>`, `>=`, `=` und `<>`. Häufig brauchen wir aber Vergleiche, die über diese einfachen Operationen hinaus gehen, wie z.B.:

* Alle Talks des Jahres 2010
* Alle Events, die in den Monaten Juni, Juli und August stattfanden
* Alle Talks, die nicht mehr als 3 Jahre zurückliegen

Für solche komplexere Anwendungen verweise ich auf den Artikel [Date and Time](../erweitertes-sql/date-and-time.md), in dem spezielle Funktionen für den Umgang mit Datums- und Zeitwerten eingeführt werden.
