*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Search OT Plan 
    [Arguments]        ${from_date}        ${to_date}        ${work_group}        ${department}        ${employee_id}        ${first_name}    ${transaction_type}=Department
    approve_ot_plan_page.Input From Date                    ${from_date}
    approve_ot_plan_page.Wait Until Loading Disappear
    approve_ot_plan_page.Input To Date                      ${to_date}
    approve_ot_plan_page.Wait Until Loading Disappear
    approve_ot_plan_page.Select Work Group                  ${work_group}  
    # approve_ot_plan_page.Select Filter Transaction Type     ${transaction_type}
    approve_ot_plan_page.Click Search Department Button
    ${selected_department} =         popup_select_department_keywords.Select Department       ${department}        name
    Should Be Equal As Strings       ${selected_department}         ${department}      ignore_case=True
    approve_ot_plan_page.Check Department Text               ${department}
    approve_ot_plan_page.Input Employee Id                   ${employee_id}
    # approve_ot_plan_page.Input First Name                    ${first_name}
    approve_ot_plan_page.Click Search Button

Approve OT Plan 
    [Arguments]        ${employee_id}        ${date}        ${ot}        ${hour}
    approve_ot_plan_page.Check Search Result Returned By Employee ID        ${employee_id}
    # approve_ot_plan_page.Click Check All                                    ${employee_id}
    approve_ot_plan_page.Check Given OT Plan Returned                       ${employee_id}        ${date}        ${ot}        ${hour}  
    approve_ot_plan_page.Click Given OT Plan                                ${employee_id}        ${date}        ${ot}        ${hour}  
    approve_ot_plan_page.Click Approve Button 
    approve_ot_plan_page.Check Given OT Plan Approved                       ${employee_id}        ${date}        ${ot}        ${hour}
    approve_ot_plan_page.Capture Screenshot
