*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${employee_master_page.tbl_workgroup}                                               xpath=//div[text() = "WORK_GROUP_VALUE"]
${employee_master_page.btn_search}                                                  xpath=//span[contains(@class,"glyphicon-search")]/parent::button
${employee_master_page.txt_employee_id}                                             xpath=//label[. = "Employee ID"]/../following-sibling::div//input
${employee_master_page.btn_employee_search}                                         xpath=(//button[text() = "Reset"]/preceding-sibling::button[text() = "Search"])[2]
${employee_master_page.tbl_employee_result}                                         xpath=//td[@title="Employee_ID"]/parent::tr
${employee_master_page.screenshot_file_name}                                        Add-Leave-TEST_NAME-{index}.png

#employee detail table
${employee_master_page.employee_detail.btn_employee_leave}                          xpath=//a[text() = "Employee Leave"] 
${employee_master_page.employee_detail.btn_add_leave}                               xpath=//span[contains(@class,'glyphicon-plus')]/parent::button   
${employee_master_page.employee_detail.btn_search_leave}                            xpath=//span[contains(@class,'glyphicon-search')]/parent::button
${employee_master_page.employee_detail.btn_delete_leave}                            xpath=//span[contains(@class,'glyphicon-trash')]/parent::button
${employee_master_page.employee_detail.btn_request_date}                            xpath=//label[text() = "Request Date"]/../following-sibling::div//input
${employee_master_page.employee_detail.btn_search}                                  xpath=//button[text() = "Search"]
${employee_master_page.employee_detail.lbl_leave_value}                             xpath=//td[@title="Start Date"]/following::td[@title="End Date"]/following::td[@title="Leave Name"]/following::td[@title="Leave Type"]/following::td[@title="Request Date"]/following::td[@title="Approve Status"]/following::td[@title="Approval Name"]/following::td[@title="Approve Date"]/following::td[@title="Remark"]
${employee_master_page.employee_leave.btn_search_leave}                             xpath=//label[. = "Standard Leave"]/following-sibling::div/button
${employee_master_page.employee_leave.txt_select_leave}                             xpath=//*[text() = "Select Standard Leave"]/../following-sibling::div//div[normalize-space(text()) = "STANDARD_LEAVE"]
${employee_master_page.employee_leave.btn_select_standard_leave}                    xpath=//button[text() = "Select"]
${employee_master_page.employee_leave.txt_start_date}                               xpath=//label[. = "Start Date"]/following-sibling::div//input
${employee_master_page.employee_leave.txt_end_date}                                 xpath=//label[. = "End Date"]/following-sibling::div//input
${employee_master_page.employee_leave.lbl_end_date}                                 xpath=//label[text() = "End Date"]
${employee_master_page.employee_leave.chk_leave_type}                               xpath=//label[text() = "LEAVE_TYPE"]
${employee_master_page.employee_leave.slc_approve_status}                           xpath=//label[text() = "Approve status"]/following-sibling::div/select
${employee_master_page.employee_leave.txt_approval_name}                            xpath=//label[text() = "Approval name"]/following-sibling::div/input
${employee_master_page.employee_leave.txt_approve_date}                             xpath=//label[text() = "Approve Date"]/following-sibling::div//input
${employee_master_page.employee_leave.btn_save}                                     xpath=//button[text() = "Save"]
${employee_master_page.lbl_loading}                                   xpath=//*[contains(@class, "mx-progress")]

*** Keywords ***
Wait Until Loading Disappear
    Run Keyword And Ignore Error                    Wait Until Element Is Visible           ${employee_master_page.lbl_loading}    timeout=3s
    Wait Until Element Is Not Visible               ${employee_master_page.lbl_loading} 

Select Workgroup
    [Arguments]        ${workgroup_value}
    ${tbl_workgroup}                                Replace String    ${employee_master_page.tbl_workgroup}    WORK_GROUP_VALUE    ${workgroup_value}   
    Click Element When Ready                        ${tbl_workgroup}

Click Search Button
    Click Element When Ready                        ${employee_master_page.btn_search}

Input Employee ID
    [Arguments]         ${Employee_ID}
    Input Text When Ready                           ${employee_master_page.txt_employee_id}                     ${Employee_ID}

Click Search Employee Button
    Click Element When Ready                        ${employee_master_page.btn_employee_search}

Click Employee Result
    [Arguments]        ${department_value}
    ${tbl_department}                               Replace String    ${employee_master_page.tbl_employee_result}     Employee_ID    ${department_value}
    Double Click Element When Ready                 ${tbl_department}

Click Employee Leave Button
    Click Element When Ready                        ${employee_master_page.employee_detail.btn_employee_leave}

Click Employee Leave Add Button
    Click Element When Ready                        ${employee_master_page.employee_detail.btn_add_leave}

Click Search Leave 
    Click Element When Ready                        ${employee_master_page.employee_leave.btn_search_leave}

Select Standard Leave
    [Arguments]        ${standard_leave}
    ${txt_select_leave}                             Replace String    ${employee_master_page.employee_leave.txt_select_leave}     STANDARD_LEAVE    ${standard_leave}
    Click Element When Ready                        ${txt_select_leave}

Click Select Standard Leave
    Click Element When Ready                        ${employee_master_page.employee_leave.btn_select_standard_leave}

Input Employee Leave Start Date
    [Arguments]         ${Start_Date}
    Input Text When Ready                           ${employee_master_page.employee_leave.txt_start_date}                       ${Start_Date}

Input Employee Leave End Date
    [Arguments]         ${End_Date}
    Input Text When Ready                           ${employee_master_page.employee_leave.txt_end_date}                         ${End_Date}

Click End Date Label
    Click Element When Ready                        ${employee_master_page.employee_leave.lbl_end_date}

Click Checkbox Leave Type
    [Arguments]        ${leave_type}
    ${chk_leave_type}                               Replace String    ${employee_master_page.employee_leave.chk_leave_type}     LEAVE_TYPE    ${leave_type}
    Click Element When Ready                        ${chk_leave_type}

Select Approve Status
    [Arguments]         ${Approve_Status}
    Select From List By Label                       ${employee_master_page.employee_leave.slc_approve_status}                   ${Approve_Status}

Input Approval Name
    [Arguments]         ${Approval_Name}
    Input Text When Ready                           ${employee_master_page.employee_leave.txt_approval_name}                    ${Approval_Name}

Input Approve Date
    [Arguments]         ${Approve_Date}
    Input Text When Ready                           ${employee_master_page.employee_leave.txt_approve_date}                     ${Approve_Date}

Click Save Employee Leave
    Scroll Element Into View                        ${employee_master_page.employee_leave.btn_save}
    ${status}                                       Run Keyword And Return Status    Click Element When Ready                   ${employee_master_page.employee_leave.btn_save}
    Run Keyword If                                  '${status}' == 'False'           Press Keys                                 ${employee_master_page.employee_leave.btn_save}    \ue00f 
    Run Keyword If                                  '${status}' == 'False'           Click Element When Ready                   ${employee_master_page.employee_leave.btn_save}

Click Employee Leave Search Button
    Click Element When Ready                        ${employee_master_page.employee_detail.btn_search_leave}

Input Employee Leave Request Date               
    [Arguments]         ${Request_Date}
    Input Text When Ready                           ${employee_master_page.employee_detail.btn_request_date}                    ${Request_Date}

Click Employee Leave Search
    Scroll Element Into View                        ${employee_master_page.employee_detail.btn_search}
    Click Element When Ready                        ${employee_master_page.employee_detail.btn_search}

Check Employee Leave Value
    [Arguments]        ${StartDate}     ${EndDate}      ${LeaveName}        ${LeaveType}        ${RequestDates}      ${ApproveStatus}        ${ApprovalName}     ${ApproveDate}      ${Remark}
    ${tbl_department}                               Replace String    ${employee_master_page.employee_detail.lbl_leave_value}       Start Date          ${StartDate}
    ${tbl_department}                               Replace String    ${tbl_department}                                             End Date            ${EndDate}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Leave Name          ${LeaveName}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Leave Type          ${LeaveType}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Request Date        ${RequestDates}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Approve Status      ${ApproveStatus}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Approval Name       ${ApprovalName}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Approve Date        ${ApproveDate}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Remark              ${Remark}
    Scroll Element Into View                        ${tbl_department}
    Press Keys                                      ${tbl_department}           \ue00f
    Element should be visible                       ${tbl_department}

Click Employee Leave Value
    [Arguments]        ${StartDate}     ${EndDate}      ${LeaveName}        ${LeaveType}        ${RequestDates}      ${ApproveStatus}        ${ApprovalName}     ${ApproveDate}      ${Remark}
    ${tbl_department}                               Replace String    ${employee_master_page.employee_detail.lbl_leave_value}       Start Date          ${StartDate}
    ${tbl_department}                               Replace String    ${tbl_department}                                             End Date            ${EndDate}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Leave Name          ${LeaveName}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Leave Type          ${LeaveType}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Request Date        ${RequestDates}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Approve Status      ${ApproveStatus}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Approval Name       ${ApprovalName}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Approve Date        ${ApproveDate}
    ${tbl_department}                               Replace String    ${tbl_department}                                             Remark              ${Remark}
    Scroll Element Into View                        ${tbl_department}
    Click Element When Ready                        ${tbl_department}

Click Delete Employee Leave
    Scroll Element Into View                        ${employee_master_page.employee_detail.btn_delete_leave}
    Click Element When Ready                        ${employee_master_page.employee_detail.btn_delete_leave}

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}                         Replace String    ${employee_master_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot                         ${screenshot_file_name}



