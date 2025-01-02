*** Settings ***
Resource  ../Locator/dashboarLocator.robot

Library    SeleniumLibrary

*** Variables ***
${text}    Swag Labs

*** Keywords ***
user should see header swag lags
    # Wait Until Keyword Succeeds ${LABEL_HEADER_TITLE}
    Title Should Be  ${LABEL_HEADER_TITLE}   ${text}
