*** Settings ***
Library                             SeleniumLibrary
Library                             DebugLibrary

*** Variables ***
${Firstname}       Lucas
${Lastname}        VAN NOORT
${Email}           contact@acodyme.com
${Message}         Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
${Contact_Link}    //*[@id="menu-item-25"]/a/span[text()=
${Contact_Form}    //*[@id="post-24"]/div/div/form

*** Test Cases ***
My Second Selenium Robot Test
    [Tags]  my_second_selenium
    # Step 1 : aller sur le site https://thedemosite.co.uk/
    Given the visitor is on "https://thedemosite.co.uk/"
    # Step 2 : cliquer dans le menu sur la page "Contact"
    When the visitor clicks on "Contact" link menu
    # Step 3 : vérifier que le formulaire (element <form/>) est présent dans le DOM HTML
    And the visitor checks the form is in the page
    # Step 4 : remplir le formulaire de contact (prendre en compte le nombre de champs à remplir)
    And the visitor fill the form
    # Step 5 : soumettre le formulaire de contact
    And the visitor submit his form
    # Step 6 : vérifier que le formulaire a bien été envoyé
    Then the form is corretly submitted

*** Keywords ***
the visitor is on "${url}"
    Open Browser  ${url}  chrome
    Capture Page Screenshot

the visitor clicks on "${name_menu_link}" link menu
    Sleep  4s
    ${contact_link_is_visible}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Contact_Link}"${name_menu_link}"]
    IF    ${contact_link_is_visible}
        Click Element    ${Contact_Link}"${name_menu_link}"]
        Capture Page Screenshot
    END

the visitor checks the form is in the page
    Wait Until Element Is Visible    ${Contact_Form}

the visitor fill the form
    Input Text    //*[@autocomplete="given-name"]    ${Firstname}
    Input Text    //*[@autocomplete="family-name"]    ${Lastname}
    Input Text    //*[@autocomplete="email"]    ${Email}
    Input Text    //textarea    ${Message}
    Capture Page Screenshot

the visitor submit his form
    Click Button    //*[@id="post-24"]/div/div/form/div/button
    Sleep  4s

the form is corretly submitted
    Page Should Contain    The form has been submitted successfully!
    Capture Page Screenshot
