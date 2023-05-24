*** Settings ***
Library                             OperatingSystem

*** Test Cases ***

My Second Robot Test
    [Tags]  my_second
    Create File                     new_file.txt                        Hello World!