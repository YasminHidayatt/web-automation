*** Settings ***
Library    SeleniumLibrary
Library    GherkinParser
Library    Collections
Resource    ../resources/pages/loginpage.robot
Resource    ../config/testingData.robot
Resource    ../resources/pages/dashboardpage.robot
Resource    ../resources/pages/basketpage.robot
   

*** Test Cases ***
Scenario : user should see product details on Basket Page
    [Setup]  user login to application     ${STANDARD_USER}    ${PASSWORD}
    Given user on Dasboard Page
    When user click button atc on Dashboard Page
    And user click button basket in rigth on Dashboard Page
    And user should see "product1" name on Basket Page
    Then user should see "product1" price on Basket Page
    [Teardown]    Close Browser


scenario : user should see multiple product on Basket Page (wip)
    [Setup]  user login to application     ${STANDARD_USER}    ${PASSWORD}
    Given user on Dasboard Page
    When user click button atc on Dashboard Page
    And user click button atc on Dashboard Page
    And user click button basket in rigth on Dashboard Page
    Then the calculation of total amount for multiple product on Basket Page
    [Teardown]    Close Browser