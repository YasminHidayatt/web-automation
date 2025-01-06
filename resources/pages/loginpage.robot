*** Settings ***
Library  SeleniumLibrary
Resource  ../Locator/loginLocator.robot
Resource    ../config/browser.robot



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

user login to application
    [Arguments]  ${username}  ${password}
    user open Browser
    Wait Until Element Is Visible    ${INPUT_USERRNAME}
    Input Text     ${INPUT_USERRNAME}    ${username}
    Input Text     ${INPUT_PASSWORD}    ${password}
    Click Button   ${BUTTON_LOGIN}
    
user should see error message on login Page
    Wait Until Element Is Visible    ${LABEL_LOG_ERROR}
    Element Should Be Visible     ${LABEL_LOG_ERROR}
