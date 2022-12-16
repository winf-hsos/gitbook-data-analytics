---
description: >-
  Creating quick visualizations is easy with ggplot2. For publication, we need
  to polish our visualizations so that they are appealing and easy to
  understand.
---

# Formatting plots

## Titles and legends

### Axis titles

With the `labs`-function, we can set the titles for the two axis as well as any legends that appear in our plot:

```r
... +
labs(x = "Date", y = "Frequency", color = "Gender")
```

For the x and y-axis, we can use the dedicated functions as an alternative:

```
... +
xlab("Date") +
ylab("Frequency")
```

We can remove an axis' title by setting it to the value `NULL`:

```r
... +
labs(x = NULL, y = "Frequency")
```

### Plot title

A chart should have a title, which we can add directly in `ggplot2` with the `ggtitle`-function:

```r
... +
ggtitle("Sales in 2022")
```

{% hint style="info" %}
A good chart title summarizes the main aspect shown in the chart. For example, it should include information about important filters that can't be seen in the chart. An good example would be "Sales by region for 2022", as opposed to only "Sales".
{% endhint %}

## Formatting axis values

### Plot title



### Axis titles

### Axis labels

#### Continuous

Formatting a numerical axis with continuous values can be achieved with the `scale_x_continuous` and `scale_y_continuous` functions. These function offer many options for formatting:

```
... +
scale_y_continuous(
    n.breaks = 10, 
    labels = function(x) format(x, big.mark = ".", scientific = FALSE)
    )
```

#### Date and Dateime

In time series, we often use the x-axis to show the value of a time-related variable. We can specify how the axis labels look like using the `scale_x_date` and `scale_x_datetime` functions (and correspondingly for the y-axis):

```r
... +
scale_x_date(name = "Date", date_breaks = "3 month", date_labels = "%B %Y")
```

<figure><img src="../../.gitbook/assets/image (1) (2).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
`ggplot2` will choose the names of the months depending on your system's language. You can change this setting to german or englisch with `Sys.setlocale("LC_TIME", "German")` and `Sys.setlocale("LC_TIME", "English")`.
{% endhint %}

## Restrict axis values

There are two ways to achieve a zooming in on the data. We can use `xlim` or `ylim` to restrict one of the axes:

```
... +
xlim(c(0, 50))
```

```
... +
ylim(c(50, 150))
```

The two functions above are shortcuts for using the corresponding `scale_*` functions:

```
... +
scale_y_continuous(limits = c(50, 150))
```

Note that the above methods restrict the data before plotting it. This can have undesired consequences when a chart's visual elements require all the data to be considered. This is the case for box plots, in which the box's boundaries represent the 25% and 75% quantiles. If we restrict the data to remove outliers, this will change these value, too.

A better way for box plot to zoom-in is the following:

```
... +
coord_cartesian(ylim = c(50, 150))
```

Using the `coord_cartesian` function and the `ylim` and `xlim` parameter **does not change the underlying data** and therefore produces a correct box plot.

## Read more

{% embed url="https://cedricscherer.netlify.app/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/" %}
