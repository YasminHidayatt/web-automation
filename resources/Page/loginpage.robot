*** Settings ***
Library  SeleniumLibrary
Resource  ../Locator/loginLocator.robot



*** Keywords ***
user Input username on login Page
    Wait Until Element Is Visible  ${INPUT_USERRNAME}
    Click Button       ${INPUT_USERRNAME}
    Input Text        ${INPUT_USERRNAME}    standard_user
user Input password on login Page
    Wait Until Element Is Visible  ${INPUT_PASSWORD}
    Click Button     ${INPUT_PASSWORD}
    Input Text        ${INPUT_PASSWORD}  secret_sauce
user click login button on Login Page
    Click Button      ${BUTTON_LOGIN}

