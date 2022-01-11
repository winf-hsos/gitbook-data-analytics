# Aggregierte Zeilen filtern

Mit der `group by`-Klausel können wir aggregierte Werte (Summen, Durchschnitte etc.) für Gruppen berechnen. Was aber, wenn wir im Ergebnis nicht alle Gruppen sehen wollen, sondern nur die, die einem gewissen Kriterium entsprechen? Hier können wir leider nicht mit der `where`-Klausel arbeiten, weil die sich nur auf einzelne Zeilen _vor_ der Gruppierung bezieht. Für gruppierte Daten gibt es deshalb die `having`-Klausel:

```sql
select event
      ,avg(duration / 60) as `Durchschnittliche Dauer in Minuten`
from ted_meta
group by event
having avg(duration / 60) >= 20
order by avg(duration /60) desc
```

Als Ergebnis der obigen Abfrage bekommen wir nur noch Events, deren durchschnittliche Talk-Länge mindestens 20 Minuten beträgt. Als Kontrast dazu: würden wir mit der `where`-Klausel auf der Spalte `duration` filtern bekämen wir nicht den gewünschten Effekt:

```sql
select event
      ,avg(duration / 60) as `Durchschnittliche Dauer in Minuten`
from ted_meta
where duration >= 20 * 60
group by event
order by avg(duration /60) desc
```

Wir würden so auf Zeilenebene bereits alle TED-Talks filtern, die kürzer als 20 Minuten sind und diese aus der Durchschnittsberechnung ausschließen. Im Ergebnis können aber trotzdem Events mit einer durchschnittlichen Länge von kleiner 20 Minuten enthalten sein.
