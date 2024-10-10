---
description: >-
  Vectors are one of the foundational data structures in R. They store, access
  and manipulate data efficiently, which makes them an indispensable building
  block in data analysis.
---

# 8 Vectors

## Getting Data

To understand the optimal strategy for the Monty Hall problem, we can start by simulating the game ourselves in a simple way. Imagine using three cups to represent the doors, with one person acting as the host and another as the contestant. The host hides a prize, such as a coin, under one of the cups, and the contestant makes an initial choice. Next, the host reveals a cup that does not contain the prize, and the contestant can either stay with their original choice or switch to the remaining cup. By repeating this process multiple times, for instance ten rounds, we can begin to gather data. But what kind of data should we collect?

The data we collect should allow us to perform the analysis needed to effectively address our research questions. As a general principle, when in doubt, it's better to record more data, since unnecessary information can always be removed later, but data that was never captured cannot be retrieved. So what kind of data should we record during the game?

* Which cup contained the prize?
* Which cup did the contestant choose initially?
* Which cup was revealed by the host?
* What decision did the contestant make (stay or switch)?
* Did the contestant win?

This is a solid starting point, though there are additional details we could consider. For instance, recording the date and time of each experiment or noting who played the host and who played the contestant could also provide useful insights. We will keep these ideas in mind for future experiments, but for now, we will focus on a concise list of key variables from above.

We don't actually need to record whether the contestant won the prize, as we can logically infer this from the other observations. If we know the contestant's initial choice, where the prize is, and whether they stayed or switched, we can determine the outcome.

## Representing the data in R

Imagine you played the game three times with a classmate and recorded the results on paper. The result could look something like this:

```
Game 1
Prize under cup: 2
Contestant chose cup: 1
Host opened: 3
Contestant choice: stay

Game 2
Prize under cup: 1
Contestant chose cup: 3
Host opened: 2
Contestant choice: switch

Game 3
Prize under cup: 1
Contestant chose cup: 1
Host opened: 3
Contestant choice: switch
```

Although this is a well-structured summary of your simulation, it is not suitable for direct use in a programming language like R. To effectively analyze the games you played (and potentially many more), we need to consider how to represent this data in a format that R can handle.

{% embed url="https://winf-hsos.github.io/university-docs/images/scalar_vector_data_frame.png" %}

## Creating vectors

### Manually

```r
weight <- c()
```

### From files

```r
weight <- scan("data/weight.txt")
```

## Exercise

{% embed url="https://winf-hsos.github.io/university-docs/quarto/data_analytics/exercise_vectors_monty_hall.pdf" %}
Exercise: Vectors - Analyzing the Monty Hall Problem
{% endembed %}
