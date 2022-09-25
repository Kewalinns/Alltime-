*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Delete Data
    [Documentation]    Delete Timesheet, Time request, OT Plan by Employee ID
    [Arguments]        ${emp_id}
    home_page.Input Employee ID               ${emp_id}
    home_page.Click Delete Timesheet
    popup_info_module.Check Popup Is Shown
    popup_info_module.Click Ok Button 
    home_page.Click Delete Time Request
    popup_info_module.Check Popup Is Shown
    popup_info_module.Click Ok Button 
    home_page.Click Delete OT Plan
    popup_info_module.Check Popup Is Shown
    popup_info_module.Click Ok Button 