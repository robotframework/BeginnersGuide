*** Settings ***
Library                             SeleniumLibrary

*** Variables ***

*** Test Cases ***
My Fisrt Selenium Robot Test
    [Tags]  my_first_selenium
    # Step 1 : aller sur le site https://thedemosite.co.uk/
    # Step 2 : cliquer sur le premier article de la page d'accueil
    # Step 3 : vérifier que le termes "Web3 technology" est bien présent plus de 10 fois dans la page
    # Step 4 : vérifier qu'il y a bien deux blocs related posts

*** Keywords ***