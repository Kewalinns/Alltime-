*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${home_page.nav_home_lbl}                  xpath=//*[normalize-space(text()) = "Alltime"]
${home_page.btn_main_menu}                 xpath=//button[contains(@class, "toggle-btn")]
${home_page.btn_login}                     xpath=//button[contains(@class, "login-btn")]
${home_page.btn_logout}                    xpath=//button[contains(@class, "logout-btn")]
${home_page.txt_employee_id}               xpath=//label[contains(text(), 'Employee ID')]/following-sibling::input
${home_page.btn_del_timesheet}             xpath=(//div[@class = "col-md-4"]//button)[1]
${home_page.btn_del_time_request}          xpath=(//div[@class = "col-md-4"]//button)[2]
${home_page.btn_del_ot_plan}               xpath=(//div[@class = "col-md-4"]//button)[3]

*** Keywords ***
Check Go To Home Page
    [Documentation]    Check go to home page
    Wait Until Element Is Visible    ${home_page.nav_home_lbl}

Click Main Menu Button
    [Documentation]    Click main menu button
    Click Element When Ready         ${home_page.btn_main_menu}

Click Login Button
    [Documentation]    Click login button
    Click Element When Ready         ${home_page.btn_login}

Click Logout Button
    [Documentation]    Click logout button
    Click Element When Ready         ${home_page.btn_logout}

Click Delete Timesheet
    [Documentation]    Click Delete Timesheet
    Scroll Element Into View         ${home_page.btn_del_timesheet}
    Click Element When Ready         ${home_page.btn_del_timesheet}

Click Delete Time Request
    [Documentation]    Click Delete Time Request
    Scroll Element Into View         ${home_page.btn_del_time_request}
    Click Element When Ready         ${home_page.btn_del_time_request}

Click Delete OT Plan
    [Documentation]    Click Delete OT Plan
    Scroll Element Into View         ${home_page.btn_del_ot_plan}
    Click Element When Ready         ${home_page.btn_del_ot_plan}

Input Employee ID
    [Documentation]    Input employee id in textbox
    [Arguments]        ${emp_id}
    Scroll Element Into View         ${home_page.txt_employee_id}
    Input Text When Ready            ${home_page.txt_employee_id}    ${emp_id}