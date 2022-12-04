# Spalten verändern

## Neue Spalten hinzufügen

Neue Spalten, wie etwa Berechnungen, zu einem Dataframe hinzuzufügen ist eine häufige Aufgabe in der Datenanalyse. In der `dplyr` Bibliothek aus Tidyverse verwenden wir dafür die `mutate`-Funktion:

```r
fp_tbl_new <- fp_tbl %>% mutate(fp_tbl, logistics = transport + packging + retail)

fp_tbl_new %>% select(transport, packging, logistics))
```

Als erstes Argument der Funktion übergeben wir den Dataframe (Tibble). Danach definieren wir die neue Spalte mit Namen gefolgt von einem Gleichheitszeichen und dem Wert für die neue Spalte. Ist der Wert eine Berechnung auf Basis anderer Spalten, so wird diese Berechnung Zeile für Zeile vorgenommen und der Wert der neuen Spalte entsprechend gesetzt.

{% embed url="https://dplyr.tidyverse.org/reference/mutate.html" %}

## Nur verwendete Spalten behalten

Wir können mit der `mutate` Funktion eine neue Spalte hinzufügen und gleichzeitig alle Spalten entfernen, die nicht an der Berechnung beteiligt sind:

```r
fp_tbl_new <- fp_tbl %>% mutate(fp_tbl, logistics = transport + packging + retail)
```

## Nur neuen Spalten behalten

Mit `transmute` können wir auch nur Spalten behalten, die gerade neu erzeugt wurden. Bestehende Spalten, die wir dennoch behalten wollen, können wir einfach neu definieren:

```
food_production %>% transmute(food_product = food_product, logistics = transport + packging + retail)
```
