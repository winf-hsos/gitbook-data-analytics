# Achsenformatierung

## Beschriftung der x- und y-Achse

Die Beschriftung der x- und y-Achse wird von ggplot automatisch vorgenommen. Dabei wird einfach der zugewiesene Ausdruck als Beschriftung verwendet, was oft unschön wirkt und wenig aussagekräftig ist. Betrachtet dazu das Beispiel unten, in dem wir die Gesamtemissionen für jedes Lebensmittelprodukt aus dem Datensatz [Environmental Impacts of Food Production](../../datensaetze-und-uebungen/datensaetze/environmental-impacts-of-food-production.md) als Balkendiagramm darstellen:

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
