*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${FIRSTNAME}  value
${LASTNAME}   value
${EMAIL}      value
${MESSAGE}    value

*** Test Cases ***
My Second Selenium Robot Test
    [Tags]  my_second_selenium
    # Step 1 : aller sur le site https://thedemosite.co.uk/
    # Step 2 : cliquer dans le menu sur la page "Contact"
    # Step 3 : vérifier que le formulaire (element <form/>) est présent dans le DOM HTML
    # Step 4 : remplir le formulaire de contact (prendre en compte le nombre de champs à remplir)
    # Step 5 : soumettre le formulaire de contact
    # Step 6 : vérifier que le formulaire a bien été envoyé

*** Keywords ***