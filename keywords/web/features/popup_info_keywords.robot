*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Check Info And Close Popup 
    [Arguments]        ${text}
    Run Keyword And Ignore Error          time_request_by_manager_page.Wait Until Loading Disappear
    popup_info_module.Check Popup Is Shown
    popup_info_module.Check Info     ${text}
    approve_time_request_page.Capture Screenshot
    popup_info_module.Click Ok Button  