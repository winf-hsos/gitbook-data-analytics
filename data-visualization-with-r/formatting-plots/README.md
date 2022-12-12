---
description: >-
  Creating quick visualizations is easy with ggplot2. For publication, we need
  to polish our visualizations so that they are appealing and easy to
  understand.
---

# Formatting plots

## Setting text elements

### Axis titles

With the labs-function, we can set the titles for&#x20;

```r
... +
labs(x = "Date", y = "Frequency", color = "Gender")
```

We can also use the dedicated functions for each axis:

```
... +
xlab("Date") +
ylab("Frequency")
```

### Plot title

```r
... +
ggtitle("Sales in 2022")
```

## Formatting text elements

### Plot title

### Axis titles

### Axis labels

## Read more

{% embed url="https://cedricscherer.netlify.app/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/" %}
