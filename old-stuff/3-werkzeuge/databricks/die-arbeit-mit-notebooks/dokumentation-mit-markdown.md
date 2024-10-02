---
description: >-
  Wir können Markdown in Databricks Notebooks verwenden, um neben unserer
  Analyse eine strukturierte und formatierte Dokumentation zu erstellen.
---

# Dokumentation mit Markdown

The following link contains a Markdown cheat sheet that summarizes the most important markups we can use:

{% embed url="https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet" %}

## Headings

You can create headings in Markdown using the hashtag symbol:

```
# This is a heading of first degree
## This is a hedaing of 2nd degree
### This is a heading of 3rd degree
```

## Links

You can create a link in Markdown by putting the linked text in square brackets and the URL to which you want to link in brackets:

```markup
The following link takes you somewhere: [Link somewhere](htttps://somewhere.com)
```

## Lists

You can create simple lists using the minus symbol. Nested lists are also possible by adding a tab:

```markup
This is a list:

- Top level item
- Another top level item
    - A subitem
    - Another subitem
- Last top level item
```

## Images

You can add images to your notebook by putting an exclamation mark in front of the square brackets, in which you define an alternative text to show if the image can't be displayed. The URL of the image must be put in brackets following the square brackets. Optionally, you can add a title that is shown on hover.

```markup
![My image](https://somewhere.com/image.jpg "An image hover title")
```

## Mixing Markdown with HTML

If Markdown isn't enough, you can use HTML within a markdown block as well. One use case for me is to include links in notebooks that open in a new tab:

```markup
# This is a heading of first degree
---
Find more information <a href="https://more.info" target="_blank">here</a>.
```
