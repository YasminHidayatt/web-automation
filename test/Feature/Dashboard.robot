*** Settings ***
Library    SeleniumLibrary
Library    GherkinParser
Resource    ../resources/pages/loginpage.robot
Resource    ../config/browser.robot
Resource    ../config/testingData.robot
Resource    ../resources/pages/dashboardpage.robot

*** Test Cases ***
Scnnario : user should see catalog product on Dashboard Page
    Given user login to application  ${STANDARD_USER}    ${PASSWORD}
    And user should see header swag lags
    And user should see icon cart rigth on Dasboard Page
    And user should see product name on Dashboard Page
    Then user should see button add to cart on Dasboard Page
    [Teardown]    Close Browser

Scenario : user should be add to cart product on Dasboard Page
    Given user login to application  ${STANDARD_USER}    ${PASSWORD}
    And user should see product name on Dashboard Page
    When user click button atc on Dashboard Page
    Then user should see couter in icon cart on Dasboard Page
    [Teardown]    Close Browser
