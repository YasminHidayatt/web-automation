*** Settings ***
Library    SeleniumLibrary
Library    GherkinParser
Resource    ../resources/pages/loginpage.robot
Resource    ../config/browser.robot
Resource    ../config/testingData.robot
Resource    ../resources/pages/dashboardpage.robot


*** Test Cases ***
Scenario : Login With user credential succes on Login Page
    Given user open Browser
    And user Input username on login Page
    And user Input password on login Page
    And user click login button on Login Page
    Then user should see header swag lags

Scenario : Login With user credential failed on Login Page
    Given user login to application     ${LOCKED_OUT_USER}     ${PASSWORD}
    And user should see error message on login Page
