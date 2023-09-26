# Das CSV-Format

In der [Übung: Visueller Verlauf der Covid19-Pandemie mit Tableau ](https://www.notion.so/bung-Visueller-Verlauf-der-Covid19-Pandemie-mit-Tableau-bd643e311721433ea2394b4b9e9f628b)habt ihr mit dem [Datensatz: Covid-19](../../../datensaetze-und-uebungen/datensaetze/covid19.md) gearbeitet. Diesen stellt [Our World in Data](https://ourworldindata.org/) im CSV-Format zum Download bereit. Was hat es mit diesem Format auf sich?

CSV steht für _Comma Separated Values_ und es beschreibt ein Format, um strukturierte Daten in einer Textdatei abzuspeichern. Du erkennst eine Textdatei im CSV-Format an der Endung `.csv`.

Das CSV-Format ist das am weitesten verbreitete Format für den Austausch von strukturierten Daten. Fast jede Software, die Daten verwaltet oder analysiert, bietet Schnittstellen für CSV-Dateien an. Es gibt gute Gründe, warum sich das Format als universelle Lösung eignet:

1. Die Verwendung von einfachen Textdateien erlaubt die Speicherung und Verarbeitung auf unterschiedlichen Umgebungen wie Windows, Mac OS oder Linux.
2. Das Format ist sehr einfach zu verstehen und daher auch für Menschen in einem Texteditor prinzipiell lesbar.
3. Es ist ein offenes Format, d. h. es gibt keine Firma, die daran die Rechte besitzt und es kann daher von jeder Software verwendet werden. Es gab lange nicht einmal eine offizielle Spezifikation des Formats. Mittlerweile gibt es eine Spezifikation als [offizieller MIME Type](https://tools.ietf.org/html/rfc4180).

## Die erste Zeile beinhaltet die Spaltennamen

Das CSV-Format speichert strukturierte Daten in einer tabellarischen Form, ähnlich wie in Spreadsheets. Jede Zeile stellt einen Datensatz dar, und jeder Datensatz hat verschiedene Attribute (Spalten), deren Werte durch ein Komma voneinander getrennt sind. Dass ein Komma als Trennzeichen verwendet wird, ist jedoch keineswegs verbindlich. Generell kann jedes Symbol verwendet werden. Häufige Alternativen sind das Semikolon, Leerzeichen oder ein Tabstop.

Der Screenshot unten zeigt den [Datensatz: Covid-19](https://www.notion.so/Datensatz-Covid-19-5d1cae3624dc4690b4ab1be2991cd96f) in einem einfachen Texteditor ([Notepad++](https://notepad-plus-plus.org/downloads/)). Man erkennt schnell, dass sie erste Zeile sich von den anderen unterscheidet: Sie beinhaltet die Spaltennamen, die hintereinander durch das Trennzeichen (hier: Komma) getrennt aufgelistet werden. Man nennt die erste Zeile auch Kopfzeile (Englisch: Header).

![Der Covid19-Datensatz in Notepad++ geöffnet.](<../../../.gitbook/assets/image (22).png>)

Die Kopfzeile ist nicht verpflichtend. Es gibt auch CSV-Dateien ohne Kopfzeile. In diesem Fall muss die Benennung der Spalten später manuell erfolgen.

## Alle weiteren Zeilen sind Datensätze

Jede Zeile nach der Kopfzeile stellt einen Datensatz dar. Für jeden Datensatz werden die Spaltenwerte in der gleichen Reihenfolge wie in der Kopfzeile durch das Trennzeichen (hier: Komma) voneinander getrennt aufgelistet. Es muss nicht für jeden Datensatz jeder Wert existieren. Sollte ein Wert nicht vorhanden sein, so wird einfach nach dem Komma nichts eingetragen und es folgen zwei Kommata nacheinander (für ein Beispiel siehe rote Markierung in Zeile 3 oben).

## Nicht nur Kommata sind möglich

Die Bezeichnung und Dateiendung `.csv` hat sich als Standard durchgesetzt, auch wenn nicht zwangsweise das Komma als Trennzeichen verwendet werden muss. Häufige Trennzeichen sind auch das Semikolon oder ein Tabstop. Beim letzterem wird manchmal die Dateiendung `.tsv` verwendet. Grundsätzlich kann jedes beliebige Zeichen als Trennzeichen verwendet werden.

Wenn ihr CSV-Dateien in Programmen wie Tableau Desktop ladet, ist es wichtig zu wissen, welches Trennzeichen verwendet wird. Oft können Programme das selbst erkennen. Es ist aber immer besser sich zu vergewissern, dass das richtige Trennzeichen erkannt wurde, weil ansonsten die Daten fehlerhaft eingelesen werden.

Wie ihr die Einstellung in Tableau Desktop ändert, seht ihr in dem animierten Bild unten.

![So ändert ihr das Trennzeichen für eine CSV-Datei in Tableau Desktop.](../../../.gitbook/assets/tableau\_change\_csv\_separator.gif)

