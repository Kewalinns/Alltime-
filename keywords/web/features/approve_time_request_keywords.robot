*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Approve Time Request 
    [Arguments]    ${emp_id}        ${work_date}        ${in_work_point}        ${out_work_point}        ${reason}
    ${records} =        approve_time_request_page.Count Time Request     ${emp_id}        ${work_date}        ${in_work_point}        ${out_work_point}        ${reason}

    #Click all checkboxes match the given criterias
    FOR     ${i}     IN RANGE     1        ${records}
        ${index} =        Convert To String    ${i}
        approve_time_request_page.Click Approve Time Request Checkbox     ${emp_id}        ${work_date}        ${in_work_point}        ${out_work_point}        ${reason}        ${index}
    END

    #Click approve button
    approve_time_request_page.Click Approve Button 

    #Check result and close popup
    # ${text} =        Catenate    Approve ${records} record.
    popup_info_keywords.Check Info And Close Popup     ${empty}