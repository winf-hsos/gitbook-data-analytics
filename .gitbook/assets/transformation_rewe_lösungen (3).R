library(tidyverse)

# 1.1: Schreibt den notwendigen Code, um die Datei als Dataframe, genauer gesagt, ####
# als Tibble, zu laden. Welches Paket könnt ihr dafür verwenden?

rewe <- read_csv("data/rewe_products.csv")

# Gebt die Spaltennamen auf der Konsole aus!

rewe %>% dim()
rewe %>%  colnames()

# 1.3: Findet Lösungen für die folgenden Aufgaben zur Sichtung der Daten ####

# a) Lasst euch die ersten 20 Produktnamen ausgeben! Wie könnt ihr alle Produkte sehen? ####

rewe %>% 
  select(productName) %>% 
  head(20)

rewe %>% 
  select(productName) %>% 
  pull()

# b) Gebt die ersten 30 Hersteller aus. Was fällt euch auf? Wie könntet ihr das lösen? ####

rewe %>% 
  select(brand) %>% 
  head(20)

rewe %>% 
  select(brand) %>% 
  drop_na() %>% 
  head(20)

rewe %>% 
  distinct(brand) %>% 
  drop_na()

# c) Gebt die 5 Produkte mit dem höchsten Fettgehalt aus! ####

rewe %>% 
  select(productName, fatInGram) %>% 
  arrange(desc(fatInGram))

# Alternativ, bei numerischen Spalten

rewe %>% 
  select(productName, fatInGram) %>% 
  arrange(-fatInGram)

# 1.4: Verschafft euch einen Überblick über die Wertebereiche der Spalten und löst die folgenden Aufgaben ####

# a) Fasst die Spalten vegan und vegetarian zusammen. Was sagt ihr zu der Datenqualität der beiden Spalten? ####

rewe %>% 
  select(vegan, vegetarian) %>% 
  summary()

# b) Erstellt eine Zusammenfassung aller Spalten, die einen Wert in Gramm enthalten. ####
# Welche verschiedenen Möglichkeiten findet ihr, das zu erreichen?

rewe %>% 
  select(ends_with("Gram")) %>% 
  summary()

# 2.1: Auswählen von Spalten ####

# a) Erstellt einen neuen Dataframe, der den Produktnamen, die Produktkategorie und den Verkaufspreis enthält! ####

df <- rewe %>% 
  select(productName, productCategory, price)

# b) Erstellt einen neuen Dataframe mit allen Nährwertangaben sowie dem Produktnamen und der Produktkategorie! ####

df <- rewe %>% 
  select(ends_with("Gram"), productName, productCategory)

# c) Erstellt einen neuen Dataframe, der nur numerische Spalten enthält. Prüft die Spalten und schreibt auf, was euch auffällt. ####

df <- rewe %>% 
  select(where(is.numeric))

df %>% 
  head(10)

# Konvertieren der falsch erkannten Spalten

rewe <- rewe %>% 
  mutate(productId = as.character(productId),
         gtin = as.character(gtin))

# 2.2: Zeilen filtern ####

# a) Filtert die Daten, sodass nur Produkte aus Deutschland enthalten sind. #### 
# Behaltet nur den Produktnamen und das Herkunftsland im Ergebnis.

rewe %>% 
  filter(countryOfOrigin == "Deutschland") %>% 
  select(productName, countryOfOrigin)


# b) Findet alle veganen Bioprodukte! ####

rewe %>% 
  filter(vegan, bio) %>% 
  select(productName, vegan, bio)

# Expliziter

rewe %>% 
  filter(vegan == TRUE, bio == TRUE) %>% 
  select(productName, vegan, bio)

#c) Welche Biersorten werden im REWE-Onlineshop angeboten? ####

rewe %>% 
 distinct(productType) %>% 
 filter(str_detect(productType, "Bier"))

rewe %>% 
  filter(productType == "Bier") %>% 
  count(brand, sort = TRUE)

# d) Findet alle Rotweine unter 2 EUR! ####

rewe %>% 
  distinct(productType) %>% 
  filter(str_detect(productType, "wein"))

rewe %>% 
  filter(productType == "Rotwein") %>% 
  filter(price < 2) %>% 
  select(productName, price) %>% 
  arrange(price)

# e) Findet alle Produkte, die das Allergen Soja enthalten. ####
# Schaut euch dafür die Funktion str_detect() an!

rewe %>% 
  filter(str_detect(str_to_lower(allergenStatement), "soja")) %>% 
  select(productName, allergenStatement)

# 2.3: Spalten verändern ####

# a) Ändert den Datentyp der beiden Spalten productId und gtin in ####
# Zeichenketten (chr) um!

rewe <- rewe %>% 
  mutate(productId = as.character(productId),
         gtin = as.character(gtin))

# b) Erstellt eine neue Spalte sum_nutrition, in der ihr die Summe aller ####
# Nährwertangaben bildet. Belasst im Ergebnis nur die neue Summenspalte und 
# die einzelnen Nährwertspalten.

rewe %>% 
  mutate(sum_nutrition = across(ends_with("Gram"), ~ sum), .keep="used") %>% 
  colnames()

# c) Berechnet, ob ein Produkt mehr als 90 % Fett enthält und speichert diese ####
# Information auf einer neuen Spalte high_fat. Zeigt zur Überprüfung nur Zeilen an, 
# bei denen der Wert TRUE ist. Die neue Spalte soll vor der Spalte productDescription eingefügt werden.

rewe %>% 
  mutate(high_fat = fatInGram > 90, .keep="used") %>% 
  drop_na() %>% 
  filter(high_fat)

# d) Erstellt eine Spalte foreign_bio, die TRUE enthalten soll, wenn das Produkt ####
# ein Bioprodukt ist und gleichzeitig nicht aus Deutschland stammt.

rewe %>% 
  mutate(foreign_bio = bio & countryOfOrigin != "Deutschland", .keep="used") %>% 
  filter(foreign_bio)
  
  
# 2.4: Daten zusammenfassen ####

# a) Wie viele Produkte befinden sich im Datensatz? ####

rewe %>% 
  count()

# b) Wie viele Produkte hat jede Produktkategorie? ####

# Der lange Weg
rewe %>% 
  group_by(productCategory) %>% 
  summarize(num_products = n())

# Die Abkürzung
rewe %>%
  count(productCategory)

# c) Gebt zusätzlich zur Produktkategorie und der Anzahl der Produkte ####
# auch den durchschnittlichen Verkaufspreis mit an.

rewe %>% 
  group_by(productCategory) %>% 
  summarize(num_products = n(), 
            avg_price = mean(price))

# d) Listet alle Produktkategorien nach dem durchschnittlichen Fettgehalt ihrer ####
# Produkte auf. Auf welches Problem stoßt ihr dabei und wie könnt ihr das lösen?

rewe %>% 
  group_by(productCategory) %>% 
  summarize(avg_fat = mean(fatInGram, na.rm = TRUE))

# e) Verwendet das vorige Ergebnis und behaltet nur die Top 5 der Kategorien ####
# mit dem höchsten durchschnittlichen Fettgehalt ihrer Produkte.

rewe %>% 
  group_by(productCategory) %>% 
  summarize(avg_fat = mean(fatInGram, na.rm = TRUE)) %>% 
  arrange(-avg_fat) %>% 
  head(5)

# f) Welche Marken haben die Produkte mit dem höchsten Proteingehalt im Sortiment? ####
# Listet die Top 10!

rewe %>% 
  group_by(brand) %>% 
  summarize(highest_protein = max(proteinInGram)) %>% 
  arrange(-highest_protein)