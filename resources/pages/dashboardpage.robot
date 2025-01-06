*** Settings ***
Resource  ../Locator/dashboarLocator.robot

Library    SeleniumLibrary

*** Variables ***
${text}    Swag Labs

*** Keywords ***
user should see header swag lags
    Wait Until Element Is Visible     ${LABEL_HEADER_TITLE}
    Element Text Should Be     ${LABEL_HEADER_TITLE}  ${text}

user should see icon cart rigth on Dasboard Page
    Element Should Be Visible     ${ICON_CART}

user should see product name on Dashboard Page 
    Element Should Be Visible     ${LABEL_PRODUCT_NAME}

user should see product price on Dashboard Page
    Element Should Be Visible    ${LABEL_PRODUCT_PRICE}

user should see button add to cart on Dasboard Page
    Element Should Be Visible    ${BUTTON_ATC}

user click button atc on Dashboard Page
    Click Element     ${BUTTON_ATC}

user should see couter in icon cart on Dasboard Page
    Element Should Be Visible    ${COUNT_PRODUCT}
    Element Text Should Be    ${COUNT_PRODUCT}    "1"
