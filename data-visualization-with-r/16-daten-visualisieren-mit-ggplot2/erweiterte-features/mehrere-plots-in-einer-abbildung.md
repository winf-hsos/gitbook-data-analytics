---
description: >-
  Mehrere Abbildungen in Spalten oder Zeilen erlauben oft einen guten Überblick
  und eine bessere Vergleichbarkeit. Hierfür gibt es gute Lösungen mit R und
  ggplot2.
---

# Mehrere Plots in einer Abbildung

## Verschiedene Visualisierungen in einer Matrix

Für das Erzeugen gleicher Plots für jede Ausprägung einer Variable in den Daten können wir `facet_grid()` verwenden. In manchen Fällen möchten wir einfach verschiedene Plots in einer Abbildung darstellen. In diesem Fall können wir mit dem Package `cowplot` und der Funktion `plot_grid()` arbeiten:

```r
library(cowplot)
plot_1 <- ggplot(anscombe) +  geom_point(mapping = aes(x = x123, y = y1)) + xlab("x1")
plot_2 <- ggplot(anscombe) +  geom_point(mapping = aes(x = x123, y = y2)) + xlab("x2")
plot_3 <- ggplot(anscombe) +  geom_point(mapping = aes(x = x123, y = y3)) + xlab("x3")
plot_4 <- ggplot(anscombe) +  geom_point(mapping = aes(x = x4, y = y4)) + xlab("x4")

plot_grid(plot_1,
          plot_2,
          plot_3,
          plot_4, 
          labels=c("1", "2", "3", "4"),
          ncol = 2,
          nrow = 2)
```

![Vier Visualisierungen in einer Matrix.](<../../../.gitbook/assets/image (33).png>)
