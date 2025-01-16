*** Settings ***
Library    SeleniumLibrary
Library    GherkinParser
Library    Collections
Resource    ../resources/pages/loginpage.robot
Resource    ../config/testingData.robot
Resource    ../resources/pages/dashboardpage.robot
Resource    ../resources/pages/basketpage.robot
Resource    ../resources/pages/ordersummarypage.robot

*** Test Cases ***
Scenario : the calculation of subtotal product on Order Summary Page
    [Setup]  user login to application     ${STANDARD_USER}    ${PASSWORD}
    Given user on Dasboard Page
    When user click button atc on Dashboard Page
    And user click button basket in rigth on Dashboard Page
    And user should see "product1" name on Basket Page
    Then user should see "product1" price on Basket Page
    And user should see product qty on Basket Page
    When user click button checkout on Basket Page
    And user input data customer for information checkout on Order Summary Page
    And user click button continue on Order Summary Page
    And user should see product price on Order Summary Page
    And user should see quantity product on Order Summary Page
    Then the calculation of tax is correct on Order Summary Page
    Then the calculation of total amoun is correts on Order Summary Page



