*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot

*** Keywords ***
Input Date
    [Arguments]         ${date}    
    assign_ot_plan_page.Date Input                  ${date}
    assign_ot_plan_page.Click Date Label
    assign_ot_plan_page.Wait Until Loading Disappear

Select Workgroup
    [Arguments]         ${Workgroup}  
    assign_ot_plan_page.Select Workgroup            ${Workgroup} 


Search Department
    [Arguments]         ${department}
    assign_ot_plan_page.Click Department Search Button
    popup_select_department_keywords.Select Department          ${department}

Input Value
    [Arguments]         ${ID}       ${first_name}       
    assign_ot_plan_page.Input Employee ID       ${ID}
    # assign_ot_plan_page.Input Firstname         ${first_name}
    assign_ot_plan_page.Click Search
    assign_ot_plan_page.Wait Until Loading Disappear


Input OT
    [Arguments]         ${OT}       ${hours}     ${minutes}     ${id}
    assign_ot_plan_page.Select OT               ${OT}
    assign_ot_plan_page.Select Hours            ${hours}
    assign_ot_plan_page.Select Minutes          ${minutes}
    assign_ot_plan_page.Checkbox Select Value   ${id}
    assign_ot_plan_page.Click Button Change
    assign_ot_plan_page.Wait Until Loading Disappear
    popup_info_module.Check Popup Is Shown
    assign_ot_plan_page.Capture Screenshot
    popup_info_module.Click Ok Button

Input OT With Required
    [Arguments]         ${OT}       ${hours}     ${minutes}     ${id}
    assign_ot_plan_page.Select OT               ${OT}
    assign_ot_plan_page.Select Hours            ${hours}
    assign_ot_plan_page.Select Minutes          ${minutes}
    assign_ot_plan_page.Checkbox Select Value   ${id}
    assign_ot_plan_page.Click Button Change
    assign_ot_plan_page.Wait Until Loading Disappear
    popup_info_module.Check Popup Is Shown
    assign_ot_plan_page.Capture Screenshot
    popup_info_module.Click Ok Button
    assign_ot_plan_page.Check OT Required       ${id}

Search Employee And Assign OT Plan
    [Arguments]         ${date}    ${workgroup}    ${department}    ${ot_type}    ${ot_hour}    ${ot_min}    ${employee_id}    ${first_name}=${empty}
    assign_ot_plan_keywords.Input Date                      ${date}
    assign_ot_plan_keywords.Select Workgroup                ${workgroup}
    assign_ot_plan_keywords.Search Department               ${department}
    assign_ot_plan_keywords.Input Value                     ${employee_id}    ${first_name}
    assign_ot_plan_keywords.Input OT                        ${ot_type}    ${ot_hour}    ${ot_min}    ${employee_id}

Search Employee And Assign OT Plan With OT Required
    [Arguments]         ${date}    ${workgroup}    ${department}    ${ot_type}    ${ot_hour}    ${ot_min}    ${employee_id}    ${first_name}=${empty}
    assign_ot_plan_keywords.Input Date                      ${date}
    assign_ot_plan_keywords.Select Workgroup                ${workgroup}
    assign_ot_plan_keywords.Search Department               ${department}
    assign_ot_plan_keywords.Input Value                     ${employee_id}    ${first_name}
    assign_ot_plan_keywords.Input OT With Required          ${ot_type}    ${ot_hour}    ${ot_min}    ${employee_id}