*** Settings ***
Library                             OperatingSystem

*** Variables ***
${GOOD_TEXT} =                      Hello nice humans! 
${BAD_TEXT}                         Robots will take over! 

*** Test Cases ***

My Third Robot Test
    [Tags]  my_third
    Create File                     new_file.txt                        ${GOOD_TEXT}
    File Should Not Be Empty        new_file.txt

My Forth Robot Test
    [Tags]  my_forth
    ${file_content} =               Get File                            new_file.txt
    Should Be Equal                 ${file_content}                     ${GOOD_TEXT}
    Should Not Be Equal             ${file_content}                     ${BAD_TEXT}