*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${approve_time_request_page.btn_approve}            xpath=//button[text() = "Approve"]
${approve_time_request_page.btn_reject}             xpath=//button[text() = "Reject"]
${approve_time_request_page.ul_result}              xpath=//ul[contains(@class, "mx-listview-list")]
${approve_time_request_page.li_result_list}         xpath=//ul[contains(@class, "mx-listview-list")]/li
${approve_time_request_page.li_approve_list}        xpath=//*[contains(text(), "{emp_id}")]//ancestor::div//label[text() = "Workdate"]/following-sibling::div/p[text() = "{work_date}"]//ancestor::td//label[text() = "In workpoint"]/following-sibling::div/p[text() = "{in_work_point}"]//ancestor::td//label[text() = "Out workpoint"]/following-sibling::div/p[text() = "{out_work_point}"]//ancestor::td//label[text() = "Reason for adjust"]/following-sibling::div//p[text() = "{reason}"]//ancestor::li
${approve_time_request_page.chk_approve}            xpath=(//*[contains(text(), "{emp_id}")]//ancestor::div//label[text() = "Workdate"]/following-sibling::div/p[text() = "{work_date}"]//ancestor::td//label[text() = "In workpoint"]/following-sibling::div/p[text() = "{in_work_point}"]//ancestor::td//label[text() = "Out workpoint"]/following-sibling::div/p[text() = "{out_work_point}"]//ancestor::td//label[text() = "Reason for adjust"]/following-sibling::div//p[text() = "{reason}"]//ancestor::li//input[@type = "checkbox"])[{index}]
${approve_time_request_page.screenshot_file_name}   Approve-Time-Request-TEST_NAME-{index}.png

*** Keywords ***
Click Approve Button 
    Click Element When Ready        ${approve_time_request_page.btn_approve}

Click Reject Button 
    Click Element When Ready        ${approve_time_request_page.btn_reject}  

Check Time Request Result 
    [Documentation]    Checks if there are approval list showns on the page
    ${elements} =         Get Element Count        ${approve_time_request_page.li_result_list}

    Should Be True        ${elements} > 0

Check Time Request
    [Documentation]     Checks if there are approval list shown for the given criterias
    [Arguments]    ${emp_id}        ${work_date}        ${in_work_point}        ${out_work_point}        ${reason}
    ${locator} =        Replace String    ${approve_time_request_page.li_approve_list}       {emp_id}                 ${emp_id}
    ${locator} =        Replace String    ${locator}                                         {work_date}            ${work_date}
    ${locator} =        Replace String    ${locator}                                         {in_work_point}        ${in_work_point}
    ${locator} =        Replace String    ${locator}                                         {out_work_point}       ${out_work_point}
    ${locator} =        Replace String    ${locator}                                         {reason}               ${reason}

    ${elements} =       Get Element Count        ${locator}  
    Should Be True      ${elements} > 0

Count Time Request 
    [Documentation]     Returns number of recordsof the given criterias
    [Arguments]    ${emp_id}        ${work_date}        ${in_work_point}        ${out_work_point}        ${reason}
    ${locator} =        Replace String    ${approve_time_request_page.li_approve_list}       {emp_id}                 ${emp_id}
    ${locator} =        Replace String    ${locator}                                         {work_date}            ${work_date}
    ${locator} =        Replace String    ${locator}                                         {in_work_point}        ${in_work_point}
    ${locator} =        Replace String    ${locator}                                         {out_work_point}       ${out_work_point}
    ${locator} =        Replace String    ${locator}                                         {reason}               ${reason}

    Wait Until Page Contains Element      ${locator}

    # Log To Console    locator=${locator}

    ${elements} =       Get Element Count        ${locator}  

    [Return]            ${elements}   

Click Approve Time Request Checkbox 
    [Documentation]    Clicks checkbox on the list for the give criterias
    [Arguments]    ${emp_id}        ${work_date}        ${in_work_point}        ${out_work_point}        ${reason}        ${index}=1
    ${locator} =        Replace String    ${approve_time_request_page.chk_approve}       {emp_id}                 ${emp_id}
    ${locator} =        Replace String    ${locator}                                         {work_date}            ${work_date}
    ${locator} =        Replace String    ${locator}                                         {in_work_point}        ${in_work_point}
    ${locator} =        Replace String    ${locator}                                         {out_work_point}       ${out_work_point}
    ${locator} =        Replace String    ${locator}                                         {reason}               ${reason}
    ${locator} =        Replace String    ${locator}                                         {index}                ${index}

    # Log To Console    locator${index}=${locator}

    Click Element When Ready              ${locator}

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}                     Replace String    ${approve_time_request_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot                     ${screenshot_file_name}