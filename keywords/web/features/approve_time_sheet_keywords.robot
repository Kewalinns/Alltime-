*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Search Re Process Time Sheet 
    [Arguments]    ${date}        ${department}        ${name}        ${employee_id}        
    approve_time_sheet_page.Input Date     ${date}
    approve_ot_plan_page.Wait Until Loading Disappear
    approve_time_sheet_page.Click Search Department Button
    ${selected_department} =         popup_select_department_keywords.Select Department       ${department}        name
    Should Be Equal As Strings       ${selected_department}         ${department}      ignore_case=True
    approve_time_sheet_page.Wait Until Loading Disappear
    approve_time_sheet_page.Check Department Text               ${department}
    approve_time_sheet_page.Input Employee Id                   ${employee_id}
    # approve_time_sheet_page.Input First Name                    ${name}
    approve_time_sheet_page.Click Search Button
    approve_time_sheet_page.Wait Until Loading Disappear
    
Re Process Time Sheet 
    [Arguments]    ${name}        ${employee_id}      ${checked}=True
    approve_time_sheet_page.Click Re Process Time Sheet Checkbox           ${name}        ${employee_id}
    approve_time_sheet_page.Click Re Process Button
    Run Keyword If    '${checked}' == 'True'    approve_time_sheet_page.Check Re Process Time Sheet Is Checked         ${employee_id}
    ...       ELSE    approve_time_sheet_page.Check Re Process Time Sheet Is Not Checked         ${employee_id}
    approve_time_sheet_page.Capture Screenshot