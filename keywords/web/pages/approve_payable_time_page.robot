*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${approve_payable_time_page.lbl_employee_type}                          xpath=//label[text() = "Employee type*"]/../following-sibling::td//select
${approve_payable_time_page.lbl_period}                                 xpath=//label[text() = "Period*"]/../following-sibling::td//select
${approve_payable_time_page.btn_search_department}                      xpath=//label[text() = "Department*"]/../following-sibling::td//span[contains(@class,"glyphicon-search")]/parent::button
${approve_payable_time_page.lbl_filter_type_department}                 xpath=//h4[text() = "Select Department"]/following::div[@class="mx-grid-content"]
${approve_payable_time_page.tbl_department}                             xpath=//div[text() = "DEPARTMENT_VALUE"]
${approve_payable_time_page.txt_employee_id}                            xpath=//label[. = "Employee ID"]/../input
${approve_payable_time_page.txt_firstname}                              xpath=//label[. = "First name"]/../input
${approve_payable_time_page.txt_lastname}                               xpath=//label[. = "Last name"]/../input
${approve_payable_time_page.chk_payable_status}                         xpath=//label[. = "Payable Status"]/following-sibling::div/label[input[@value = "Payable_Status"]]
${approve_payable_time_page.btn_search_value}                           xpath=//button[text() = "Clear"]/preceding-sibling::button
${approve_payable_time_page.btn_approve}                                xpath=//button[text() = "Approve"]
${approve_payable_time_page.btn_pending}                                xpath=//button[text() = "Pending"]
${approve_payable_time_page.lbl_loading}                                xpath=//*[contains(@class, "mx-progress")]
${approve_payable_time_page.chk_select_value}                           xpath=//span[text() = "ID"]/../../preceding-sibling::td/div//input
${approve_payable_time_page.img_check_icon}                             xpath=//span[text() = "EMPLOYEE_ID"]/../../following-sibling::td/img[contains(@src, "icon_check")]
${approve_payable_time_page.screenshot_file_name}                       Approve-Payable-TEST_NAME-{index}.png

*** Keywords ***
Wait Until Loading Disappear
    Run Keyword And Ignore Error            Wait Until Element Is Visible           ${approve_payable_time_page.lbl_loading}    timeout=3s
    Wait Until Element Is Not Visible       ${approve_payable_time_page.lbl_loading} 

Select Employee Type
    [Arguments]         ${value}
    Select From List By Label               ${approve_payable_time_page.lbl_employee_type}                      ${value}

Select Period 
    [Arguments]         ${value}
    Select From List By Label               ${approve_payable_time_page.lbl_period}                             ${value}

Click Search Department Button
    Click Element When Ready                ${approve_payable_time_page.btn_search_department}

Check Department Text 
    [Arguments]         ${text}
    Element Text Should Be                  ${approve_payable_time_page.lbl_filter_type_department}             ${text} 

Select Department
    [Documentation]     Select department by given type and value
    [Arguments]         ${value}        ${type}
    approve_payable_time_page.Click Search Department Button
    ${selected_department} =        popup_select_department_keywords.Select Department    ${value}        ${type}
    approve_payable_time_page.Check Department Text       ${selected_department}

Input Employee ID
    [Arguments]         ${text}
    Input Text When Ready                   ${approve_payable_time_page.txt_employee_id}            ${text}

Click Search Value Button
    Click Element When Ready                ${approve_payable_time_page.btn_search_value}

Checkbox Select Value
    [Arguments]         ${ID}
    ${tbl_id}                Replace String     ${approve_payable_time_page.chk_select_value}     ID    ${ID}
    Sleep    2s    reason=Fixed flaky test
    Click Element When Ready                    ${tbl_id}

Click Approve Button
    Click Element When Ready                ${approve_payable_time_page.btn_approve}

Click Pending Button
    Click Element When Ready                ${approve_payable_time_page.btn_pending} 

Checkbox Payable Status
    [Arguments]         ${PayableStatus}
    ${tbl_PayableStatus}                    Replace String     ${approve_payable_time_page.chk_payable_status}     Payable_Status    ${PayableStatus}
    Click Element When Ready                ${tbl_PayableStatus}

Payable Should Be Approved
    [Arguments]         ${ID}
    ${employee}                             Replace String     ${approve_payable_time_page.img_check_icon}      EMPLOYEE_ID    ${ID}
    Wait Until Page Contains Element        ${employee}
    Scroll Element Into View                ${employee}
    Element Should Be Visible               ${employee}

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}                     Replace String    ${approve_payable_time_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot                     ${screenshot_file_name}