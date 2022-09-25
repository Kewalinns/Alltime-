*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
#Time Request
Select Department
    [Documentation]     Select department by given type and value
    [Arguments]     ${value}        ${type}=name
    time_request_by_manager_page.Click Search Department Button
    ${selected_department} =        popup_select_department_keywords.Select Department    ${value}        ${type}
    time_request_by_manager_page.Check Department Text       ${selected_department}

Load More Results
    ${more_to_load} =       Run Keyword And Return Status       time_request_by_manager_page.Check Load More Button Is Visible 
    Run Keyword If      '${more_to_load}' == 'True'             time_request_by_manager_page.Click Load More Button

Save Time Request 
    [Documentation]     Save time request for the given employee ID
    [Arguments]        ${employee_id}    ${work_date}    ${date_in}    ${date_out}      ${time_in}       ${time_out}      ${reason}        ${department}    ${remark}=${empty}
    time_request_by_manager_keywords.Select Department                      ${department}    name
    time_request_by_manager_page.Input Search Employee Id                   ${employee_id}        
    time_request_by_manager_page.click Search Button 
    time_request_by_manager_page.Click Selected Employee Id From List       ${employee_id}
    #Select work date
    time_request_by_manager_page.Input Work Date         ${work_date}
    #In work point
    time_request_by_manager_page.Check In Work Point 
    time_request_by_manager_page.Input In Work Point Date    ${date_in}
    time_request_by_manager_page.Input In Work Point Time   ${time_in}
    #Out work point
    time_request_by_manager_page.Check Out Work Point 
    time_request_by_manager_page.Input Out Work Point Date    ${date_out}
    time_request_by_manager_page.Input Out Work Point Time   ${time_out}
    #Others
    time_request_by_manager_page.Select Reason For Adjust   ${reason} 
    time_request_by_manager_page.input Adjust Remark        ${remark}

    time_request_by_manager_page.Click Save Adjust Time 
   
Input Value
    [Arguments]         ${ID}
    time_request_by_manager_page.Input Search Employee Id       ${ID}
    time_request_by_manager_page.Click Search Button
    time_request_by_manager_page.Wait Until Loading Disappear
    time_request_by_manager_page.Click Result Chevron icon

Input Adjust Time
    [Arguments]         ${work_date}        ${date_in_work}     ${time_in_work}     ${date_out_work}    ${time_out_work}    ${select}
    time_request_by_manager_page.Input Work Date                ${work_date}
    time_request_by_manager_page.Check In Work Point 
    time_request_by_manager_page.Input In Work Point Date       ${date_in_work}
    time_request_by_manager_page.Input In Work Point Time       ${time_in_work}
    time_request_by_manager_page.Check Out Work Point 
    time_request_by_manager_page.Input Out Work Point Date      ${date_out_work}
    time_request_by_manager_page.Input Out Work Point Time      ${time_out_work}
    time_request_by_manager_page.Select Reason For Adjust       ${select}
    time_request_by_manager_page.Click Save Adjust Time 

Check Warning Popup
    popup_window_module.Check Popup Window Is Shown
    popup_window_module.Click Continue Button 

Check PopUp And Info
    [Arguments]         ${text}=Send request to
    time_request_by_manager_page.Wait Until Loading Disappear
    popup_info_module.Check Popup Is Shown        
    popup_info_module.Check Info          ${text}
    time_request_by_manager_page.Capture Screenshot
    popup_info_module.Click Ok Button 