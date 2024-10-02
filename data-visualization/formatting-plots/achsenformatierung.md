# Achsenformatierung

{% file src="../../.gitbook/assets/food_production.csv" %}

## Titel der x- und y-Achse ändern

Die Titel der x- und y-Achse werden von ggplot automatisch erstellt. Dabei wird der zugewiesene Ausdruck verwendet, was oft unschön wirkt und wenig aussagekräftig ist. Betrachtet dazu das Beispiel unten, in dem wir die Gesamtemissionen für jedes Lebensmittelprodukt aus dem Datensatz [Environmental Impacts of Food Production](../../data-sets-and-exercises/datensaetze/environmental-impacts-of-food-production.md) als Balkendiagramm darstellen:

```r
food_production %>%
  filter(total_emissions > 5) %>%
  ggplot() +
  aes(x = total_emissions, y = reorder(food_product, total_emissions)) +
  geom_col()
```

![Ein Balkendiagramm mit unschönen Achsenbeschriftungen.](<../../.gitbook/assets/image (32).png>)

Um die Beschriftungen zu verbessern, können wir mit den Funktionen `xlab()` und `ylab()` aussagekräftigere Titel vergeben:

```r
food_production %>%
  filter(total_emissions > 5) %>%
  ggplot() +
  aes(x = total_emissions, y = reorder(food_product, total_emissions)) +
  geom_col() +
  xlab("Total Emissions") +
  ylab("Food Product")
```

Das Ergebnis sieht schon gleich viel besser aus:

![Verbessertes Balkendiagramm mit aussagekräftigen Achsentiteln.](<../../.gitbook/assets/image (52).png>)

Die Achsenbeschriftungen können wir auch über die etwas generischere Funktion `labs()` erreichen:

```r
food_production %>%
  filter(total_emissions > 5) %>%
  ggplot() +
  aes(x = total_emissions, y = reorder(food_product, total_emissions)) +
  geom_col() +
  labs(x = "Total Emissions", y = "Food Product")

```

## Formatierung der Achsenbeschriftung

## Quellen

* [Blogbeitrag _A ggplot2 Tutorial for Beautiful Plotting in R_ von Cedric Scherer](https://cedricscherer.netlify.app/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/)
