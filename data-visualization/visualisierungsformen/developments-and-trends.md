# Trends und Entwicklungen

Import the following Databricks notebook with instructions and examples into your account:

{% embed url="https://s3.us-east-1.amazonaws.com/nicolas.meseth/databricks-notebooks/visualize_developments_and_trends_with_ggplot2.html" %}

## Ordered Scatter Plots

When we visualize trends, we need at least one of the two variables to have a natural order. The typical example is a date or time variable. The analysis of a dependent variable over time is called time-series analysis.

The simplest way to display a development over time is to use a scatter plot. Instead of arbitrary two variables, we order the x-axis by the values of the first variable (e.g. date, time), and plot along the corresponding y-values.

## Line Charts

> "Line graphs are not limited to time series, however. They are appropriate whenever one variable imposes an ordering on the data." \[1]

### Multiple Series

![A line chart with multiple series.](../../.gitbook/assets/line\_chart\_multiple\_series.png)



## Area Charts

![](../../.gitbook/assets/area\_chart.png)

## Facets

![A 3 x 3 matrix of line charts.](../../.gitbook/assets/line\_chart\_facet.png)

## Pitfalls

### Cut or not to cut the y-axis?

## References

\[1] Wilke, C. Fundamentals of Data Visualization: A Primer on Making Informative and Compelling Figures. First edition, O’Reilly Media, 2019. _Chapters_ [_13_](https://clauswilke.com/dataviz/time-series.html) _and_ [_14_](https://clauswilke.com/dataviz/visualizing-trends.html).
