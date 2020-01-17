# Beginners Guide for Robot Framework

## Introduction

Hello! So you want to learn Robot Framework? This guide is everything you need for getting started! You don’t need any previous experience in test automation to use this guide. With the guide, you will learn how to install Robot Framework on your system and get started building cool test cases.

## Installation


1. First, check if your computer already has Python programming language. Open Terminal/Command Prompt and type in:
```
python --version
```
2. If Python is not installed, download and install latest version from [Python Downloads](https://www.python.org/downloads/). If installing to Windows, check "Add Python to PATH" in the Python installer.
3. Next, install Robot Framework. Type in to Terminal/Command Prompt:
```
pip install robotframework
```
If installation was succesfull, this command works:
```
robot --version
```
Wow! Robot Framework is now ready to be used!

### Troubleshooting installation

If command pip does not work, most probable reason is that Python scripts are not in the computer's PATH. There are two options to tackle this:

Option 1: Add Python and python/scripts forder to PATH. Robot Framework's installation instructions include [in-depth instructions for modifying PATH](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#configuring-path).

Option 2: Or if you use Windows, run Python using command `py -m `:
```
py -m pip install robotframework
```
and for checking if installation was succesfull:
```
py -m robot --version
```

## Writing your first automation case

* Selecting editor
* Naming file
* Structure of the test/task
* Running it
* Checking the log files

## More information

Utilizing [libraries](https://robotframework.org/#libraries)

References
