# Datum- und Zeitspalten

Für die Arbeit mit Datum- und Zeitspalten bietet das Paket `lubridate` viele Funktionen an:

{% embed url="https://lubridate.tidyverse.org" %}

Eine kompakte Einführung bietet zudem das [Kapitel 16 Dates and times](https://r4ds.had.co.nz/dates-and-times.html) aus dem Buch "R for Data Science" von Hadley Wickham.

## Datumsbestandteile extrahieren

### Kalenderwoche

Die Kalenderwoche können wir mit der Funktion `week()` extrahieren:

```r
covid %>%
  transmute(date, week = week(date))

# A tibble: 151,776 x 2
#   date        week
#   <date>     <dbl>
# 1 2020-02-24     8
# 2 2020-02-25     8
# 3 2020-02-26     9
# 4 2020-02-27     9
```

### Monat

Das Jahr können wir mit der Funktion `month()` extrahieren:

```r
covid %>%
  transmute(date, month = month(date))
  
# A tibble: 151,776 x 2
#   date       month
#   <date>     <dbl>
# 1 2020-02-24     2
# 2 2020-02-25     2
```

### Quartal

Das Quartal erhalten wir mit der `quarter()` Funktion:

```r
covid %>%
  transmute(date, quarter = quarter(date))

# A tibble: 151,776 x 2
#   date       quarter
#   <date>       <int>
# 1 2020-02-24       1
# 2 2020-02-25       1
```

### Jahr

Auch das Jahr können wir mit einer Funktion mit entsprechendem Namen extrahieren:

```r
covid %>%
  transmute(date, year = year(date))
  
# A tibble: 151,776 x 2
#   date        year
#   <date>     <dbl>
# 1 2020-02-24  2020
# 2 2020-02-25  2020
```

## Datumswerte abschneiden

Oftmals wollen wir ein Datum auf eine höhere Aggregationsebene bringen. Beispielsweise wenn wir  Daten, die auf Tagesbasis vorliegen, auf volle Wochen, Monate, Quartale oder Jahre zusammenfassen wollen. Die Funktionen `ceiling_date()` __ und __ `floor_date()` runden ein Datum auf ein bestimmtes Format:

```r
covid %>% 
  filter(location == "Germany") %>% 
  mutate(week_end = ceiling_date(date, unit = "week") ) %>%
  select(date, year_month, location, new_cases_per_million)
```
