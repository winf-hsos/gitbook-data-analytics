---
description: >-
  Databricks ist eine Cloud-basierte Plattform für die Datenanalyse und bietet
  die Möglichkeit innerhalb eines Notebooks auf verschiedene Sprachen
  zuzugreifen.
---

# Alles in einer Umgebung

Databricks ist eine Cloud-basierte Umgebung für die Datenanalyse. Die Plattform basiert auf der quelloffenen [Apache Spark Software](https://spark.apache.org/) und unterstützt unterschiedliche Sprachen. Darunter fallen SQL, R und Python. Aber auch Scala und Markdown werden unterstützt.

Apache Spark ist eine Software, die für die Verarbeitung und Analyse sehr großer Datenmengen entwickelt wurde. Sie eignet sich trotzdem auch für kleine Datensätze. Normalerweise ist die Installation und Konfiguration eines Apache Spark Clusters ein aufwendiger Vorgang, für den man spezialisierte Administratoren benötigt. Databricks ermöglicht es, ohne diese speziellen Kenntnisse auf Knopfdruck ein lauffähiges Cluster innerhalb weniger Sekunden zu erstellen und für die Datenanalyse zu nutzen. Dabei wird im Hintergrund bei einem Cloud-Anbieter wie [Amazon Web Services](https://databricks.com/product/aws) oder [Microsoft Azure](https://azure.microsoft.com/en-us/services/databricks/) (und [neuerdings auch Google Cloud](https://cloud.google.com/databricks)) ein virtueller Rechner (oder mehrere Rechner in einem Verbund) bereitgestellt. Dieser Rechner wird auf Basis eines Image erstellt, auf dem eine fertig konfigurierte Version der [Databricks Runtime](https://databricks.com/glossary/what-is-databricks-runtime) läuft. Die Databricks Runtime beinhaltet neben anderen Komponenten auch Apache Spark. Die genaue Version kann bei der Erstellung eines Clusters ausgewählt werden.

Sobald ein Cluster zur Verfügung steht, kann mit der Datenanalyse begonnen werden. Hier profitieren wir davon, dass Apache Spark seine API (Programmierschnittstelle) in vielen gängigen Sprachen bereitstellt. Darunter fallen, neben der nativen [Scala API](https://spark.apache.org/docs/latest/quick-start.html), auch SQL ([Spark SQL](https://spark.apache.org/docs/latest/sql-programming-guide.html)), R ([SparkR](https://spark.apache.org/docs/latest/sparkr.html)) und Python ([PySpark](http://spark.apache.org/docs/latest/api/python/)). Natürlich läuft auf den Clustern jeweils auch ein Interpreter für R und Python, sodass neben den Spark APIs auch der normale Sprachumfang innerhalb eines Notebooks verwendet werden kann. Sogar das Wechseln der Sprache innerhalb eines Notebooks ist möglich, was eine große Flexibilität in der Analyse bietet.

Für Studierende und Unternehmen, die Databricks mit kleineren Datensätzen testen wollen, bietet Databricks mit der [Community Edition](https://databricks.com/product/faq/community-edition) eine kostenlose Version ihrer Plattform an. Dabei ist der Funktionsumfang fast vollumfänglich, lediglich die Größe des kostenlosen Clusters ist vorgegeben und auf einen Knoten mit 15 GB RAM und 2 Cores beschränkt. Streng genommen kann man bei einem Knoten nicht einmal von einem Cluster sprechen. Dennoch ist dieser eine Knoten gut ausgestattet und erlaubt die Analyse auch größerer Datensätze.

Wir melden uns im ersten Schritt für die Databricks Community Edition an und erkunden die Arbeitsumgebung.
