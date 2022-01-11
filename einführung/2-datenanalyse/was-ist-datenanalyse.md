# Was ist Datenanalyse?

## Daten sind groß und komplex

Um zu verstehen, was wir mit den Begriff _Datenanalyse_ meinen, schauen wir uns zur Veranschaulichung einen Datensatz mit Tweets von verschiedenen Benutzern an. Mit Twitter kann in der Regel jeder etwas anfangen, sodass wir die Daten nicht erst erklären müssen.&#x20;

Da Twitter öffentlich ist, können wir mithilfe einer von Twitter entwickelten Schnittstelle (API) Tweets verschiedener Benutzer auslesen, speichern und anschließend analysieren. Um einen Überblick über die Informationen zu einem Tweet zu bekommen, könnt ihr euch [die offizielle Dokumentation der Schnittstelle](https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/tweet) anschauen. Ihr erkennt schnell, dass es eine große Anzahl an Feldern gibt, die zu einem Tweet gehören. Hier nur ein paar davon:

| Feld                      | Bedeutung                                                                                                                |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `created_at`              | Zeitpunkt, an dem der Tweet gesendet wurde.                                                                              |
| `id`                      | Eindeutige Kennung für einen Tweet.                                                                                      |
| `text`                    | Der Textinhalt des Tweets.                                                                                               |
| `source`                  | Werkzeug, mit dem der Tweet erstellt wurde (Web-Client, Android App, iPhone App etc.).                                   |
| `in_reply_to_status_id`   | Die `id` des Tweets, auf den der Tweet eine Antwort ist.                                                                 |
| `in_reply_to_screen_name` | Der Benutzer, auf dessen Tweet dieser Tweet eine Antwort ist.                                                            |
| `user`                    | Der Autor des Tweets. Das Feld beinhaltet selbst eine große Menge an weiteren Feldern mit Informationen zu dem Benutzer. |
| `coordinates`             | Geokoordinaten des Tweets.                                                                                               |
| `quote_count`             | Wie oft wurde dieser Tweet zitiert?                                                                                      |
| `reply_count`             | Wie oft wurde auf diesen Tweet geantwortet?                                                                              |
| `favorite_count`          | Wie oft wurde dieser Tweet geliked?                                                                                      |
| `retweet_count`           | Wie oft wurde dieser Tweet retweeted?                                                                                    |
| `lang`                    | Die Sprache des Tweets als Abkürzung.                                                                                    |

Zu der großen Anzahl an Feldern kommt eine große Menge an Zeilen hinzu. Jeden Tweet könnt ihr euch als eine Zeile in einer Tabelle vorstellen. Die Tabelle hat so viele Spalten wie ein Tweet Felder besitzt. Wenn wir einen Datensatz mit 100 Benutzern haben, die über einen Zeitraum von 5 Jahren jeder ca. 3000 Tweets erzeugt haben, dann haben wir insgesamt 300.000 Zeilen in unsere Tabelle.

## In der Analyse wollen die Komplexität reduzieren

Zu der oben beschriebenen Tabelle fallen uns viele Fragen ein, die wir mit den Daten beantworten könnten. Die Antwort zu finden scheint aber aufgrund der Komplexität und Masse an Daten schwierig. Wir müssen einen Weg finden, die Komplexität der Daten zu verkleinern und letztlich nur auf die für die Beantwortung einer bestimmten Frage relevanten Informationen zu reduzieren. Das ist der Kern der Datenanalyse!

Schauen wir uns 3 Beispielfragen an und was wir mit den Daten machen müssten, um sie zu beantworten:

1. Wie viele Tweets haben alle Benutzer zusammen erzeugt?
2. Wie ist die Verteilung der Tweets nach Sprachen?
3. Wie oft kam der Hashtag #climatechange in jedem Jahr in allen Tweets vor?

