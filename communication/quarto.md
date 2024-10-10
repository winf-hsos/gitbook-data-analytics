# Quarto

On the official website, Quarto is described as an "open-source scientific and technical publishing system", which hits the nail on the head. In short, Quarto enables us to write code, create visualizations, and add our textual interpretation in a single document and render it into multiple formats. Among those formats are simple HTML websites, PDF files, and even Microsoft Word Documents.

With Quarto, we can write a research paper, create a website, publish a book, or even generate a presentation for our results.

## Our first document

The simplest Quarto file looks like the following. Simply create a new file `paper.qmd` and type your first sentence. We call this our source file, and we typically give it the file extension `.qmd`:

{% code title="paper.qmd" %}
```
This is my first paper written in Quarto.
```
{% endcode %}

Now you can render the source file into a target format. Let's start with an HTML website:

<pre><code><strong>quarto render paper.qmd --to html
</strong></code></pre>

Before you can use the command above, make sure you properly installed Quarto on your computer. We covered this in [a previous section](../empirical-research/6-tools/).

On a command line, you can check the currently installed version of Quarto using the following command:

```
quarto --version
```
