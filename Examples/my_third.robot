*** Settings ***
Library                             OperatingSystem

***Test Cases***

My Third Robot Test
    Create File                     new_file.txt                        Hello World!

My Fourth Robot Test                
    Log File                        new_file.txt