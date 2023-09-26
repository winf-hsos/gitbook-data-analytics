---
description: >-
  To be able to work comfortably with R, we take care of the working environment
  in the first step. This includes R & Python, RStudio Desktop, and Git.
---

# 1 Tools

## Install R

R is an open-source software that is available for all popular operating systems. First, download the latest version of R for your operating system, and then proceed to install it.

* [R for Windows](https://cran.r-project.org/bin/windows/base/)
* [R for macOS](https://cran.r-project.org/bin/macosx/)
* [R for Linux](https://cran.r-project.org/bin/linux/)

Along with the language and interpreter for R, the installation also provides a rudimentary graphical user interface called RGui (GUI = Graphical User Interface). This consists of a simple console through which you can enter and execute R commands. The RGui is limited in its functionality and usability, and we'll be using RStudio Desktop instead.&#x20;

## RStudio

### RStudio Desktop

Today, RStudio is the standard tool for working with R and provides many useful features. RStudio is an Integrated Development Environment (IDE) for R and even for Python. You can find a quick overview of the graphical user interface in the [official RStudio Cheatsheet](https://posit.co/wp-content/uploads/2022/10/rstudio-ide-1.pdf).

To download and install RStudio Desktop for your operating system, click the following link:

{% embed url="https://posit.co/download/rstudio-desktop/#download" %}

### Using RStudio in the Cloud

For those who want to take their first steps with R and don't want to go through the hassle of installing it, the cloud solution is ideal. RStudio offers free accounts that are limited to a certain usage time per month (25 hours) and computer resources (up to 1 GB RAM, 1 CPU). The advantage is that you can get started right away. The link below leads directly to the free registration:

{% embed url="https://rstudio.cloud/" %}

Because of the limitations, I strongly recommend you use RStudio Desktop for this course.

## Python

Python is a widely adopted programming language and the de facto standard for machine learning applications. To run Python programs on our computer, you must install it first. You can download the latest version of Python from the following website:

{% embed url="https://www.python.org/downloads/" %}

On Windows, Python comes as an executable file with the extension `.exe`. Save the file anywhere on your hard drive and double-click on it when the download has finished. When you do, the first window appears that looks similar to the one in the screenshot below:

<figure><img src="../.gitbook/assets/image (56).png" alt=""><figcaption><p>Make sure you check the two boxes during installation. The, click "Install Now".</p></figcaption></figure>

Make sure you check the boxes "_Use admin privileges when installing py.exe_" and "_Add python.exe to PATH_". The former ensures that Python can write anywhere on your computer, which is important when you install packages later. The latter enables you to use Python from anywhere on your computer. We'll use Python mostly from the command line (or terminal), and with this setting, we can type `python` regardless of which folder we are in.

Next, click "Install Now", no need to customize the installation. When the installation has finished, you see the following screen:

<figure><img src="../.gitbook/assets/image (57).png" alt=""><figcaption><p>You successfully installed Python on your computer. Easy, wasn't it?</p></figcaption></figure>

Click "Close" and you're done with this step.

## Git

Data Science projects often involve collaboration within a team, which requires the sharing of code among team members. This is analogous to working together on a text document or a spreadsheet with classmates. A helpful tool for this purpose is Git, which you will primarily use in this course to obtain the example code for the corresponding module from the designated GitHub repository. It is necessary to download and install Git on your computer to proceed with the course.

{% embed url="https://git-scm.com/downloads" %}
