*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${login_local_page.txt_username}           xpath=//input[@id="usernameInput"]
${login_local_page.txt_password}           xpath=//input[@id="passwordInput"]
${login_local_page.btn_sign_in}            xpath=//button[@id="loginButton"]

*** Keywords ***
Input Username
    [Documentation]    Input username in username text box
    [Arguments]        ${username}
    Input Text When Ready            ${login_local_page.txt_username}    ${username}

Input Password
    [Documentation]    Input password in password text box
    [Arguments]        ${password}
    Input Text When Ready            ${login_local_page.txt_password}    ${password}

Click Login Button
    [Documentation]    Click login button
    Click Element When Ready         ${login_local_page.btn_sign_in}