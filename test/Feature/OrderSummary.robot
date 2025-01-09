# *** Settings ***
# Library    ../resources/testingData.py
# Library    SeleniumLibrary

# *** Test Cases ***
# Set And Get Product Details
#     [Documentation]    Test setting and getting product details
#     Set Product Details    Laptop    1000.0    2    100.0
#     ${details}=    Get Product Details
#     Should Be Equal    ${details['name']}    Laptop
#     Should Be Equal As Numbers    ${details['price']}    1000.0
#     Should Be Equal As Numbers    ${details['quantity']}    2
#     Should Be Equal As Numbers    ${details['tax']}    100.0
#     Should Be Equal As Numbers    ${details['total_amount']}    2100.0