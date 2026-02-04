*** Settings ***
Library    SeleniumLibrary
Documentation    UAT test for KKU website using Robot Framework on Jenkins

*** Variables ***
${TARGET_URL}    https://computing.kku.ac.th

*** Test Cases ***
Verify KKU Website Can Be Opened
    [Tags]    uat    lab8
    Launch Browser In Headless Mode
    Page Title Should Exist
    Close Browser

*** Keywords ***
Launch Browser In Headless Mode
    ${chrome_opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${chrome_opts}    add_argument    --headless
    Call Method    ${chrome_opts}    add_argument    --no-sandbox
    Call Method    ${chrome_opts}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Chrome    options=${chrome_opts}
    Go To    ${TARGET_URL}

Page Title Should Exist
    ${page_title}=    Get Title
    Should Not Be Empty    ${page_title}
