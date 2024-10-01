---
description: >-
  R-Projects are useful to manage your analytics project. In this section,
  you'll learn how to create and use them.
---

# 2 Projects

Projects in RStudio are an organizational element that helps you maintain your analyses with all data and scripts. There are different ways to create a new project.

## Cloning a GitHub repository



You can use your operating system's integrated terminal, which on Windows is called the _Command Line_ (`cmd.exe`) and on macOS and Linux it is simply called _Terminal_. You can also open a terminal directly in RStudio, there is a tab named "Terminal" right next to the console. When you click on the "Terminal" tab, you should see your username and device name followed by the current path the terminal is in:

<figure><img src="../.gitbook/assets/image (59).png" alt=""><figcaption><p>A terminal integrated in RStudio Desktop.</p></figcaption></figure>

Switch to a path where you want to store the example code for this course. If you don't know how to achieve this from the terminal, read about `cd` command, which is short for _change directory_. Make sure you use a short path that doesn't contain any spaces or special characters. Your "My Documents" folder is therefore a bad idea. I like to store all my R-code in the directory `c:\rcode` and I create subdirectories for each semester and project.

Once you are in your desired directory, type the following command (use copy and paste) and hit ENTER. This will download a copy of the corresponding R-project for the course to your computer. Make sure you choose the right link depending on the module you are currently taking:

{% tabs %}
{% tab title="Empirisches Arbeiten" %}
```
git clone https://github.com/winf-hsos/empirisches-arbeiten.git
```
{% endtab %}

{% tab title="Big Data Analytics" %}
```
git clone https://github.com/winf-hsos/wordlens-code.gitgit clone https://github.com/winf-hsos/wordlens-code.git
```
{% endtab %}

{% tab title="Applied Anayltics" %}
```
git clone ..
```
{% endtab %}
{% endtabs %}

After the command completed, you should have a new subdirectory with the name of the project within the directory where you ran the command.

## Create a new project

{% hint style="warning" %}
This description is coming soon.
{% endhint %}

