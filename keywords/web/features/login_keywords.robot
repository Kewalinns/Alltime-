*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot

*** Keywords ***
Login Local
    [Documentation]    Login local with username and password
    [Arguments]        ${username}     ${password}
    home_page.Click Login Button
    login_page.Click Local Login Button
    login_local_page.Input Username    ${username}
    login_local_page.Input Password    ${password}
    login_local_page.Click Login Button
    home_page.Check Go To Home Page