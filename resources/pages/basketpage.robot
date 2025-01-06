*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     yaml
Library    OperatingSystem
Library    String
Resource  ../Locator/basketLocator.robot

*** Variables ***
${path}    /web-automation/resources/productData.yaml

*** Keywords ***
Load get product Data 
    ${data}      Get File     ${path}
    ${LOADED}    yaml.Safe Load      ${data}
    RETURN    ${LOADED}

user should see "${product_name}" price on Basket Page 
    ${loadData}       Load get product Data
    ${productData}    Get From Dictionary    ${loadData['products']}    ${product_name}
    ${price}    Dollar Normalizer    ${LABEL_PRODUCT_PRICE}
    Should Be Equal    ${price}    ${productData['price']}

user should see "${product}" name on Basket Page
    ${loadData}       Load get product Data
    ${productData}    Get From Dictionary    ${loadData['products']}    ${product} 
    Element Text Should Be    ${LABEL_PRODUCT_NAME}    ${productData['productName']}

user click button remove product on Basket Page
    Click Element    ${BUTTON_REMOVE}

user click button checkout on Basket Page
    Click Element    ${BUTTON_CHECKOUT}

user click button back to Shopping Page
    Click Element    ${BUTTON_BACK_TO_SHOPPING}    

Dollar Normalizer
    [Arguments]     ${locator}
    ${price}    Get Text    ${locator}
    ${normal_price}    Replace String    ${price}    $    replace_with=${\n}
    ${actual_price}    Convert To Number    ${normal_price}
    RETURN    ${actual_price}

the calculation of total amount for multiple product on Basket Page
    [Arguments]    @{productList}
    ${totalAmount}   Evaluate    0
    ${loadData}       Load get product Data
    FOR    ${product}    IN    @{productList}
        ${productData}    Get From Dictionary    ${loadData['products']}    ${product}
        ${price}    Dollar Normalizer    ${LABEL_PRODUCT_PRICE}
        ${totalAmount}    Evaluate    ${totalAmount} + ${price}
    END
        


