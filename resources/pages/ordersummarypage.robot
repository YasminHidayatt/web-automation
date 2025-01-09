*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     yaml
Library    OperatingSystem
# Library    ../resources/testingData.py
Resource  ../Locator/ordersummaryLocator.robot



*** Keywords ***
user input data customer for information checkout on Order Summary Page
    Input Text    ${INPUT_FIRST_NAME}      TEST 
    Input Text    ${INPUT_LAST_NAME}        QA
    Input Text    ${INPUT_POSTAL_CODE}    123 test

user click button continue on Order Summary Page
    Click Element    ${BUTTON_SUBMIT}

user click cancel submit information customer on Order Summary Page  
    Click Element    ${BUTTON_CANCEL}

user should see product qty on Order Summary Page
    ${qty}    Get Text        ${LABEL_PRODUCT_QTY}
    Should Be Equal As Integers    ${qty}    ${LABEL_PRODUCT_QTY}

user should see sub total product price on Order Summary Page
    Element Should Be Visible    ${LABEL_SUBTOTAL_PRODUCT}
    Get Text    ${LABEL_SUBTOTAL_PRODUCT}

the calculation of tax is correct on Order Summary Page
    Get Text    ${LABEL_TAX}

the calculation of total amount is correct on Order Summary Page
    Get Text    ${LABEL_TOTAL_AMOUNT} 
    # set product
    




