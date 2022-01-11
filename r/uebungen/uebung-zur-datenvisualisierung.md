---
description: >-
  In dieser Übung erstellt ihr unterschiedliche Visualisierungen mit R und
  ggplot2.
---

# 💻 Übung zur Datenvisualisierung

## 1 Trends und Entwicklungen

Für diesen Teil der Übungsaufgabe verwenden wir den [Covid19-Datensatz](../../datensaetze-und-uebungen/datensaetze/covid19.md). Ladet euch den aktuellen Tagesstand des Datensatzes in einen Tibble und versucht, geeignete Visualisierungen für die folgenden Fragen zu erstellen.

### 1.1 Verlauf der neuen Impfungen in Deutschland

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Visualisiert den Verlauf der neuen Impfungen in Deutschland seit dem 01.01.2021
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
```r
covid %>%
  filter(location == "Germany") %>%
  filter(date >= "2021-01-01") %>%
  ggplot() +
  aes(x = date, y = new_vaccinations_smoothed) +
  geom_line()
```
{% endtab %}
{% endtabs %}

### 1.2 Wöchentliche Neuinfektionen seit Pandemiebeginn

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Erstellt eine Visualisierung, die die Summe der wöchentlichen Neuinfektionen für Deutschland seit Beginn der Pandemie darstellt.
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
Eine mögliche Lösung für die Aufgabe:

```r
covid %>%
  filter(location == "Germany", date >= "2021-01-01") %>%
  transmute(week = floor_date(date, "week"), new_cases) %>%
  group_by(week) %>%
  summarise(sum_new_cases = sum(new_cases, rm.na = TRUE )) %>%
  ggplot() +
  aes(x = week, y = sum_new_cases) +
  geom_bar(stat = "identity")
```

Als erstes filtern wir die Daten auf das Land Deutschland sowie das Datum (Zeile 2). Anschließend erstellen wir eine neue berechnete Spalte, die das Startdatum der jeweiligen Woche beinhaltet (Zeile 3). Anhand der neuen Spalte `week` werden die Daten gruppiert und die Summe der neuen Infektionen für jede Woche berechnet. Anschließend verwenden wir die neuen Spalten für die x- und y-Achse eines Balkendiagramms. Hier ist es wichtig, dass wir die Statistik des Balkendiagramms auf den Wert `identity` setzen, weil ein Balkendiagramm standardmäßig die Daten aufsummiert. Da die Spalte `sum_new_cases` aber bereits aggregiert ist, müssen wir dieses Verhalten unterbinden.
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Schaut euch für Arbeit mit Datumsspalten das [Kapitel 16 Dates and times](https://r4ds.had.co.nz/dates-and-times.html#dates-and-times) aus dem Buch _R for Data Science_ an. Besucht auch die [offizielle Dokumentation des `lubridate` Pakets](https://lubridate.tidyverse.org) aus dem tidyverse.
{% endhint %}

## 2 Proportionen

Für diesen Teil der Übungsaufgabe benötigen wir den [Orangenlimonaden-Datensatz](../../datensaetze-und-uebungen/datensaetze/umfrage-orangenlimonade.md). Ladet euch die Daten auf euren Computer herunter und importiert ihn als Tibble.

### 2.1 Häufigkeit pro Studiengang

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Erstellt eine Visualisierung, um schnell die Proportionen bei der Nennung von Studiengängen vergleichen zu können.
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
Um die Visualisierung schneller interpretieren zu können, rekodieren wie die numerischen Werte mit der `recode()` Funktion. Anschließend sortieren wir die Ausprägungen nach der Häufigkeit mit der `fct_infreq()` Funktion. Mit der veränderten Spalte `f44_studiengang` können wir dann ein Balkendiagramm in absteigender Sortierung erstellen.

```r
limo %>%
  transmute(f44_studiengang = fct_infreq(recode(f44_studiengang, `1` = "BAH", `2` = "BLW", `3` = "BLP", `4` = "OEC", `5` = "MAL", `-999` = "NA"))) %>%
  ggplot() +
  aes(x = f44_studiengang) +
  geom_bar()
```
{% endtab %}
{% endtabs %}

### 2.2 Limo gekauft, getrunken oder weder noch?

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Visualisiert die absoluten Häufigkeiten der Nennungen zur Frage 1.
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
```r
limo %>% transmute(f1 = case_when(
    f1_gekauft == 1 ~ "gekauft",
    f1_getrunken == 1 ~ "getrunken",
    f1_weder_noch == 1 ~ "weder noch",
    TRUE ~ "keine Angabe" )) %>%
  ggplot() +
  aes(x = f1) +
  geom_bar() +
  labs(x = "Antwort", y = "Häufigkeit")
  
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Die Antworten zur Frage 1 sind über drei Spalten verteilt. Die vom Probanden angekreuzte Antwort ist durch eine 1 in der jeweiligen Spalte erkennbar. Für die Visualisierung müsst ihr daraus eine Spalte erzeugen. Schaut euch dafür die Funktion `case_when()` an.
{% endhint %}

## 3 Verteilungen

Für den dritten Teil dieser Übungsaufgabe verwenden wir den [REWE-Datensatz](../../datensaetze-und-uebungen/datensaetze/rewe-online-products.md).

### 3.1 Proteingehalt über alle Produkte

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Erstellt eine geeignete Visualisierung für die Verteilung des Proteingehalts _aller_ Produkte.
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
Probiert selbst...
{% endtab %}
{% endtabs %}

### 3.2 Fettgehalt in drei Lebensmittelkategorien

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Erstellt eine geeignete Visualisierung für die Verteilung des Fettgehalts der Produkte in den Produktkategorien "Tiefkühl", "Frische und Kühlung" sowie "Süßes und Salziges". In der Visualisierung sollen die Verteilungen für dir drei Kategorien getrennt betrachtet werden können.
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
Probiert selbst...
{% endtab %}
{% endtabs %}

## 4 Assoziationen

Im letzten Teil der Übungsaufgabe greifen wir erneut auf den [Covid19-Datensatz](../../datensaetze-und-uebungen/datensaetze/covid19.md#datensatz-mit-r-laden) zurück.

### 4.1 Zusammenhang GDP und Lebenserwartung

{% tabs %}
{% tab title="Aufgabe" %}
:ballot\_box\_with\_check: Überprüft visuell, ob es einen Zusammenhang zwischen dem GDP und der Lebenserwartung eines Landes gibt.
{% endtab %}

{% tab title="Lösungsmöglichkeit" %}
Probiert selbst mal...
{% endtab %}
{% endtabs %}



