*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     yaml
Library    OperatingSystem
Library    ../resources/testingData.py
Resource  ../Locator/ordersummaryLocator.robot

*** Variables ***
${TAX_PERCENTAGE}    0.08

*** Keywords ***
user input data customer for information checkout on Order Summary Page
    Input Text    ${INPUT_FIRST_NAME}      TEST 
    Input Text    ${INPUT_LAST_NAME}        QA
    Input Text    ${INPUT_POSTAL_CODE}    123 test

user click button continue on Order Summary Page
    Click Element    ${BUTTON_SUBMIT}

user click cancel submit information customer on Order Summary Page  
    Click Element    ${BUTTON_CANCEL}

user should see quantity product on Order Summary Page
    ${qty}    Get Product Quantity
    Should Be Equal    ${qty}    ${LABEL_PRODUCT_QTY}

user should see sub total product price on Order Summary Page
    ${product-price}    Get Product Price
    ${Qty}    Get Product Quantity
    ${sub-total}    Evaluate    ${product-price} * ${Qty}
    Should Be Equal    ${sub-total}    ${LABEL_SUBTOTAL_PRODUCT}
    Set Total Amount    ${sub-total}

the calculation of tax is correct on Order Summary Page
    ${total-amount}     Get Total Amount
    ${tax-actual}    Evaluate    ${total-amount} * ${TAX_PERCENTAGE}
    Should Be Equal     ${tax-actual}    ${LABEL_TAX} 
    Set Tax Product    ${tax-actual}
    

user should see product price on Order Summary Page
    ${product-price}    Get Product Price
    Should Be Equal     ${product-price}    ${LABEL_PRODUCT_PRICE}

the calculation of total amoun is correts on Order Summary Page
    ${actual-product-price}    Get Product Price
    ${actual-tax-product}      Get Tax Product
    ${actual-total-amount}    Evaluate     ${actual-product-price} + ${actual-tax-product}
    Should Be Equal    ${actual-total-amount}    ${LABEL_TOTAL_AMOUNT}
