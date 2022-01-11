# Verbinden von Tabellen

## Der `JOIN`-Operator

In SQL können wir den `JOIN`-Operator nutzen, um zwei Tabellen miteinander zu verbinden. Wir können den `JOIN`-Operator innerhalb einer Abfrage beliebig oft verwenden und so beliebige viele Tabellen in die Abfrage einbeziehen. Der `JOIN`-Operator benötigt einen Ausdruck, der angibt, wie genau 2 Tabellen miteinander verbunden werden sollen. Wir nennen diesen Ausdruck auch die `JOIN`-Bedingung. Für gewöhnlich werden Tabellen über die existierenden Fremd- und Primärschlüsselbeziehungen miteinander verknüpft. Die `JOIN`-Bedingung hat dann die Form `FK1 = PK`

Es gibt unterschiedliche Typen von `JOINS`:

* `CROSS JOIN`: Das Ergebnis ist das Kreuzprodukt alle Einträge aus beiden Tabellen. Eine `JOIN` Bedingung entfällt bei diesem Typ. Dieser Typ ist in der Praxis fast ohne Relevanz und wir in diesem Artikel nicht weiter vorgestellt. Im unten verlinkten Notebook findet ihr ein Beispiel dafür.
* `INNER JOIN`: Im Ergebnis sind nur die Zeilen enthalten, für die Treffer in beiden beteiligten Tabellen existieren. Alle anderen Zeilen werden herausgefiltert.
* `LEFT JOIN` und `RIGHT JOIN`: Im Ergebnis sind alle Zeilen der linken oder der rechten Tabelle enthalten. Fehlende Pendants in der jeweils anderen Tabelle werden mit dem Platzhalter für fehlende Werte `NULL` aufgefüllt.
* `FULL OUTER JOIN`: Im Ergebnis sind alle Zeilen beider Tabellen enthalten, egal ob es in der jeweils anderen Tabelle Treffer gab. Fehlende Werten von auf beiden Seiten mit dem Platzhalter für fehlende Werte `NULL` aufgefüllt.

## Anwendungsbeispiel

Ein Informationssystem nutzt zur Verwaltung der Informationen die 3 oben beschriebenen Tabellen. Alle Bestellungen werden in der Tabelle `orders` verwaltet. Dort sind Spalten für das Datum und die Uhrzeit der Bestellung, der Zahlungsart und dem Status der Bestellung hinterlegt. In einer zweiten Tabelle `customers` verwaltet das System die Informationen zu den Kunden. Darunter fallen Informationen wie der Vor- und Nachname, die Postadresse und die E-Mail-Adresse. Da eine Bestellung immer zu genau einem Kunden gehört, gibt es eine Verknüpfung zwischen diesen beiden Tabellen. Die Verknüpfung wird über den eindeutigen Schlüssel eines Kunden abgebildet. Dieser Schlüssel ist eine intern generierte Nummer, die für jeden Kunden eindeutig ist. Der Schlüssel des Kunden wird als sogenannter Fremdschlüssel in die Tabelle `orders` eingetragen und verweist auf einen bestimmten Eintrag in der Tabelle `customers`.

Wie würden wir auf Basis des beschriebenen Datenmodells die folgende Frage mit SQL beantworten: Welche 10 Kunden haben die meisten Bestellungen getätigt? Um die Antwort zu finden, müssen wir Informationen aus beiden Tabellen abfragen. Die `orders`, weil dort die Bestellungen enthalten sind, die wir zählen wollen. Die `customers`, weil dort der Name der Kunden enthalten sind, die wir im Ergebnis ausgeben wollen. Diese Verknüpfung können wir in SQL mit einem sogenannten `join` herstellen. Im fiktiven Beispiel sähe das so aus:

```sql
select nachname
			,vorname
			,count(*) as `Anzahl Bestellungen`
from orders
inner join customers
	on orders.customer_id = customers.customer_id
group by nachname, vorname
```

Nehmen wir an, wir haben 2 Kunden A und B in der Tabelle `customers`. Wir nehmen weiter an, dass mit Kunde A **3 Bestellungen** und mit Kunde B **2 Bestellungen** in der Tabelle `orders` verknüpft sind (im Feld `customerId` steht die ID des jeweiligen Kunden). In diesem Szenario würde der obige `inner join` der beiden Tabellen über das Feld `customerId`, das in beiden Tabellen vorhanden ist, zu einem Ergebnis mit 5 Zeilen führen. Jede Bestellung wird um die Informationen aus der Tabelle `customers` ergänzt. Wenn wir anschließend wie oben die Zeilen zählen und nach dem Vor- und Nachnamen des Kunden gruppieren, so erhalten wir im Ergebnis eine Zeile pro Kunde mit der Anzahl Bestellungen für diesen Kunden.

## `INNER JOIN` - Nur Treffer auf beiden Seiten im Ergebnis belassen

Unten seht ihr eine schematische Darstellung der Funktionsweise einer `INNER JOIN` Operation. Es bleiben nur Zeilen im Ergebnis, bei denen es in beiden Tabellen Treffer gibt.

![](../../.gitbook/assets/Advanced\_SQL\_-\_Inner\_Join.svg)

## `LEFT JOIN` - Alle Zeilen der linken Tabelle behalten

Unten seht ihr eine schematische Darstellung der Funktionsweise einer `LEFT JOIN` Operation. Es bleiben alle Zeilen der linken Tabelle im Ergebnis. Es werden alle Informationen aus der rechten Tabelle aufgefüllt, wenn Treffer vorhanden sind. Ansonsten wird der Platzhalter NULL zurückgegeben.

![](../../.gitbook/assets/Advanced\_SQL\_-\_Left\_Join.svg)

## `RIGHT JOIN` - Alle Zeilen der rechten Tabelle behalten

Unten seht ihr eine schematische Darstellung der Funktionsweise einer `RIGHT JOIN` Operation. Es bleiben alle Zeilen der rechten Tabelle im Ergebnis. Es werden alle Informationen aus der linken Tabelle aufgefüllt, wenn Treffer vorhanden sind. Ansonsten wird der Platzhalter NULL zurückgegeben. Der `RIGHT JOIN` funktioniert wie der `LEFT JOIN` und dreht lediglich die Reihenfolge der Tabellen um.

![](../../.gitbook/assets/Advanced\_SQL\_-\_Right\_Join.svg)

## `FULL OUTER JOIN` - Alle Zeilen beider Tabellen behalten

Unten seht ihr eine schematische Darstellung der Funktionsweise einer `FULL OUTER JOIN` Operation. Es bleiben alle Zeilen beider Tabellen im Ergebnis. Fehlende Informationen in beiden Tabellen werden mit dem Platzhalter NULL aufgefüllt zurückgegeben. Der `FULL OUTER JOIN` ist äquivalent zur gleichzeitigen Anwendung eines `LEFT` und `RIGHT JOINS`.

![](../../.gitbook/assets/Advanced\_SQL\_-\_Full\_Outer.svg)

## Vereinfachtes Beispiel im Databricks Notebook

Im verlinkten Notebook nutzen wir ein einfaches Datenmodell bestehend aus 2 Tabellen, um das Konzept des `join` mit seinen unterschiedlichen Ausprägungen zu illustrieren.

{% embed url="https://s3.us-east-1.amazonaws.com/nicolas.meseth/databricks-notebooks/example_notebook_sql_joins.html" %}

## Slides

Die folgenden Slides führen die unterschiedlichen `join`-Typen in SQL an einem visuellen Beispiel ein.

{% embed url="https://docs.google.com/presentation/d/1ISi6MnYVgjzcjJMmCu5d1vv-CdgyBLCCXZCWM7GbSj4/view" %}
