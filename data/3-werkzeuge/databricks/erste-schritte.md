---
description: >-
  Ich empfehle Databricks für alle Analysen in diesem Online-Skript. Databricks
  ist eine einheitliche Datenanalyseplattform mit Unterstützung für SQL, Python
  und R.
---

# Erste Schritte mit Databricks

## Die kostenlose Community-Edition

Databricks ist ein Cloud-Anbieter für Datenanalysen. Wir können damit Daten unter anderem auf Basis von SQL, R und Python analysieren. Databricks bietet einen kostenlosen Zugang für seine Plattform über die sogenannte Community Edition an.

![Anmeldung für die Databricks-Plattform.](<../../../.gitbook/assets/image (46) (2).png>)

Führt die folgenden Schritte aus, um ein kostenloses Databricks-Konto zu erstellen:

* Klickt auf [diesen Link](https://databricks.com/try-databricks), um auf die Anmeldeseite zu gelangen.
* Gebt euren Vor- und Nachnamen ein und füllt die restlichen Felder aus:
  * Company = University of Applied Science Osnabrück
  * Company Email = deine E-Mail-Adresse der Hochschule / Uni
  * Title = Student
* Klickt auf den Button _Get Started For Free_. Ihr werdet auf eine neue Seite weitergeleitet. Hier klickt ihr bitte unten auf den Link _<mark style="background-color:yellow;">Get started with Community Edition</mark>_.

![](<../../../.gitbook/assets/image (53).png>)

Nach dem Abmelden könnt ihr euch später jederzeit über [diesen Link](https://community.cloud.databricks.com) wieder einloggen. Wenn ihr eingeloggt seid und die Databricks-Startseite seht, habt ihr die Anmeldung erfolgreich abgeschlossen.

![Die Databricks-Startseite nach erfolgreichem Login.](<../../../.gitbook/assets/image (48).png>)

## Notebooks importieren

In Databricks arbeiten wir in sogenannten Notebooks. Ein Notebook ist eine Abfolge von Code-Blöcken, in denen Anweisungen, wie SQL Abfragen, enthalten sind. Ein Code-Block kann gestartet werden, woraufhin Databricks die enthaltenen Anweisungen Schritt für Schritt ausführt. Im Falle eines SQL-Statements wird das Ergebnis (bei Erfolg) anschließend unter dem Block angezeigt.

Für meine Module stelle ich eine Reihe von Notebooks bereit, die du mit wenigen Klicks in deinen Account importieren kannst. In diesen Notebooks sind in der Regel Blöcke für das Laden der Daten, Code-Beispiele und Aufgaben enthalten. Du kannst deine Lösung unter die jeweilige Aufgabe als neuen Block einfügen.

Das Vorgehen zum Importieren eines Notebooks ist einfach:

* Klicke auf den Link des Notebook-Templates, der für eine bestimmte Aufgabe bereitgestellt wird. Das Notebook öffnet sich als HTML-Seite in einem neuen Tab des Browsers.
* Klicke nun auf den _Import Notebook_ Button in der oberen rechten Ecke des Notebooks. Es öffnet sich ein Pop-up-Fenster mit einer URL. Kopiere die URL in die Zwischenablage (⌨ Strg + C).
* Öffne [Databricks](https://community.cloud.databricks.com/login.html) und logge dich mit einem Account ein. Klicke im Menü links auf _Home_ und wähle einen Ort aus, an dem du das Notebook speichern möchtest. Klicke dann auf den kleinen nach unten zeigenden Pfeil und wähle _Import_.
* Im sich öffnenden Pop-up-Fenster wähle bitte den Radiobutton _URL_ aus. Füge nun die zuvor kopierte URL des Notebook-Templates in das Textfeld ein. Klicke anschließend auf _Import_.

Wenn alles funktioniert hat, ist das Notebook als Kopie in deinem Account gespeichert und du kannst damit arbeiten.

Für das Importieren von Notebooks habe ich ein kurzes Video erstellt:

{% embed url="https://www.youtube.com/watch?v=35OMAYr5Vww" %}

## Ein Cluster erstellen und das Notebook verbinden

Die bereitgestellten Notebooks enthalten zu Beginn in der Regel einen Block für das vollautomatische Anlegen der benötigten Tabellen. Diesen Block musst du einmalig ausführen. Anschließend hast du den Datensatz mit allen Tabellen (falls es mehrere gibt) als Kopie in deinem Databricks-Account. Auch nach einem erneuten Einloggen sind die Daten und Arbeitsstände deines Notebooks weiterhin vorhanden.

Um auf diesen Daten SQL-Abfragen ausführen zu können, musst du in Databricks ein sogenanntes Cluster starten. Ein Cluster ist ein Verbund von Rechnern, die in der Cloud existieren und auf denen die Daten analysiert werden. Die Cluster sind vorkonfiguriert und sind mit der notwendigen Software ausgestattet (Apache Spark). Im Fall der kostenlosen Databricks Community Edition besteht ein Cluster aus genau einem Rechner in der Cloud, der für dich kostenlos bereitgestellt wird.

* Logge dich in deinem Databricks-Account ein und klicke links im Menü auf _Compute_.
* Klicke auf den Button  mit der Aufschrift _Create Cluster_. Es öffnet sich eine neue Maske. Vergib dort einen beliebigen Namen für das Cluster und belasse alle anderen Einstellungen, wie sie sind. Klicke dann auf den Button _Create Cluster_. Es wird nun im Hintergrund ein Server für dich bereitgestellt, der die benötigte Software u. a. für das Ausführen von SQL Abfragen mitbringt. Die Bereitstellung dauert ca. 2–3 Minuten. Du erkennst an dem grünen Punkt vor dem Cluster-Namen, wenn der Server bereitsteht.

![So sieht die Maske zu Erstellung eines neuen Cluster aus.](../../../.gitbook/assets/new\_cluster.png)

* Sobald das Cluster bereitsteht, öffne das Notebook, mit dem du arbeiten möchtest. Klicke auf das kleine Dropdown-Menü oben links im Kopf des Notebooks und wähle dein soeben erstelltes Cluster aus. Danach ist dein Notebook mit dem Cluster verbunden und alle SQL-Abfragen (oder andere Analyse) werden automatisch auf diesem ausgeführt.

![Ein Notebook muss erst mit einem Cluster verbunden werden, um SQL-Abfragen ausführen zu können.](../../../.gitbook/assets/new\_cluster\_ready.png)

* Klicke zuletzt mit der Maus in den ersten Code-Block und drücke anschließend ⌨ Strg + Enter_._ Alternativ kannst du auch auf den kleinen Play-Button im oberen rechten Menü des Blocks klicken. Beides führt den Code innerhalb des Blocks aus.

Von jetzt an kannst du in dem Notebook arbeiten und beliebig viele SQL-Abfragen auf deinen Daten ausführen. Sobald du länger als 2 Stunden inaktiv bist und keine Anfragen an deinen Cluster gesendet hast, wird er automatisch heruntergefahren. Du musst dann beim nächsten Arbeiten zuerst einen neuen Cluster erstellen. Alle Daten bleiben permanent erhalten.

## Später wieder einloggen

Klicke auf den folgenden Link, um dich jederzeit mit deinem Account einzuloggen:

{% embed url="https://community.cloud.databricks.com/login.html" %}

{% hint style="info" %}
Lege deine Zugangsdaten an einem sicheren Ort ab. Ich empfehle für die Speicherung von Zugangsdaten einen Passwort-Safe wie [Lastpass](https://lastpass.com/). Damit stellst du sicher, dass du nie ein Passwort verlierst, du von überall drauf zugreifen kannst und dass du mit dem Passwort-Generator jederzeit sichere Passwörter verwendest.
{% endhint %}

Als Nächstes lernen wir das wichtigste Instrument in Databricks kennen: das Notebook.
