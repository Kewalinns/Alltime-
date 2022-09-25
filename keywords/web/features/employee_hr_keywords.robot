*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot

*** Keywords ***

Search Employee By ID
    [Documentation]    Search employee by Employee ID
    [Arguments]        ${workgroup_value}    ${employee_id}
    employee_master_page.Select Workgroup                           ${workgroup_value}
    employee_master_page.Click Search Button
    employee_master_page.Input Employee ID                          ${employee_id}
    employee_master_page.Click Search Employee Button    
    employee_master_page.Click Employee Result                      ${employee_id}

Add And Verify Employee Leave
    [Arguments]         ${RequestDate}    ${LeaveName}    ${StartDate}    ${EndDate}    ${LeaveType}    ${ApproveStatus}    ${ApprovalName}    ${ApproveDate}    ${Remark}=${EMPTY}
    employee_hr_keywords.Add Employee Leave                  ${LeaveName}    ${StartDate}    ${EndDate}    ${LeaveType}    ${ApproveStatus}    ${ApprovalName}    ${ApproveDate}
    employee_hr_keywords.Search Employee Leave Value         ${RequestDate}      ${StartDate}    ${EndDate}    ${LeaveName}    ${LeaveType}    ${ApproveStatus}    ${ApprovalName}    ${ApproveDate}    ${Remark}

Add Employee Leave
    [Arguments]         ${LeaveName}     ${StartDate}    ${EndDate}      ${LeaveType}       ${ApproveStatus}     ${ApprovalName}     ${ApproveDate}
    employee_master_page.Click Employee Leave Button
    employee_master_page.Click Employee Leave Add Button
    employee_master_page.Click Search Leave 
    employee_master_page.Select Standard Leave               ${LeaveName}
    employee_master_page.Click Select Standard Leave
    employee_master_page.Input Employee Leave Start Date     ${StartDate}
    employee_master_page.Input Employee Leave End Date       ${EndDate}
    employee_master_page.Click End Date Label
    employee_master_page.Click Checkbox Leave Type           ${LeaveType}
    employee_master_page.Select Approve Status               ${ApproveStatus}
    employee_master_page.Input Approval Name                 ${ApprovalName}
    employee_master_page.Input Approve Date                  ${ApproveDate}
    employee_master_page.Click Save Employee Leave
    employee_master_page.Wait Until Loading Disappear

Delete Employee Leave
    [Arguments]         ${RequestDate}     ${LeaveName}      ${StartDate}     ${EndDate}        ${LeaveType}    ${ApproveStatus}        ${ApprovalName}     ${ApproveDate}      ${Remark}=${EMPTY}
    employee_master_page.Click Employee Leave Button
    employee_master_page.Click Employee Leave Search Button
    employee_master_page.Input Employee Leave Request Date           ${RequestDate}
    employee_master_page.Click Employee Leave Search
    employee_master_page.Click Employee Leave Value          ${StartDate}     ${EndDate}      ${LeaveName}        ${LeaveType}        ${RequestDate}      ${ApproveStatus}        ${ApprovalName}     ${ApproveDate}      ${Remark}
    employee_master_page.Click Delete Employee Leave
    popup_info_module.Check Popup Is Shown
    popup_info_module.Click Ok Button 

Search Employee Leave Value
    [Arguments]         ${RequestDate}      ${StartDate}     ${EndDate}      ${LeaveName}        ${LeaveType}    ${ApproveStatus}        ${ApprovalName}     ${ApproveDate}      ${Remark}=${EMPTY}
    employee_master_page.Click Employee Leave Search Button
    employee_master_page.Input Employee Leave Request Date           ${RequestDate}
    employee_master_page.Click Employee Leave Search
    employee_master_page.Check Employee Leave Value                  ${StartDate}     ${EndDate}      ${LeaveName}        ${LeaveType}        ${RequestDate}      ${ApproveStatus}        ${ApprovalName}     ${ApproveDate}      ${Remark}
    employee_master_page.Capture Screenshot