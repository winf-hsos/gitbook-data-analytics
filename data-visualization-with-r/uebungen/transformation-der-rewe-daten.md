# 💻 Transformation der REWE-Daten

## 1 Laden und Sichten der Daten

Ladet euch für diesen Teil der Übungsaufgabe die folgende CSV-Datei auf euren Computer herunter und speichert sie in einem Ordner eurer Wahl.

{% file src="../../.gitbook/assets/rewe_products (1).csv" %}

Öffnet nun eine neue R-Skriptdatei und setzt das Arbeitsverzeichnis für eure Sitzung auf den Ordner, in dem die Datei liegt. Versucht, die folgenden Aufgaben mittels R zu lösen. Speichert alle Kommandos in eurem R-Skript und verwendet Kommentare, um den Code den Aufgaben zuordnen zu können.

### 1.1 Daten als Tibble einlesen

{% tabs %}
{% tab title="Aufgabe" %}
Schreibt den notwendigen Code, um die Datei als Dataframe, genauer gesagt, als Tibble, zu laden. Welches Paket könnt ihr dafür verwenden?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
Das Paket `readr`, das mit dem Tidyverse automatisch mitgeladen wird, bietet eine Funktion zum Laden von CSV-Dateien:

```r
rewe <- read_csv("data/rewe_products.csv")
```
{% endtab %}
{% endtabs %}

### 1.2 Anzahl Zeilen und Spalten ausgeben

{% tabs %}
{% tab title="Aufgabe" %}
Wie viele Spalten und Zeilen sind im Datensatz enthalten? Gebt die Spaltennamen auf der Konsole aus!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% dim()
rewe %>%  colnames()
```
{% endtab %}
{% endtabs %}

### 1.3 Daten sichten

Findet Lösungen für die folgenden Aufgaben zur Sichtung der Daten:

{% tabs %}
{% tab title="Aufgabe a)" %}
Lasst euch die ersten 20 Produktnamen ausgeben! Wie könnt ihr alle Produkte sehen?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  select(productName) %>% 
  head(20)
  
# Alle Produktnamen als Vektor (theoretisch, Ausgabe stoppt bei 1000)
rewe %>% 
  select(productName) %>% 
  pull()
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe b)" %}
Gebt die ersten 30 Marken aus. Was fällt euch auf? Wie könntet ihr das lösen?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
# Die ersten 20 Marken im Datensatz
rewe %>% 
  select(brand) %>% 
  head(20)

# Ohne NAs
rewe %>% 
  select(brand) %>% 
  drop_na() %>% 
  head(20)

# Nur eindeutige Werte
rewe %>% 
  distinct(brand) %>% 
  drop_na()
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe c)" %}
Gebt die 5 Produkte mit dem höchsten Fettgehalt aus!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  select(productName, fatInGram) %>% 
  arrange(desc(fatInGram))

# Alternativ, bei numerischen Spalten

rewe %>% 
  select(productName, fatInGram) %>% 
  arrange(-fatInGram)
```
{% endtab %}
{% endtabs %}

### 1.4 Spaltenzusammenfassungen&#x20;

Verschafft euch einen Überblick über die Wertebereiche der Spalten und löst die folgenden Aufgaben:

{% tabs %}
{% tab title="Aufgabe a)" %}
Fasst die Spalten `vegan` und `vegetarian` zusammen. Was sagt ihr zu der Datenqualität der beiden Spalten?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  select(vegan, vegetarian) %>% 
  summary()
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe b)" %}
Erstellt eine Zusammenfassung aller Spalten, die einen Wert in Gramm enthalten. Welche verschiedenen Möglichkeiten findet ihr, das zu erreichen?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  select(ends_with("Gram")) %>% 
  summary()
```
{% endtab %}
{% endtabs %}

## 2 Einfache Transformationen

### 2.1 Auswählen von Spalten

{% tabs %}
{% tab title="Aufgabe a)" %}
Erstellt einen neuen Dataframe, der den Produktnamen, die Produktkategorie und den Verkaufspreis enthält!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
df <- rewe %>% 
  select(productName, productCategory, price)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe b)" %}
Erstellt einen neuen Dataframe mit allen Nährwertangaben sowie dem Produktnamen und der Produktkategorie!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
df <- rewe %>% 
  select(ends_with("Gram"), productName, productCategory)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe c)" %}
Erstellt einen neuen Dataframe, der nur numerische Spalten enthält. Prüft die Spalten und schreibt auf, was euch auffällt.
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
df <- rewe %>% 
  select(where(is.numeric))

df %>% 
  head(10)
```

Es fällt auch, dass die Spalten `gtin` und `productId` als numerische Werte erkannt wurden, auch wenn es sich hierbei eher um IDs handelt. Wir müsen diese Spalten manuell in das korrekte Format konvertieren (s. auch Aufgabe [2.3a](transformation-der-rewe-daten.md#2.3-spalten-veraendern)):

```r
rewe <- rewe %>% 
  mutate(productId = as.character(productId),
         gtin = as.character(gtin))
```
{% endtab %}
{% endtabs %}

### 2.2 Zeilen filtern

{% tabs %}
{% tab title="Aufgabe a)" %}
Filtert die Daten, sodass nur Produkte aus Deutschland enthalten sind. Behaltet nur den Produktnamen und das Herkunftsland im Ergebnis!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  filter(countryOfOrigin == "Deutschland") %>% 
  select(productName, countryOfOrigin)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe b)" %}
Findet alle veganen Bioprodukte!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  filter(vegan, bio) %>% 
  select(productName, vegan, bio)
  
# Expliziter
rewe %>% 
  filter(vegan == TRUE, bio == TRUE) %>% 
  select(productName, vegan, bio)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe c)" %}
Welche Biersorten werden im REWE-Onlineshop angeboten?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
# Welche Produkttyp steht für "Bier"?
rewe %>% 
 distinct(productType) %>% 
 filter(str_detect(productType, "Bier"))

rewe %>% 
  filter(productType == "Bier") %>% 
  count(brand, sort = TRUE)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe d)" %}
Findet alle Rotweine unter 2 EUR!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
# Welche Produkttyp steht für "Rotwein"?
rewe %>% 
  distinct(productType) %>% 
  filter(str_detect(productType, "wein"))

rewe %>% 
  filter(productType == "Rotwein") %>% 
  filter(price < 2) %>% 
  select(productName, price) %>% 
  arrange(price)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe e)" %}
Findet alle Produkte, die das Allergen Soja enthalten. Schaut euch dafür die Funktion `str_detect()` an!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  filter(str_detect(allergenStatement, "Soja")) %>% 
  select(productName, allergenStatement)
```
{% endtab %}
{% endtabs %}

### 2.3 Spalten verändern

{% tabs %}
{% tab title="Aufgabe a)" %}
Ändert den Datentyp der beiden Spalten `productId` und `gtin` in Zeichenketten (_chr_) um!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe <- rewe %>% 
  mutate(productId = as.character(productId),
         gtin = as.character(gtin))
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe b)" %}
Erstellt eine neue Spalte `sum_nutrition`, in der ihr die Summe aller Nährwertangaben bildet (auch wenn es inhaltlich nicht viel Sinn ergibt). Belasst im Ergebnis nur die neue Summenspalte und die einzelnen Nährwertspalten!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe c)" %}
Berechnet, ob ein Produkt mehr als 90 % Fett enthält und speichert diese Information auf einer neuen Spalte `high_fat`. Zeigt zur Überprüfung nur Zeilen an, bei denen der Wert `TRUE` ist. Die neue Spalte soll vor der Spalte `productDescription` eingefügt werden.
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  mutate(high_fat = fatInGram > 90, .keep="used") %>% 
  drop_na() %>% 
  filter(high_fat)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe d)" %}
Erstellt eine Spalte `foreign_bio`, die `TRUE` enthalten soll, wenn das Produkt ein Bioprodukt ist und gleichzeitig nicht aus Deutschland stammt.
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  mutate(foreign_bio = bio & countryOfOrigin == "Deutschland", .keep="used") %>% 
  filter(foreign_bio)
```
{% endtab %}
{% endtabs %}

### 2.4 Daten zusammenfassen

{% tabs %}
{% tab title="Aufgabe a)" %}
Wie viele Produkte befinden sich im Datensatz?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
Da jede Zeile im Datensatz ein Produkt ist, reicht es, wenn wir die Zeilen zählen:

```r
rewe %>% 
  count()
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe b)" %}
Wie viele Produkte hat jede Produktkategorie?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
# Der lange Weg
rewe %>% 
  group_by(productCategory) %>% 
  summarize(num_products = n())
  
# Die Abkürzung
rewe %>%
  count(productCategory)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe c)" %}
Gebt zusätzlich zur Produktkategorie und der Anzahl der Produkte auch den durchschnittlichen Verkaufspreis mit an.
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  group_by(productCategory) %>% 
  summarize(num_products = n(), 
            avg_price = mean(price))
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe d)" %}
Listet alle Produktkategorien nach dem durchschnittlichen Fettgehalt ihrer Produkte auf. Auf welches Problem stoßt ihr dabei und wie könnt ihr das lösen?
{% endtab %}

{% tab title="Lösungsvorschlag" %}
Das Problem sind die `NA` Werte. Ist nur ein `NA` dabei ist das Ergebnis der Aggregation (hier: `mean`) ebenfalls `NA`. Die Lösung ist der Parameter `na.rm`, den wir auf `TRUE` setzen. Dadurch werden bei der Aggregation die `NA`-Werte entfernt und nur mit gültigen Werten gerechnet:

```r
rewe %>% 
  group_by(productCategory) %>% 
  summarize(avg_fat = mean(fatInGram, na.rm = TRUE))
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe e)" %}
Verwendet das vorige Ergebnis und behaltet nur die Top 5 der Kategorien mit dem höchsten durchschnittlichen Fettgehalt ihrer Produkte.
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  group_by(productCategory) %>% 
  summarize(avg_fat = mean(fatInGram, na.rm = TRUE)) %>% 
  arrange(-avg_fat) %>% 
  head(5)
```
{% endtab %}
{% endtabs %}

{% tabs %}
{% tab title="Aufgabe f)" %}
Welche Marken haben die Produkte mit dem höchsten Proteingehalt im Sortiment? Listet die Top 10!
{% endtab %}

{% tab title="Lösungsvorschlag" %}
```r
rewe %>% 
  group_by(brand) %>% 
  summarize(highest_protein = max(proteinInGram)) %>% 
  arrange(-highest_protein)
```
{% endtab %}
{% endtabs %}

