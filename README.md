# Beginners Guide to Robot Framework

## Introduction

Hello! So you want to learn Robot Framework? This guide is everything you need for getting started! You don’t need any previous experience in test automation to use this guide. You will learn how to install Robot Framework on your computer and get started building cool automation.

## Installation

1. First, check if your computer already has Python programming language. Open Terminal/Command Prompt and type in:
```
python --version
```
2. If Python is not installed, download and install latest version from [Python Downloads](https://www.python.org/downloads/). If installing to Windows, check "Add Python to PATH" in the Python installer.
3. Restart the Terminal/Command Prompt program after Python installation.
4. Next, install Robot Framework. Type in to Terminal/Command Prompt:
```
pip install robotframework
```
If installation was succesful, this command prints robot version:
```
robot --version
```
Wow! Robot Framework is now ready to be used!

### Troubleshooting installation

If command pip does not work, most probable reason is that Python is not found. There are two options to tackle this:

Option 1: Add Python to PATH. Robot Framework's installation instructions include [in-depth instructions for modifying PATH](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst#configuring-path).

Option 2: Or if you use Windows, run Python using command `py -m `:
```
py -m pip install robotframework
```
and for checking if installation was succesful:
```
py -m robot --version
```

### Selecting code editor

Simple robot automation can be written using a any text editor, even Notepad. Check list of [suggested editors on Robot Framework's homepage](https://robotframework.org/#tools). If you don't have preference, very popular editor is [Visual Studio Code](https://code.visualstudio.com/), that has really good [Robot Framework extension](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense).

## Writing a first automation case

Following example shows how to write your first robot automation case:

1. Create a new file and save it using an extension `.robot`, for example, `my_first.robot`
2. Write in file `*** Test Cases ***`. This creates [section](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-sections) for test cases.
3. Type in following (note to add the four spaces before `Log To Console`)
```
My First Robot Test
    Log To Console            Hello Robot World!
```
4. First test is now ready and it should look like this:
```
*** Test Cases ***

My First Robot Test
    Log To Console            Hello Robot World!
```
5. Open Terminal/Command Prompt. Navigate to the same folder where your `.robot` file is located and run the test by inputting command `robot my_first.robot`. For example:
```
cd your_folder
robot my_first.robot
```
6. When Robot is run, you will see this:
```
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
Robot has created test report files in the same folder where you run the test. You can check details of the first test run by opening report.html file.

[Examples](./Examples) of this manual introduces Keyword Libraries and Variables related to Robot Framework automation.

## More information

Thank you for visiting the Beginners Guide! Hope you enjoyed learning Robot Framework. More about writing test cases: [How To Write Good Test Cases](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst).
