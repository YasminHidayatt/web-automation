*** Settings ***
Library    SeleniumLibrary
Library    GherkinParser
Resource    ../resources/Page/loginpage.robot
Resource    ../config/browser.robot
Resource    ../resources/Page/dashboardPage.robot

*** Test Cases ***
Secenario : Login With user credential succes on Login Page
    Given user open Browser
    And user Input username on login Page
    And user Input password on login Page
    And user click login button on Login Page
    Then user should see header swag lags
    
