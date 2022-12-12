---
description: >-
  Um bequem mit R arbeiten zu können, kümmern wir uns im ersten Schritt um die
  Arbeitsumgebung. Diese besteht aus R sowie dem RStudio.
---

# 7 Die Arbeitsumgebung

## R installieren

R ist eine Open-Source-Software und für alle gängigen Betriebssysteme verfügbar. Ladet euch zunächst die neueste Version von R für euer Betriebssystem herunter und installiert es anschließend:

* [R für Windows](https://cran.r-project.org/bin/windows/base/)
* [R für macOS](https://cran.r-project.org/bin/macosx/)
* [R für Linux](https://cran.r-project.org/bin/linux/)

Neben der Sprache und dem Interpreter für R erhaltet ihr mit der Installation auch eine rudimentäre grafische Oberfläche mit dem Namen _RGui_ (GUI = Graphical User Interface). Diese besteht aus einer einfachen Konsole, über die ihr R-Befehle eingeben und ausführen könnt.&#x20;

![Die RGui bietet einen rudimentären Editor für R-Befehle.](<../.gitbook/assets/image (18).png>)

Erweiterte Funktionen wie Autovervollständigung beim Schreiben von R-Code, ein integrierter Debugger für die Fehlersuche, eine Echtzeit-Vorschau für R-Markdown und viele andere Features mehr bietet dieses einfache Tool nicht. Deshalb verwenden wir für die Arbeit mit R nicht die RGui, sondern das ebenfalls kostenlos nutzbare [RStudio Desktop](https://www.rstudio.com/products/rstudio/) oder das [RStudio Cloud](https://rstudio.cloud/).

## RStudio Desktop installieren

Das <mark style="background-color:yellow;">RStudio</mark> ist heute das Standardwerkzeug für die Arbeit mit R und bietet viele nützliche Funktionen. Das RStudio ist ein sogenanntes <mark style="background-color:yellow;">Integrated Development Environment (IDE)</mark> für R. Einen schnellen Überblick über die grafische Benutzeroberfläche findet ihr in dem offiziellen RStudio Cheatsheet:

{% file src="../.gitbook/assets/rstudio-ide.pdf" %}
RStudio Cheatsheet
{% endfile %}

Klickt auf den Link unten und wählt RStudio für euer Betriebssystem aus. Installiert RStudio und öffnet es:

{% embed url="https://www.rstudio.com/products/rstudio/download/#download" %}

Nach dem Öffnen seht ihr die Oberfläche des RStudio, die wie auf dem Screenshot unten aussieht:

![Das RStudio ist in vier Bereiche eingeteilt.](<../.gitbook/assets/image (21).png>)

## RStudio in der Cloud nutzen

Für alle, die ihre ersten Schritte mit R gehen wollen und keinen großen Installationsaufwand auf sich nehmen wollen, eignet sich die Lösung in der Cloud. RStudio bietet kostenlose Accounts, die auf eine bestimmte Nutzungsdauer pro Monat (25 Stunden) und Rechnerressourcen (bis 1 GB RAM, 1 CPU) begrenzt sind. Der Vorteil ist, dass ihr direkt loslegen könnt.&#x20;

Der Link unten führt direkt zur kostenlosen Anmeldung:

{% embed url="https://rstudio.cloud" %}

Egal, ob ihr RStudio in der Cloud oder auf dem Desktop nutzt, die folgenden Ausführungen sind für beide Versionen gültig.

## Überblick über RStudio

Das Werkzeug besteht in der Standardansicht aus vier Bereichen (s. Screenshot oben):

### 1. Skripteditor

Der wichtigste Bereich ist der Skripteditor. Hier schreiben wir unseren R-Code und speichern ihn in Dateien auf unserem Computer. Dabei unterstützt uns RStudio mit vielen nützlichen Funktionen.

Wir können in RStudio unterschiedliche Arten von Dateien verwenden, um unsere Skripte zu speichern. Die einfachste Art sind sogenannte <mark style="background-color:yellow;">R-Skripte</mark> mit der Dateiendung `.R`. Wenn wir nicht nur R-Code, sondern auch Visualisierungen und formatierten Text in einem Dokument verwenden wollen, bietet sich die Verwendung eines <mark style="background-color:yellow;">R-Notebooks</mark> an. Ein R-Notebook endet auf `.Rmd` und wir können neben R-Code auch Markdown verwenden.

### 2. Informationen zur aktuellen R-Umgebung

R erstellt für die Ausführung von Skripten eine sogenannte Session. In einer Session werden alle Objekte wie die momentan verwendeten Daten, eigene Variablen oder Funktionen im Arbeitsspeicher des lokalen Rechners gespeichert. In dem zweiten Fenster können im Tab _Environment_ alle Objekte, die es in der aktuellen Session gibt, in der Übersicht und im Detail betrachtet werden. Der _History_ Tab enthält eine Liste aller ausgeführten Befehle in der aktuellen Session. Daneben gibt es noch den _Connections_ Tab für die Verbindung zu unterschiedlichen Datenquellen wie Datenbanken oder Webservices, sowie den _Tutorial_ Tab, in dem direkt in RStudio unterschiedliche Anleitungen angezeigt werden können.

{% hint style="info" %}
Für die Anzeige von Tutorials direkt in RStudio muss das Paket `learnr` installiert werden. Ihr müsst der Installation einmalig zustimmen und das Paket installieren.
{% endhint %}

### 3. Konsole und Terminal

Die Konsole ermöglicht, R-Befehle einzugeben und mit der Taste Enter auszuführen. Die Konsole in RStudio ist fast identisch zu der RGui. Für das schnelle Ausprobieren von Befehlen kann die Konsole nützlich sein. Für die strukturierte Arbeit mit den Daten sollten wir aber den Skripteditor verwenden, weil wir dort unsere Arbeit speichern und mit Kommentaren versehen können.

### 4. Dateien, Vorschau und Plots

In diesem Bereich werden Vorschauen unterschiedlicher Artefakte angezeigt. Dazu gehören gerenderte R-Notebooks, Markdown, aber auch Visualisierungen. In diesem Bereich gibt es auch einen rudimentären Datei-Explorer, um Dateien wie Skripte oder Datendateien zu finden und von dort zu öffnen.

