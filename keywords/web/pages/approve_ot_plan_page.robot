*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${approve_ot_plan_page.div_from_date}                        xpath=//label[. = "From Date"]/../following-sibling::td[1]//div[@class = "mx-dateinput"]
${approve_ot_plan_page.txt_from_date}                        xpath=//label[. = "From Date"]/../following-sibling::td[1]//input
${approve_ot_plan_page.btn_from_date_calendar}               xpath=//label[. = "From Date"]/../following-sibling::td[1]//button
${approve_ot_plan_page.div_to_date}                          xpath=//label[. = "To Date"]/../following-sibling::td[1]//div[@class = "mx-dateinput"]
${approve_ot_plan_page.txt_to_date}                          xpath=//label[. = "To Date"]/../following-sibling::td//input
${approve_ot_plan_page.btn_to_date_calendar}                 xpath=//label[. = "To Date"]/../following-sibling::td[1]//button
${approve_ot_plan_page.slc_work_group}                       xpath=//label[. = "Workgroup"]/../following-sibling::td//select
${approve_ot_plan_page.screenshot_file_name}                 Approve-OT-Plan-TEST_NAME-{index}.png

#Additional search bar
${approve_ot_plan_page.div_additional_search_bar}                     xpath=//h2[. = "Addition search bar"]/parent::div
${approve_ot_plan_page.div_additional_search_bar_collapsed}           xpath=//h2[. = "Addition search bar"]/parent::div[contains(@class, "collapsed")]
${approve_ot_plan_page.slc_filter_transaction_type}                   xpath=//label[. = "Filter transaction type"]/following::select[1]
${approve_ot_plan_page.lbl_department_text}                           xpath=//label[. = "Department"]/following::div/p[@class = "form-control-static"]
${approve_ot_plan_page.btn_search_department}                         xpath=//label[. = "Department"]/../parent::td/following-sibling::td[1]/button
${approve_ot_plan_page.btn_clear_department}                          xpath=//label[. = "Department"]/../parent::td/following-sibling::td[2]/button
${approve_ot_plan_page.chk_sub_department}                            xpath=//label[normalize-space(text()) = "Subdept"]/input
${approve_ot_plan_page.txt_employee_id}                               xpath=//label[normalize-space(text()) = "Employee ID"]/following-sibling::input
${approve_ot_plan_page.txt_first_name}                                xpath=//label[normalize-space(text()) = "First name"]/following-sibling::input
${approve_ot_plan_page.txt_last_name}                                 xpath=//label[normalize-space(text()) = "Last name"]/following-sibling::input
${approve_ot_plan_page.slc_day_type}                                  xpath=//label[normalize-space(text()) = "Day Type"]/following-sibling::select
${approve_ot_plan_page.slc_accept_status}                             xpath=//label[normalize-space(text()) = "Accept Status"]/following-sibling::select
${approve_ot_plan_page.btn_search}                                    xpath=//button[text() = "Search"]
${approve_ot_plan_page.btn_clear_search}                              xpath=//button[text() = "Clear"]

#Approve section
${approve_ot_plan_page.btn_approve}                                   xpath=//button[text() = "Approve"]
${approve_ot_plan_page.btn_reject}                                    xpath=//button[text() = "Reject"]
${approve_ot_plan_page.lbl_no_result}                                 xpath=//label[normalize-space(text()) = "No items found"]

#OT plan list section
${approve_ot_plan_page.btn_check_all}                                 xpath=(//span[text() = "ID"]//preceding::tr//span[img])[1]
${approve_ot_plan_page.div_selected_employee_id}                      xpath=//div[contains(@class, "lstCardRegisFilterTrans")]/ul/li[contains(@class, "mx-listview-item")]//span[text() = "employee_id"]
${approve_ot_plan_page.chk_selected_ot_plan}                          xpath=//span[text() = "employee_id"]//ancestor::li//tr[2]//table[contains(@class, "tblOTPlanDesciption")]//label[text() = "date"]//ancestor::tr[1]/td[2]//label[text() = "ot"]//ancestor::tr[1]/td[4]//label[contains(text(), "hour")]//ancestor::tr[1]/td[1]/input[@type = "checkbox"]
${approve_ot_plan_page.lbl_selected_ot_plan_approved}                 xpath=//span[text() = "employee_id"]//ancestor::li//tr[2]//table[contains(@class, "tblOTPlanDesciption")]//label[text() = "date"]//ancestor::tr[1]/td[2]//label[text() = "ot"]//ancestor::tr[1]/td[4]//label[contains(text(), "hour")]//ancestor::tr[1]/td[5]//label[. = "Approved"]
${approve_ot_plan_page.lbl_loading}                                   xpath=//*[contains(@class, "mx-progress")]

*** Keywords ***
Wait Until Loading Disappear
    Run Keyword And Ignore Error            Wait Until Element Is Visible           ${approve_ot_plan_page.lbl_loading}    timeout=3s
    Wait Until Element Is Not Visible       ${approve_ot_plan_page.lbl_loading} 

Input From Date
    [Arguments]     ${date}
    Clear And Input Text When Ready   ${approve_ot_plan_page.txt_from_date}        ${date}
    
Click From Date Calendar Button
    Click Element When Ready          ${approve_ot_plan_page.btn_from_date_calendar}

Input To Date
    [Arguments]     ${date}
    Clear And Input Text When Ready   ${approve_ot_plan_page.txt_to_date}         ${date}
    Press Keys                        ${approve_ot_plan_page.txt_to_date}         TAB

Click To Date Calendar Button
    Click Element When Ready        ${approve_ot_plan_page.btn_to_date_calendar}  

#Additional search bar
Select Work Group 
    [Arguments]        ${work_group}
    Select From List By Label        ${approve_ot_plan_page.slc_work_group}        ${work_group}   

Click Additional Search Bar 
    Click Element When Ready        ${approve_ot_plan_page.div_additional_search_bar} 

Select Filter Transaction Type 
    [Arguments]        ${type}
    Select From List By Label        ${approve_ot_plan_page.slc_filter_transaction_type}     ${type}

Click Search Department Button  
    Click Element When Ready         ${approve_ot_plan_page.btn_search_department}  

Click Clear Department Button
    Click Element When Ready         ${approve_ot_plan_page.btn_clear_department}

Check Sub Department
    Click Element When Ready        ${approve_ot_plan_page.chk_sub_department}    

Input Employee Id 
    [Arguments]           ${employee_id}
    Input Text When Ready            ${approve_ot_plan_page.txt_employee_id}        ${employee_id}

Input First Name 
    [Arguments]            ${first_name}
    Input Text When Ready            ${approve_ot_plan_page.txt_first_name}        ${first_name}

Input Last Name 
    [Arguments]        ${last_name}
    Input Text When Ready            ${approve_ot_plan_page.txt_last_name}    ${last_name}

Select Day Type 
    [Arguments]        ${day_type}
    Select From List By Label        ${approve_ot_plan_page.slc_day_type}    ${day_type}    

Select Accept Status 
    [Arguments]        ${accept_type}
    Select From List By Label        ${approve_ot_plan_page.slc_accept_status}    ${accept_type}

Click Search Button
    Click Element When Ready        ${approve_ot_plan_page.btn_search}  

Click Clear Search Button
    Click Element When Ready        ${approve_ot_plan_page.btn_clear_search} 

Check Department Text 
    [Arguments]        ${text} 
    Element Text Should Be         ${approve_ot_plan_page.lbl_department_text}        ${text}

#Approve section
Click Approve Button 
    Click Element When Ready        ${approve_ot_plan_page.btn_approve}   

Click Reject Button
    Click Element When Ready        ${approve_ot_plan_page.btn_reject}     

Check Search Result Returned 
    Element Should Not Be Visible        ${approve_ot_plan_page.lbl_no_result}      

Check Search Result Returned By Employee ID 
    [Arguments]         ${employee_id}
    ${locator} =        Replace String    ${approve_ot_plan_page.div_selected_employee_id}    employee_id    ${employee_id}
    Wait Until Element Is Visible         ${locator} 

Check Given OT Plan Returned
    [Arguments]        ${employee_id}        ${ot}        ${date}        ${hour}
    ${locator} =        Replace String    ${approve_ot_plan_page.chk_selected_ot_plan}      employee_id     ${employee_id} 
    ${locator} =        Replace String    ${locator}      ot              ${ot} 
    ${locator} =        Replace String    ${locator}      date            ${date} 
    ${locator} =        Replace String    ${locator}      hour            ${hour} 

    ${element} =        Get Element Count    ${locator}
    
    ${element_status}   Run Keyword And Return Status      Should Be True    ${element} > 0
    Run Keyword If      '${element_status}' == 'False'     approve_ot_plan_page.Capture Screenshot

Click Given OT Plan  
    [Arguments]        ${employee_id}        ${ot}        ${date}        ${hour}
    ${locator} =        Replace String    ${approve_ot_plan_page.chk_selected_ot_plan}      employee_id     ${employee_id} 
    ${locator} =        Replace String    ${locator}      ot              ${ot} 
    ${locator} =        Replace String    ${locator}      date            ${date} 
    ${locator} =        Replace String    ${locator}      hour            ${hour}  

    Click Element When Ready    ${locator}   

Check Given OT Plan Approved 
    [Arguments]        ${employee_id}        ${ot}        ${date}        ${hour}
    ${locator} =        Replace String    ${approve_ot_plan_page.lbl_selected_ot_plan_approved}      employee_id     ${employee_id} 
    ${locator} =        Replace String    ${locator}      ot              ${ot} 
    ${locator} =        Replace String    ${locator}      date            ${date} 
    ${locator} =        Replace String    ${locator}      hour            ${hour}  

    Wait Until Element Is Visible        ${locator}

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}                     Replace String    ${approve_ot_plan_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot                     ${screenshot_file_name}

Click Check All
    [Arguments]             ${id}
    ${btn_check_all}                            Replace String    ${approve_ot_plan_page.btn_check_all}                         ID                   ${id}
    Click Element When Ready                    ${btn_check_all}  