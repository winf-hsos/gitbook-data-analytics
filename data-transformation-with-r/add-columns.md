---
description: >-
  We often want to add new columns to our data set and calculate their value
  based on existing columns. This chapter introduces how to do this with dplyr.
---

# Add columns

## Summary

This chapter introduces the following new concepts and functions:

* The [mutate()](https://dplyr.tidyverse.org/reference/mutate.html)-function for adding new columns or change existing ones.
* Conversion functions `as.character`, `as.double`, `as.integer`, `as.logical, and` `factor` to cast a data type onto a column.

## The `mutate` command

We find ourselves in the need to expand the existing set of columns with new information. This information is usually derived from the existing columns. A good example is the turnover for our Campusbier data set. The table `line_items` contains the price and the quantity, but not the turnover. Thus, we can calculate a new column `turnover` as `price * quantity`.

```r
line_items |>
    mutate(turnover = price * quantity)
```

## Arithmetic calculations

## Statistical calculations

## Extract parts of a date

## Change a column's data type

## Working with factors

### Recoding factors

### Reordering factors
