---
description: >-
  We often want to add new columns to our data set and calculate their value
  based on existing columns. This chapter introduces how to do this with dplyr.
---

# Add columns

## Summary

This chapter introduces the following new concepts and functions:

* The [`mutate`](https://dplyr.tidyverse.org/reference/mutate.html)-function for adding new columns or changing existing ones.
* The `transmute`-function as an alternative to `mutate` to only keep the new columns and the columns involved in the calculation.
* Conversion functions `as.character`, `as.double`, `as.integer`, `as.logical, and` `factor` to cast a data type onto a column.
* Functions to extract parts of a date column, such as `year`, `month`, `day`, `weekday`, etc., mainly from the [`lubridate`](https://lubridate.tidyverse.org/)-package.

## The `mutate` command

We find ourselves in the need to expand the existing set of columns with new information. This information is usually derived from the existing columns. A good example is the turnover for our Campusbier data set. The table `line_items` contains the price and the quantity, but not the turnover. Thus, we can calculate a new column `turnover` as `price * quantity`.

```r
line_items |>
    mutate(turnover = price * quantity)
```

## Arithmetic calculations

### Keep only used columns

```r
line_items |>
    mutate(turnover = price * quantity, .keep = "used")
```

## Statistical calculations

## Extract parts of a date

For working with date and time columns, the package `lubridate` offers useful functions:

{% embed url="https://lubridate.tidyverse.org" %}

A compact introduction is also provided in [chapter 16 Dates and times](https://r4ds.had.co.nz/dates-and-times.html) from the book "R for Data Science" by Hadley Wickham.

### Calendar week

We can extract the calendar week with the function `week`:

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

### Month

For the month, the equivalent function is `month`:

```r
covid %>%
  transmute(date, month = month(date))
  
# A tibble: 151,776 x 2
#   date       month
#   <date>     <dbl>
# 1 2020-02-24     2
# 2 2020-02-25     2
```

### Quarter

A function with the corresponding name `quarter`:

```r
covid %>%
  transmute(date, quarter = quarter(date))

# A tibble: 151,776 x 2
#   date       quarter
#   <date>       <int>
# 1 2020-02-24       1
# 2 2020-02-25       1
```

### Year

No surprises here:

```r
covid %>%
  transmute(date, year = year(date))
  
# A tibble: 151,776 x 2
#   date        year
#   <date>     <dbl>
# 1 2020-02-24  2020
# 2 2020-02-25  2020
```

### Cutting off dates

We often want to bring a date to a higher level of aggregation. For example, if we aim to aggregate dates (daily) to full weeks, months, quarters, or years, we can use `ceiling_date` and `floor_date` to round a date down or up to achieve the desired format:

```r
covid %>% 
  filter(location == "Germany") %>% 
  mutate(week_end = ceiling_date(date, unit = "week") ) %>%
  select(date, year_month, location, new_cases_per_million)
```

{% hint style="info" %}
An advantage of using `ceiling_date` and `floor_date` is that the data type remains of the type date or date time. This can be used by ggplot2 to create a properly formatted axis..
{% endhint %}

## Change a column's data type

To perform some operations, such as statistical applications, or to visualize data properly, we may need to transform a column into a different data type. When loading a data set, the `readr` functions like `read_csv` are good at guessing the underlying data type for each column. Occasionally, they guess wrong, and that's when mutate comes to the rescue:

```r
orders |>
    mutate(order_id = as.character(order_id))
```

There is a function to cast a column to each existing data type in R:

* `as.character` to cast a column to a string. This should always work, as strings are the most general data type.
* `as.double` to cast a column to a number with decimal places. This only works when the original values are, in fact, numeric. Values that cannot be converted into a decimal number are replaced with `NA`.
* `as.integer` to cast a column to a whole number. Analogous to `as.double`, this only works when the values contain solely the characters 0-9.&#x20;
* `as.logical` to cast a column to a boolean value. This works when the values contain strings with the values "TRUE" and "FALSE" or "0" and "1". Similar, the numeric values 0 and 1 can also be converted to `TRUE` and `FALSE`.
* `lubridate::as.Date`
* `lubridate::as.POSIXct`

## Working with factors

### Recoding factors

### Reordering factors
