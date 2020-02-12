# Beginners Guide to Robot Framework

Table of contents:

- [Introduction](#introduction)
- [Installation](#installation)
  - [Troubleshooting installation](#troubleshooting-installation)
    - [Selecting code editor](#selecting-code-editor)
- [Writing a first automation case](#writing-a-first-automation-case)
- [Viewing test results](#viewing-test-results)
- [Content of the test case](#content-of-the-test-case)
- [Variables](#variables)
- [Keywords](#keywords)
- [More information](#more-information)

## Introduction

Hello! So you want to learn Robot Framework? This guide is everything you need for getting started! You don’t need any previous experience in test automation to use this guide. You will learn how to install Robot Framework on your computer and get started building cool automation.

## Installation

1. First, check if your computer already has Python programming language. Open Terminal/Command Prompt and type in:

```bash
python --version
```

2. If Python is not installed, download and install latest version from [Python Downloads](https://www.python.org/downloads/). If installing to Windows, check "Add Python to PATH" in the Python installer.
3. Restart the Terminal/Command Prompt program after Python installation.
4. Next, install Robot Framework. Type in to Terminal/Command Prompt:

```bash
pip install robotframework
```

If installation was succesful, this command prints robot version:

```bash
robot --version
```

Wow! Robot Framework is now ready to be used!

### Troubleshooting installation

If command pip does not work, most probable reason is that Python is not found. There are two options to tackle this:

Option 1: Add Python to PATH. Robot Framework's installation instructions include [in-depth instructions for modifying PATH](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#configuring-path).

Option 2: Or if you use Windows, run Python using command `py -m`:

```bash
py -m pip install robotframework
```

and for checking if installation was succesful:

```bash
py -m robot --version
```

### Selecting code editor

Simple robot automation can be written using a any text editor, even Notepad. Check list of [suggested editors on Robot Framework's homepage](https://robotframework.org/#tools). If you don't have preference, very popular editor is [Visual Studio Code](https://code.visualstudio.com/), that has really good [Robot Framework extension](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense).

## Writing a first automation case

Following example shows how to write your first robot automation case:

1. Create a new file and save it using an extension `.robot`, for example, `my_first.robot`
2. Write in file `*** Test Cases ***`. This creates [section](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-sections) for test cases.
3. Type in following (note to add the four spaces before `Log To Console`)

```python
My First Robot Test
    Log To Console            Hello Robot World!
```

First test is now ready and it should look like this:

```python
*** Test Cases ***

My First Robot Test
    Log To Console            Hello Robot World!
```

4. Open Terminal/Command Prompt. Navigate to the same folder where your `.robot` file is located and run the test by inputting command `robot my_first.robot`. For example:

```bash
cd your_folder
robot my_first.robot
```

5. When Robot is run, you will see the results:

```bash
> robot my_first.robot
==============================================================================
My First
==============================================================================
My First Robot Test                                                   Hello Robot World!
My First Robot Test                                                   | PASS |
------------------------------------------------------------------------------
My First                                                              | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /output.xml
Log:     /log.html
Report:  /report.html

```

Congratulations! You have now run your first test case. Robot has created test report files in the same folder where you run the test.

## Viewing test results

You can check details of the first test run by opening report.html file.

Running the demo generates the following three result files. These files are linked to pre-executed files available online, but executing the demo creates them locally.

[report.html](./Results/report.html) - Higher level test report.

[log.html](./Results/log.html) - Detailed test execution log.

[output.xml](./Results/output.xml) - Results in machine readable XML format.

## Content of the test case

Test cases are created from keywords that are ready made or user written. An example of a keyword is `Log To Console`, which you used in your first automation case. That keyword was part of the Robot Framework. There is a wide selection of other libraries [available](https://robotframework.org/#libraries), which you can use based on your needs.

Your next automation case will show how to add libries to `Settings` section of your Robot file.

1. Let's add an Operating Systems library to our next example:

```python
*** Settings ***
Library                             OperatingSystem
```

Your second test is now ready and it should look like this. This test will create a new file called new_file.txt:

```python
*** Settings ***
Library                             OperatingSystem

***Test Cases***

My Second Robot Test
    Create File                     new_file.txt               Hello World!
```

2. Run the Robot like in the previous test.

After running the Robot the new_file.txt should contain the text `Hello World!`.

## Variables

- TODO: variables -> Example how to use

## Keywords

TODO:

- library keywords
- User keywords -> Link to quick start guide

## More information

Thank you for visiting the Beginners Guide! Hope you enjoyed learning Robot Framework. More about writing test cases: [How To Write Good Test Cases](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst).

[Examples](./Examples) of this manual introduces Keyword Libraries and Variables related to Robot Framework automation.
