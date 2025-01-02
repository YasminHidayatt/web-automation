*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${chrome_browser}           https://www.saucedemo.com/

*** Keywords ***
user open Browser
    # Start Testcase Headless
    Open Browser
    go to   ${chrome_browser}
Finish Testcase
    close browser
Start Testcase Headless
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --ignore-ssl-errors
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --no-sandbox
    call method    ${options}    add_argument    --disable-gpu
#    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --window-size\=1366,768
#    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    # Create WebDriver    Chrome    chrome_options=${options}