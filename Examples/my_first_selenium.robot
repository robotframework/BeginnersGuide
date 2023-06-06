*** Settings ***
Library                             SeleniumLibrary
Library                             DebugLibrary

*** Variables ***
${first_article}  //article//a[1]

*** Test Cases ***
My Fisrt Selenium Robot Test
    [Tags]  my_first_selenium
    # Step 1 : aller sur le site https://thedemosite.co.uk/
    Given the visitor is on "https://thedemosite.co.uk/"
    # Step 2 : cliquer sur le premier article de la page d'accueil
    When the visitor clicks on the first article
    # Step 3 : vérifier que le termes "Web3" est bien présent plus de 10 fois dans la page
    And we count the numbers of "Web3" occurencies is higher than 10
    # Step 4 : vérifier qu'il y a bien deux blocs related posts
    Then we can see "2" related posts

*** Keywords ***
the visitor is on "${url}"
    Open Browser  ${url}  chrome
    Capture Page Screenshot

the visitor clicks on the first article
    ${article_is_visible}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${first_article}
    IF    ${article_is_visible}
        Click Element    ${first_article}
        Capture Page Screenshot
    END

we count the numbers of "${terms}" occurencies is higher than 10
    ${count_terms}=  Get Element Count  //*[contains(text(),"${terms}")]
    Should Be True    ${count_terms} > 10
    
we can see "${numbers}" related posts
    Scroll Element Into View    //*[@class='ast-single-related-posts-container']
    ${get_count_articles}=  Get Element Count    //*[@class='ast-single-related-posts-container']//article
    Should Be True    ${get_count_articles} > 1
    Open