*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${detail_of_trc_report_page.lbl_detail_of_trc}        xpath=//*[text() = "Detail of TRC Report"]
${detail_of_trc_report_page.slc_workgroup}            xpath=//label[text() = "Standard workgroup"]/following-sibling::div//select
${detail_of_trc_report_page.lbl_department}           xpath=//label[text() = "Department"]/following-sibling::input
${detail_of_trc_report_page.btn_department}           xpath=//span[contains(@class, "glyphicon-search")]/parent::button
${detail_of_trc_report_page.txt_from_date}            xpath=//label[text() = "From date"]/following-sibling::div//input
${detail_of_trc_report_page.txt_to_date}              xpath=//label[text() = "To date"]/following-sibling::div//input
${detail_of_trc_report_page.txt_employee_id}          xpath=//label[text() = "EmployeeID"]/following-sibling::input
${detail_of_trc_report_page.txt_first_name}           xpath=//label[text() = "First name"]/following-sibling::input
${detail_of_trc_report_page.txt_last_name}            xpath=//label[text() = "Last name"]/following-sibling::input
${detail_of_trc_report_page.btn_download_csv}         xpath=//button[text() = "CSV"]

*** Keywords ***
Check Go To Detail Of TRC Report Page
    [Documentation]    Check go to detail of trc report page
    Wait Until Element Is Visible    ${detail_of_trc_report_page.lbl_detail_of_trc}

Select Workgroup
    [Documentation]    Select standard workgroup
    [Arguments]        ${workgroup}
    Wait Until Element Is Visible    ${detail_of_trc_report_page.slc_workgroup}
    Select From List By Label        ${detail_of_trc_report_page.slc_workgroup}      ${workgroup}

Click Search Department Button
    [Documentation]    Click search department button
    Click Element When Ready         ${detail_of_trc_report_page.btn_department}

Check Department Name
    [Documentation]    Check department name
    [Arguments]        ${department_name}
    Wait Until Element Is Visible    ${detail_of_trc_report_page.lbl_department}
    ${get_department_name}           Get Value    ${detail_of_trc_report_page.lbl_department}
    Should Be Equal                  ${get_department_name}     ${department_name}

Input From Date
    [Documentation]    Input from date in text box
    [Arguments]        ${from_date}
    Input Text When Ready            ${detail_of_trc_report_page.txt_from_date}      ${from_date}

Input To Date
    [Documentation]    Input to date in text box
    [Arguments]        ${to_date}
    Input Text When Ready            ${detail_of_trc_report_page.txt_to_date}        ${to_date}

Input Employee ID
    [Documentation]    Input employee id in text box
    [Arguments]        ${employee_id}
    Input Text When Ready            ${detail_of_trc_report_page.txt_employee_id}    ${employee_id}

Input First Name
    [Documentation]    Input first name in text box
    [Arguments]        ${first_name}
    Input Text When Ready            ${detail_of_trc_report_page.txt_first_name}     ${first_name}

Input Last Name
    [Documentation]    Input last name in text box
    [Arguments]        ${last_name}
    Input Text When Ready            ${detail_of_trc_report_page.txt_last_name}      ${last_name}

Click Download CSV
    [Documentation]    Click to download csv
    Click Element When Ready         ${detail_of_trc_report_page.btn_download_csv}