# Säubern und Normalisieren

## Übersicht <a href="#uebersicht" id="uebersicht"></a>

Im zweiten Schritt ist es sinnvoll, bestimmte Zeichen aus den Texten zu entfernen:

* Sonderzeichen wie @, %, & usw., die für eine Analyse keine Bedeutung haben.
* Satzzeichen, die ebenfalls keine Bedeutung für die Analyse haben.

Es kann sinnvoll sein, diese Zeichen bestehen zu lassen. Wenn wir allerdings - wie hier - die Texte für die Analyse von Wortvorkommnissen und die Aggregation auf Wortbasis vorbereiten wollen, benötigen wir diese Zeichen nicht. Im Gegenteil, sie stören uns nur.

Neben dem Entfernen von Satz- und Sonderzeichen transformieren wir in diesem Schritt alle Buchstaben in Kleinbuchstaben. Das erlaubt es uns später, mögliche Fehler der Nutzer bei der Groß- und Kleinschreibung zu ignorieren.

```sql
select id 
      ,screen_name
      ,text as original_text
      ,lang
      ,created_at
       -- Remove white spaces at the beginning or end
      ,trim(
         -- Remove two or more subsequent white spaces
         regexp_replace(
           -- Remove special characters
           regexp_replace(
             -- Convert to lower case
             lower(
               -- Replace line breaks (2 different types)
               regexp_replace(
                 regexp_replace(text, '\n', ' '), '\r', ' ')), '[^a-zA-ZäöüÄÖÜß]', ' '), '\ {2,}', ' ')) as `text`
from tweets_filtered
```

Das Statement sieht auf den ersten Blick kompliziert aus. Daher schauen wir es uns im Detail an.

Wie in Zeile 17 zu sehen, basiert der neue View auf dem View aus dem [ersten Schritt](prefilter-the-data.md). Die Schritte bauen immer auf dem Ergebnis des vorigen Schrittes auf.

## ​Zeilenumbrüche `\n` durch Leerzeichen ersetzen <a href="#zeilenumbrueche-n-durch-leerzeichen-ersetzen" id="zeilenumbrueche-n-durch-leerzeichen-ersetzen"></a>

Spannend wird es ab der Zeile 7: Hier folgen nun verschachtelte Aufrufe von 6 Funktionen hintereinander. Die Aufrufe erfolgen von innen nach außen:

```sql
-- 1. Funktion
regexp_replace(text, '\n', ' ')
```

Die Funktion `regexp_replace` ersetzt das Vorkommen eines bestimmten Zeichens (oder Muster von Zeichen, wie weiter unten zu sehen) mit etwas anderen. Das erste Argument gibt die Spalte an, in der ersetzt werden soll (hier: `text`). Das zweite Argument ist das Zeichen (oder Muster), das ersetzt werden soll. Die Angabe `\n` ist ein Sonderzeichen und stellt einen Zeilenumbruch dar. Das dritte Argument ist das Zeichen, dass statt des gesuchten Zeichens eingesetzt werden soll. Hier soll ein Leerzeichen verwendet werden. Kurz gesagt: **Ersetze alle Zeilenumbrüche durch Leerzeichen**!

## ​Zeilenumbrüche `\r` durch Leerzeichen ersetzen <a href="#zeilenumbrueche-r-durch-leerzeichen-ersetzen" id="zeilenumbrueche-r-durch-leerzeichen-ersetzen"></a>

Leider gibt es noch weitere Symbole für Zeilenumbrüche, die häufig auch in Kombination auftreten. Um sicherzugehen, ersetzen wir auch das oft verwendete Symbol `\r` mit einem Leerzeichen:

```sql
-- 2. Funktion
regexp_replace( ... , '\r', ' ')
```

Die drei Punkte, an deren Stelle wir eine Spalte erwarten, stehen hier für den Ausdruck aus der 1. Funktion. Das Ergebnis einer Funktion ist wie der Wert einer neuen Spalte zu interpretieren.

## Buchstaben in Kleinschreibung umwandeln <a href="#buchstaben-in-kleinschreibung-umwandeln" id="buchstaben-in-kleinschreibung-umwandeln"></a>

Die Buchstaben können wir mit der Funktion `lower()` in kleine Buchstaben umwandeln:

```sql
-- 3. Funktion (Zeile 13)
lower( ... )
```

## Sonderzeichen und Satzzeichen entfernen <a href="#sonderzeichen-und-satzzeichen-entfernen" id="sonderzeichen-und-satzzeichen-entfernen"></a>

Wir haben oben gesehen, wie wir mit `regexp_replace` einzelne Zeichen wie `\n` oder `\r` suchen und ersetzen können. Die Funktion ist aber noch deutlich mächtiger: Mit ihr können wir bestimmten Mengen oder Mustern von Zeichen suchen:

```sql
-- 4. Funktion (Zeile 11)
regexp_replace( ... , '[^a-zA-ZäöüÄÖÜß]', ' ')
```

Anstatt als zweites Argument ein einzelnes Zeichen anzugeben, nutzen wir einen [regulären Ausdruck](https://de.wikipedia.org/wiki/Regul%C3%A4rer\_Ausdruck), um gleich mehrere Zeichen zu suchen. Diese etwas kryptische Angabe ist wie folgt zu lesen: Suche alle Zeichen, außer den angegebenen a - z, A - Z, ä, ö, ü, Ä, Ö, Ü, und ß, und ersetze sie mit einem Leerzeichen. Das Symbol `^` steht dabei für die Verneinung.

## Überflüssige Leerzeichen aufräumen <a href="#ueberfluessige-leerzeichen-aufraeumen" id="ueberfluessige-leerzeichen-aufraeumen"></a>

Weil wir alle Sonderzeichen, Satzzeichen und Zeilenumbrüche mit Leerzeichen ersetzen, haben wir im Ergebnis häufig eine Serie von Leerzeichen hintereinander. Diese Serien von Leerzeichen wollen wir im letzten Schritt auf jeweils nur ein Leerzeichen reduzieren:

```sql
-- 5. Funktion (Zeile 9)
regexp_replace( ... , '\ {2,}', ' ')
```

Auch hier nutzen wir einen regulären Ausdruck. Der ist so zu lesen: Suche nach mindestens 2 oder mehr Leerzeichen und ersetze sie mit einem Leerzeichen.

## Twitter Hashtags entfernen (optional) <a href="#twitter-hashtags-entfernen-optional" id="twitter-hashtags-entfernen-optional"></a>

Möglicherweise ist es sinnvoll, Hashtags ebenfalls aus den Texten zu entfernen, zumal diese bereits über eine eigene Spalte getrennt analysierbar sind. Weil wir Hashtags an der Raute # erkennen, muss das Entfernen vor dem Ersetzen der Sonderzeichen passieren:

```sql
-- Optionale Funktion für Hashtags
regexp_replace( ... , '#([[a-zA-ZäöüÄÖÜß]|[0-9]]+)', ' ')
```

## User Mentions entfernen <a href="#user-mentions-entfernen" id="user-mentions-entfernen"></a>

Erwähnungen von Nutzern beginnen in Tweets mit dem @-Symbol. Diese sind für die Wortanalyse nicht relevant und können über einen regulären Ausdruck entfernt werden:

```sql
-- Funktion zum Entfernen von User Mentions in Tweets
regexp_replace( ... , '@([[a-zA-ZäöüÄÖÜß]|[0-9]]+)', ' ')
```

## URLs entfernen (optional) <a href="#urls-entfernen-optional" id="urls-entfernen-optional"></a>

Das Gleiche gilt auch für URLs, die z.B. häufig in Tweets enthalten sind. Auch die können wir mit einem regulären Ausdruck finden und ersetzen:

```sql
-- Optionale Funktion für URLs
regexp_replace(text, 'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', ' ')
```

Der vollständige View, inklusive dem Entfernen der Hashtags, User Mentions und URLs, sähe dann so aus:

```sql
create or replace view tweets_cleaned as
select id
      ,screen_name
      ,text as original_text
      ,lang
      ,created_at
     
       -- Remove white spaces at the beginning or end
      ,trim(
         -- Remove two or more subsequent white spaces
         regexp_replace(
           -- Remove special characters
           regexp_replace(
             -- Make all text lower case
             lower(
               -- Replace user mentions
               regexp_replace(
                 -- Replace URLs
                 regexp_replace(
                   -- Replace hashtags
                   regexp_replace(
                     -- Replace line breaks (2 different types)
                     regexp_replace(
                       regexp_replace(text, '\n', ' '),
                         '\r', ' '), '#([[a-zA-ZäöüÄÖÜß]|[0-9]]+)', ' '), 'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', ' '), '@(\\w+)', ' ')), '[^a-zA-ZäöüÄÖÜß]', ' '), '\ {2,}', ' ')) as `text`
from tweets_filtered

```
