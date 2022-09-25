*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${login_page.btn_local}                    xpath=//img[contains(@onclick, "loginlocal")]
${login_page.btn_ad}                       xpath=//img[contains(@onclick, "idp_id")]

*** Keywords ***
Click Local Login Button
    [Documentation]    Click local login button
    Click Element When Ready         ${login_page.btn_local}

Click AD Login Button
    [Documentation]    Click AD login button
    Click Element When Ready         ${login_page.btn_ad}