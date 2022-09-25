*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${assign_ot_plan_page.txt_date_input}                               xpath=//label[. = "Date"]/../following-sibling::td//input[contains(@class,'dateinput')]
${assign_ot_plan_page.lbl_date}                                     xpath=//label[. = "Date"]
${assign_ot_plan_page.slc_workgroup}                                xpath=//label[. = "Workgroup"]/../following-sibling::td//select
${assign_ot_plan_page.btn_search_bar_dropdown}                      xpath=////h2[. = "Addition search bar"]/./i
${assign_ot_plan_page.slc_filter_type}                              xpath=//label[. = "Filter type"]/../following-sibling::td/select
${assign_ot_plan_page.btn_warning}                                  xpath=(//button[text() = "OK" ])[1]
${assign_ot_plan_page.btn_department_search}                        xpath=//label[. = "Department"]/../following-sibling::td//span[contains(@class, "glyphicon-search")]/parent::button
${assign_ot_plan_page.btn_department_delete}                        xpath=//label[. = "Department"]/../following-sibling::td//span[contains(@class, "glyphicon-remove")]/parent::button
${assign_ot_plan_page.txt_search_code}                              xpath=//div[. = "Code"]/../following-sibling::div[input]/input
${assign_ot_plan_page.txt_search_name}                              xpath=//div[. = "Name"]/../following-sibling::div[input]/input
${assign_ot_plan_page.tbl_department}                               xpath=//div[text() = "DEPARTMENT_VALUE"]
${assign_ot_plan_page.btn_select_select_department}                 xpath=//div[contains(@class,'window-content')]//button[contains(@class,'actionButton2')]
${assign_ot_plan_page.btn_close_select_department}                  xpath=//div[contains(@class,'window-content')]//button[contains(@class,'actionButton1')]
${assign_ot_plan_page.slc_position}                                 xpath=//label[. = "Position"]/../following-sibling::td//select
${assign_ot_plan_page.slc_employee_group}                           xpath=//label[. = "Employee Group"]/../following-sibling::td//select
${assign_ot_plan_page.chk_sub_position}                             xpath=//label[. = "Sub position"]/../input
${assign_ot_plan_page.chk_sub_dept}                                 xpath=//label[. = "Sub dept."]/../input
${assign_ot_plan_page.txt_employee_id}                              xpath=//label[. = "Employee ID"]/../input
${assign_ot_plan_page.txt_firstname}                                xpath=//label[. = "First name"]/../input
${assign_ot_plan_page.txt_lastname}                                 xpath=//label[. = "Last name"]/../input   
${assign_ot_plan_page.slc_day_type}                                 xpath=//label[. = "Day Type"]/../select    
${assign_ot_plan_page.chk_filter_planned_ot}                        xpath=//label[. = "Filter Planned OT"]/../input
${assign_ot_plan_page.slc_ot_status}                                xpath=//label[. = "OT Status"]/../following-sibling::td/select
${assign_ot_plan_page.btn_clear}                                    xpath=(//span[contains(@class, "glyphicon-remove")]/parent::button)[2]
${assign_ot_plan_page.btn_search}                                   xpath=(//span[contains(@class, "glyphicon-search")]/parent::button)[2]
${assign_ot_plan_page.slc_ot}                                       xpath=//label[. = "O.T."]/../following-sibling::td//select
${assign_ot_plan_page.slc_hours}                                    xpath=(//span[. = "Hour"]/../following-sibling::td//select)[1]
${assign_ot_plan_page.slc_minutes}                                  xpath=(//span[. = "Hour"]/../following-sibling::td//select)[2]
${assign_ot_plan_page.btn_change}                                   xpath=//button[contains(.,'Change')]
${assign_ot_plan_page.btn_report}                                   xpath=//button[contains(.,'Report')]
${assign_ot_plan_page.lbl_loading}                                  xpath=//*[contains(@class, "mx-progress")]
${assign_ot_plan_page.chk_select_value}                             xpath=//span[text() = "ID"]/../../../../../preceding-sibling::td/div//input
${assign_ot_plang_page.ot_required}                                 xpath=//*[contains(text(), "emp_id")]/ancestor::tr/following-sibling::tr//*[contains(text(), "OT is Required")]
${assign_ot_plan_page.screenshot_file_name}                         Assign-OT-TEST_NAME-{index}.png

*** Keywords ***
Date Input
    [Arguments]         ${Text}
    Clear And Input Text When Ready         ${assign_ot_plan_page.txt_date_input}    ${Text}

Wait Until Loading Disappear
    Run Keyword And Ignore Error            Wait Until Element Is Visible           ${assign_ot_plan_page.lbl_loading}    timeout=3s
    Wait Until Element Is Not Visible       ${assign_ot_plan_page.lbl_loading}

Click Date Label
    Click Element When Ready                ${assign_ot_plan_page.lbl_date} 

Close Warning Massage
    Click Element When Ready                ${assign_ot_plan_page.btn_warning}

Select Workgroup 
    [Arguments]         ${Workgroup}
    Sleep  2s     reason=Fixed for flasky test
    Select From List By Label               ${assign_ot_plan_page.slc_workgroup}                        ${Workgroup} 

Click Search Bar Dropdown
    Click Element When Ready                ${assign_ot_plan_page.btn_search_bar_dropdown}        

Select Filter Type
    [Arguments]         ${Filter_Type}
    Select From List By Label               ${assign_ot_plan_page.slc_filter_type}                      ${Filter_Type}

Click Department Search Button
    Click Element When Ready                ${assign_ot_plan_page.btn_department_search}

Department Delete Button
    Click Element When Ready                ${assign_ot_plan_page.btn_department_delete}

Input Code Department
    [Arguments]         ${code}
    Input Text When Ready                   ${assign_ot_plan_page.txt_search_code}                      ${code}           

Select Department From Search
    [Arguments]        ${department_value}
    ${tbl_department}                Replace String    ${assign_ot_plan_page.tbl_department}    DEPARTMENT_VALUE    ${department_value}
    Click Element When Ready         ${tbl_department}

Click Select Department
    Click Element When Ready                ${assign_ot_plan_page.btn_select_select_department}

Click Close Select Department
    Click Element When Ready                ${assign_ot_plan_page.btn_close_select_department}

Select Position Dropdown
    [Arguments]         ${Position}
    Select From List By Label               ${assign_ot_plan_page.slc_position}                         ${Position}

Select Employee Group
    [Arguments]         ${Employee_Group}
    Select From List By Label               ${assign_ot_plan_page.slc_employee_group}                   ${Employee_Group}

Click Checkbox Sub Dept
    Click Element When Ready                ${assign_ot_plan_page.chk_sub_dept}

Click Checkbox Sub Position
    Click Element When Ready                ${assign_ot_plan_page.chk_sub_position}

Input Employee ID  
    [Arguments]         ${Employee_ID}
    Input Text When Ready                   ${assign_ot_plan_page.txt_employee_id}                      ${Employee_ID}

Input Firstname
    [Arguments]         ${Firstname}
    Input Text When Ready                   ${assign_ot_plan_page.txt_firstname}                        ${Firstname}

Input Lastname
    [Arguments]         ${Lastname}
    Input Text When Ready                   ${assign_ot_plan_page.txt_lastname}                         ${Lastname}

Select Day Type
    [Arguments]         ${Day_Type}
    Select From List By Label               ${assign_ot_plan_page.slc_day_type}                         ${Day_Type}

Click Checkbox Filter Planned OT
    Click Element When Ready                ${assign_ot_plan_page.chk_filter_planned_ot}

Select OT Status
    [Arguments]         ${OT_Status}
    Select From List By Label               ${assign_ot_plan_page.slc_ot_status}                        ${OT_Status}

Click Clear
    Click Element When Ready                ${assign_ot_plan_page.btn_clear}  

Click Search
    Click Element When Ready                ${assign_ot_plan_page.btn_search}

Select OT
    [Arguments]         ${OT}
    Select From List By Label               ${assign_ot_plan_page.slc_ot}                               ${OT}

Select Hours
    [Arguments]         ${Hours}
    Select From List By Label               ${assign_ot_plan_page.slc_hours}                            ${Hours}

Select Minutes
    [Arguments]         ${Minutes}
    Select From List By Label               ${assign_ot_plan_page.slc_minutes}                          ${Minutes}

Click Button Change
    Click Element When Ready                ${assign_ot_plan_page.btn_change} 

Click Button Report
    Click Element When Ready                ${assign_ot_plan_page.btn_report} 

Checkbox Select Value
    [Arguments]         ${ID}
    ${tbl_id}                Replace String     ${assign_ot_plan_page.chk_select_value}     ID    ${ID}
    Click Element When Ready                    ${tbl_id}

Check OT Required
    [Arguments]        ${emp_id}
    ${emp}                   Replace String     ${assign_ot_plang_page.ot_required}    emp_id    ${emp_id}
    Wait Until Element Is Visible     ${emp}

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}                     Replace String    ${assign_ot_plan_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot                     ${screenshot_file_name}