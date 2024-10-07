---
description: >-
  Exploring data forms the core of this book and is also referred to as
  exploratory data analysis. It involves discovering relationships and patterns
  as well as developing hypotheses.
---

# Exploring Data

## **What is Exploratory Data Analysis?**

Leek and Peng describe exploratory data analysis as a method of "searching for discoveries, trends, correlations, or relationships between the measurements to generate ideas or hypotheses." It does not provide confirmatory results, but instead serves as a springboard for formulating hypotheses that can be tested with subsequent data collection and rigorous statistical methods【6†source】. This characteristic makes EDA both exciting and uncertain: analysts might not know exactly what they will discover, but the exploration process creates the potential for unexpected insights.

The value of EDA lies in its ability to help analysts get a sense of what the data may say before deciding on further analysis techniques. EDA is particularly helpful for identifying outliers, detecting errors, and understanding the underlying data structure, all of which are necessary steps before one can apply more advanced statistical modeling.

Exploratory Data Analysis (EDA) is a vital step in the data analysis process, used to examine and understand datasets through summarization and visualization. This initial exploration helps identify patterns, spot anomalies, and make insights about the data, forming the foundation for hypothesis generation and further statistical analysis. The process aims to ask the data meaningful questions, as highlighted in a paper by Leek and Peng, which emphasizes the importance of distinguishing between various forms of data analyses, such as descriptive, inferential, or predictive analysis, to avoid common pitfalls【6†source】.

## **The EDA Process**

{% embed url="https://winf-hsos.github.io/university-docs/images/eda_process.png" %}

The [diagram provided from "R for Data Science" by Hadley Wickham](https://r4ds.hadley.nz/whole-game#fig-ds-whole-game) illustrates a structured approach to EDA. The key stages of the process include:

1. **Loading Data**: The first step involves gathering data from various sources such as databases, web services, CSV files, or Excel spreadsheets, and preparing it for analysis. It is essential that the data is properly imported and organized into a format that allows efficient exploration and further manipulation.
2. **Tidying Data**: This stage ensures that data is structured consistently. In a [tidy dataset](https://r4ds.hadley.nz/data-tidy#sec-tidy-data), each variable is a column, each observation is a row, and each type of observational unit forms a table. This systematic arrangement makes the data more accessible for analysis.
3. **Exploration: Transform and Visualize**: This part of the process is the core of exploration and involves both transforming and visualizing the data. The purpose of transforming the data could be to create new variables, normalize scales, summarize and group, or filter specific observations. Visualization helps reveal underlying patterns, correlations, or distributions that are often not obvious in raw tables (see [pleas-for-data-visualization.md](../../../data-visualization/pleas-for-data-visualization.md "mention")). This exploration stage is crucial for generating hypotheses and gaining insights from the data.
4. **Communicating Findings**: Once the exploration reveals meaningful insights, the final step is to communicate these findings. Clear and compelling communication involves summarizing the analyses with appropriate graphs, tables, and narratives to convey the story behind the data effectively to stakeholders. This can be done in various formats, such as a scientific paper, business report, presentation, interactive dashboard, or website. All of this can be achieved with [quarto.md](../../../communication/quarto.md "mention")in RStudio.

## **The Role of Visualization in EDA**

A key component of exploratory data analysis is visualization. During the transform-visualize cycle, visualization is employed to give shape to numbers and relationships. Data visualizations can highlight patterns that are otherwise hidden within spreadsheets (see [pleas-for-data-visualization.md](../../../data-visualization/pleas-for-data-visualization.md "mention")). For example, scatter plots can show potential correlations, while box plots can indicate the presence of outliers. Visual exploration is not just about aesthetics, but is also a practical tool for data scientists to make informed decisions.
