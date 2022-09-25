*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${main_menu.btn_hr_work}                             xpath=//a[normalize-space(text()) = "HR Work"]
${main_menu.btn_hr_work_collapsed}                   xpath=//a[normalize-space(text()) = "HR Work"]/parent::li[contains(@class, "mx-navigationtree-collapsed")]
${main_menu.btn_employee_master}                     xpath=//a[normalize-space(text()) = "Employee Master (HR)"]
${main_menu.btn_manager_self_service}                xpath=//a[normalize-space(text()) = "Manager Self-service"]
${main_menu.btn_manager_self_service_collapsed}      xpath=//a[normalize-space(text()) = "Manager Self-service"]/parent::li[contains(@class, "mx-navigationtree-collapsed")]
${main_menu.btn_assign_shift}                        xpath=//a[normalize-space(text()) = "Assign Shift"]
${main_menu.btn_assign_ot_plan}                      xpath=//a[normalize-space(text()) = "Assign OT Plan"]
${main_menu.btn_assign_ot_plan_range}                xpath=//a[normalize-space(text()) = "Assign OT Plan Range"]
${main_menu.btn_approve_ot_plan}                     xpath=//a[normalize-space(text()) = "Approve OT Plan"]
${main_menu.btn_view_time_by_manager}                xpath=//a[normalize-space(text()) = "ViewTime by Manager"]
${main_menu.btn_time_request_by_manager}             xpath=//a[normalize-space(text()) = "Time Request by Manager"]
${main_menu.btn_report_menu}                         xpath=//a[normalize-space(text()) = "Report"]
${main_menu.btn_approve_time_request}                xpath=//a[normalize-space(text()) = "Approve Time Request"]
${main_menu.btn_approve_time_sheet}                  xpath=//a[normalize-space(text()) = "Approve Timesheet"]
${main_menu.btn_approve_payable_time}                xpath=//a[normalize-space(text()) = "Approve Payable Time"]
${main_menu.btn_back}                                xpath=//span[contains(@class, "-left")]/parent::button

*** Keywords ***
Expand HR Work Menu
    [Documentation]    Click to expand HR Work menu
    Click Element When Ready         ${main_menu.btn_hr_work}

Check HR Work Menu Is Collapsed
    [Documentation]    Check HR Work menu is collapsed
    Element Should Be Visible        ${main_menu.btn_hr_work_collapsed}

Click Employee Master Menu Button
    [Documentation]    Click employee master menu button
    Click Element When Ready         ${main_menu.btn_employee_master}

Expand Manage Self Service Menu
    [Documentation]    Click to expand manage self-service menu
    Click Element When Ready         ${main_menu.btn_manager_self_service}

Check Manage Self Service Menu Is Collapsed
    [Documentation]    Check Manage self service menu is collapsed
    Element Should Be Visible        ${main_menu.btn_manager_self_service_collapsed}

Click Assign Shift Menu Button
    [Documentation]    Click assign shift menu button
    Click Element When Ready         ${main_menu.btn_assign_shift}

Click Assign OT Plan Menu Button
    [Documentation]    Click assign OT plan menu button
    Click Element When Ready         ${main_menu.btn_assign_ot_plan}

Click Assign OT Plan Range Menu Button
    [Documentation]    Click assign OT plan range menu button
    Click Element When Ready         ${main_menu.btn_assign_ot_plan_range}

Click View Time By Manager Menu Button
    [Documentation]    Click view time by manager menu button
    Click Element When Ready         ${main_menu.btn_view_time_by_manager}

Click Time Request By Manager Menu Button
    [Documentation]    Click time request by manager menu button
    Click Element When Ready         ${main_menu.btn_time_request_by_manager}

Click Approve OT Plan Menu Button 
    [Documentation]    Click Approve OT Plan menu
    click Element When Ready         ${main_menu.btn_approve_ot_plan} 

Click Report Menu Button
    [Documentation]    Click report menu button
    Click Element When Ready         ${main_menu.btn_report_menu}

Click Approve Time Request Button 
    [Documentation]    Click Approve Time Request menu
    Click Element When Ready         ${main_menu.btn_approve_time_request}    

Click Approve Time Sheet Button
    [Documentation]    Click Approve Timesheet menu
    Click Element When Ready        ${main_menu.btn_approve_time_sheet}

Click Back Button
    [Documentation]    Click back button
    Click Element When Ready         ${main_menu.btn_back}

Click Approve Payable Time
    [Documentation]    Click Approve Payable Time
    Click Element When Ready        ${main_menu.btn_approve_payable_time}