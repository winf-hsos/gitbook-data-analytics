# Zeilen sortieren

## Zeilen in eine Reihenfolge bringen

Einfach, aber sehr mächtig: das Sortieren von Ergebnissen erlaubt es uns, Ranglisten zu erstellen und durch Auf- oder Abwärtssortierung schnell den kleinsten oder größten Wert in einer Liste zu identifizieren.

Das erste Beispiel erzeugt eine Liste der TED-Talks und sortiert sie nach der Anzahl Views. Wobei der Talk mit den wenigsten Views oben in der Ergebnisliste erscheint:

```sql
select * from ted_meta
order by views
```

## Aufsteigend oder absteigend?

Wollen wir lieber den TED-Talk mit den _meisten_ Views oben sehen, drehen wir das Ergebnis einfach um, indem wir die Sortierungsrichtung ändern:

```sql
select * from ted_meta
order by views desc
```

![https://gblobscdn.gitbook.com/assets%2F-LIAGGBJMP1kBzA4YD-z%2F-LY7NWmPjyRS1soM0EOl%2F-LY7PMnvVRTxe1Uho6FS%2Fimage.png?alt=media\&token=ef64a9c2-d542-4522-97d8-94c7a73e9b7d](https://gblobscdn.gitbook.com/assets%2F-LIAGGBJMP1kBzA4YD-z%2F-LY7NWmPjyRS1soM0EOl%2F-LY7PMnvVRTxe1Uho6FS%2Fimage.png?alt=media\&token=ef64a9c2-d542-4522-97d8-94c7a73e9b7d)

Die Zusatzangabe `desc` steht für _descending_ und bedeutet übersetzt absteigend. Das bedeutet, größere Werte erscheinen oben. Ohne das Schlüsselwort `DESC` wird standardmäßig aufsteigend sortiert, was explizit auch mit dem Schlüsselwortpendant `ASC` erreicht werden kann.

## Sortieren nach mehreren Spalten

Wir haben die Möglichkeit, mehr als ein Sortierkriterium anzugeben. Die Reihenfolge ist entscheidend: Es wird zuerst nach dem Ersten und dann nach den nachfolgenden Kriterien sortiert. Wir wollen als Beispiel alle TED-Talks nach ihrem Event sortieren, und innerhalb eines Events nach der Dauer. Dabei sollen die längeren TED-Talks oben stehen (absteigende Sortierung):

```sql
select * from ted_meta
order by event asc, duration desc
```
