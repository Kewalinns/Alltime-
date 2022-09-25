*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${assign_shift_page.txt_date}                         xpath=//label[. = "Date"]/../following-sibling::td//input
${assign_shift_page.slc_workgroup}                    xpath=//label[. = "Workgroup"]/../following-sibling::td//select
${assign_shift_page.slc_filter_trans_type}            xpath=//label[. = "Filter transaction type"]/following-sibling::select
${assign_shift_page.btn_search_department}            xpath=//label[. = "Department"]/../../following-sibling::td//span[contains(@class, "glyphicon-search")]/parent::button
${assign_shift_page.btn_clear_department}             xpath=//label[. = "Department"]/../../following-sibling::td//span[contains(@class, "glyphicon-remove")]/parent::button
${assign_shift_page.lbl_select_department}            xpath=//*[normalize-space(text()) = "Select Department"]
${assign_shift_page.btn_select_department}            xpath=//button[text()="Select"]
${assign_shift_page.tbl_department}                   xpath=//div[text() = "DEPARTMENT_VALUE"]
${assign_shift_page.chk_subdept}                      xpath=//label[normalize-space(text()) = "Subdept"]/./input
${assign_shift_page.chk_sub_position}                 xpath=//label[normalize-space(text()) = "sub position"]/./input
${assign_shift_page.txt_employee_id}                  xpath=//label[. = "Employee ID"]/following-sibling::input
${assign_shift_page.txt_first_name}                   xpath=//label[. = "First name"]/following-sibling::input
${assign_shift_page.txt_last_name}                    xpath=//label[. = "Last name"]/following-sibling::input
${assign_shift_page.slc_day_type}                     xpath=//label[. = "Day Type"]/following-sibling::select
${assign_shift_page.btn_clear}                        xpath=//button[contains(.,'Clear')]
${assign_shift_page.btn_search}                       xpath=//button[contains(.,'Search')]
${assign_shift_page.rdo_one_day}                      xpath=//label[normalize-space(text()) = "One Day"]/./input
${assign_shift_page.rdo_date_range}                   xpath=//label[normalize-space(text()) = "Date range"]/./input
${assign_shift_page.slc_shift}                        xpath=//label[. = "Shift"]/../following-sibling::td//select
${assign_shift_page.btn_change}                       xpath=//button[contains(.,'Change')]
${assign_shift_page.btn_delete}                       xpath=//span[contains(@class, "glyphicon-refresh")]/parent::button[. = "Delete"]
${assign_shift_page.btn_re_process}                   xpath=//span[contains(@class, "glyphicon-refresh")]/parent::button[. = "Re-Process"]

*** Keywords ***
Click Select Department By Value
    [Documentation]    Click Select department by value
    [Arguments]        ${department_value}
    ${tbl_department}                Replace String    ${assign_shift_page.tbl_department}    DEPARTMENT_VALUE    ${department_value}
    Click Element When Ready         ${tbl_department}

Input Date
    [Arguments]         ${date}
    Input Text When Ready                   ${assign_shift_page.txt_date}                               ${date}

Select Workgroup
    [Arguments]         ${Workgroup}
    Select From List By Label               ${assign_ot_plan_page.slc_filter_type}                      ${Workgroup}

Select Filter Transaction Type
    [Arguments]         ${Transaction_Type}
    Select From List By Label               ${assign_shift_page.slc_filter_trans_type}                  ${Transaction_Type}

Department Search Button
    Click Element When Ready                ${assign_shift_page.btn_search_department}

Department Clear Button 
    Click Element When Ready                ${assign_shift_page.btn_clear_department} 

Click Checkbox Subdept
    Click Element When Ready                ${assign_shift_page.chk_subdept}

Click Checkbox Sub Position
    Click Element When Ready                ${assign_shift_page.chk_sub_position}

Click Select Department 
    Click Element When Ready                ${assign_shift_page.btn_select_department}

Input Employee ID
    [Arguments]         ${Employee_ID}
    Input Text When Ready                   ${assign_shift_page.txt_employee_id}                        ${Employee_ID}

Input Firstname
    [Arguments]         ${Firstname}
    Input Text When Ready                   ${assign_shift_page.txt_first_name}                         ${Firstname}

Input Lastname
    [Arguments]         ${Lastname}
    Input Text When Ready                   ${assign_shift_page.txt_last_name}                          ${Lastname}

Select Day Type
    [Arguments]         ${Day_Type}
    Select From List By Label               ${assign_shift_page.slc_day_type}                           ${Day_Type}

Click Checkbox One Day
    Click Element When Ready                ${assign_shift_page.rdo_one_day}
    
Click Checkbox Date Range
    Click Element When Ready                ${assign_shift_page.rdo_date_range}

Click Clear
    Click Element When Ready                ${assign_shift_page.btn_clear}

Click Search
    Click Element When Ready                ${assign_shift_page.btn_search}

Select Shift
    [Arguments]         ${Shift}
    Select From List By Label               ${assign_shift_page.slc_shift}                              ${Shift}

Click Change  
    Click Element When Ready                ${assign_shift_page.btn_change}

Click Delete
    Click Element When Ready                ${assign_shift_page.btn_delete}

Click Reprocess
    Click Element When Ready                ${assign_shift_page.btn_re_process}