*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${approve_time_sheet_page.txt_date}                               xpath=//label[text() = "Date"]/parent::td/following-sibling::td//input
${approve_time_sheet_page.btn_calendar_button}                    xpath=//label[text() = "Date"]/parent::td/following-sibling::td//button
${approve_time_sheet_page.screenshot_file_name}                   Approve-Time-Sheet-TEST_NAME-{index}.png

#Additional search bar
${approve_time_sheet_page.btn_addition_search_bar_collapsed}      xpath=//h2[text() = "Addition search bar"]/parent::div[contains(@class, "collapsed")]
${approve_time_sheet_page.btn_addition_search_bar}                xpath=//h2[text() = "Addition search bar"]
${approve_time_sheet_page.slc_filter_transaction_type}            xpath=//label[normalize-space(text()) = "Filter transaction type"]/following-sibling::select
${approve_time_sheet_page.lbl_filter_type_department_txt}         xpath=//label[text() = "Department"]
${approve_time_sheet_page.lbl_filter_type_department}             xpath=//div/label[text() = "Department"]/following-sibling::div/p
${approve_time_sheet_page.btn_search_department}                  xpath=//table[contains(@class, "tblFilterTransactionSearch")]//span[contains(@class, "glyphicon-search")]/parent::button
${approve_time_sheet_page.btn_clear_selected_department}          xpath=//table[contains(@class, "tblFilterTransactionSearch")]//span[contains(@class, "glyphicon-remove")]/parent::button
${approve_time_sheet_page.lbl_filter_type_sub_department}         xpath=//label[normalize-space(text()) = "Subdept"]
${approve_time_sheet_page.chk_filter_type_sub_department}         xpath=//label[normalize-space(text()) = "Subdept"]/input[@type = "checkbox"]
${approve_time_sheet_page.lbl_filter_type_position_txt}           xpath=//label[normalize-space(text()) = "Position"]
${approve_time_sheet_page.slc_filter_type_position}               xpath=//label[normalize-space(text()) = "Position"]/following-sibling::div//select
${approve_time_sheet_page.lbl_filter_type_sub_position}           xpath=//label[normalize-space(text()) = "sub position"]
${approve_time_sheet_page.chk_filter_type_sub_position}           xpath=//label[normalize-space(text()) = "sub position"]/input[@type = "checkbox"]
${approve_time_sheet_page.lbl_filter_type_employee_group_txt}     xpath=//label[normalize-space(text()) = "Manage group emp"]
${approve_time_sheet_page.slc_filter_type_employee_group}         xpath=//label[normalize-space(text()) = "Manage group emp"]/following-sibling::div//select
${approve_time_sheet_page.txt_employee_id}                        xpath=//label[normalize-space(text()) = "Employee ID"]/following-sibling::input
${approve_time_sheet_page.txt_first_name}                         xpath=//label[normalize-space(text()) = "First name"]/following-sibling::input
${approve_time_sheet_page.txt_last_name}                          xpath=//label[normalize-space(text()) = "Last name"]/following-sibling::input
${approve_time_sheet_page.slc_day_type}                           xpath=//label[normalize-space(text()) = "Day Type"]/following-sibling::select
${approve_time_sheet_page.slc_approve_status}                     xpath=//label[normalize-space(text()) = "Approve status"]/following-sibling::select
${approve_time_sheet_page.slc_payable_status}                     xpath=//label[normalize-space(text()) = "Payable status"]/following-sibling::select
${approve_time_sheet_page.btn_clear}                              xpath=//button[text() = "Clear"]
${approve_time_sheet_page.btn_search}                             xpath=//button[text() = "Search"]
${approve_time_sheet_page.btn_approve}                            xpath=//button[text() = "Approve"]
${approve_time_sheet_page.btn_pending}                            xpath=//button[text() = "Pending"]
${approve_time_sheet_page.btn_re-process}                         xpath=//button[text() = "Re-Process"]
${approve_time_sheet_page.btn_load_more}                          xpath=//button[text() = "Load more..."]
${approve_time_sheet_page.lbl_loading}                            xpath=//*[contains(@class, "mx-progress")]

#List 
${approve_time_sheet_page.ul_re_process_list}                     xpath=//div[contains(@class, "approvetimesheet-list")]/div/div/div/ul
${approve_time_sheet_page.li_re_processe_list}                    xpath=//div[contains(@class, "approvetimesheet-list")]/div/div/div/ul/li[{index}]
# ${approve_time_sheet_page.chk_re_process}                         xpath=//div[contains(@class, "approvetimesheet-list")]/div/div/div/ul/li//div[contains(text(), "{name}")]/span[text() = "{employee_id}"]//ancestor::table[contains(@class, "tblInfoCardRegis")]//td//input[@type = "checkbox"]
${approve_time_sheet_page.chk_re_process}                         xpath=//div[contains(@class, "approvetimesheet-list")]/div/div/div/ul/li//span[text() = "{employee_id}"]//ancestor::table[contains(@class, "tblInfoCardRegis")]//td//input[@type = "checkbox"]
${approve_time_sheet_page.icon_checked}                           xpath=//span[text() = "{employee_id}"]//ancestor::table[contains(@class, "tblInfoCardRegis")]//img[contains(@src, "icon_check")]/parent::div/../parent::td//following-sibling::td/span[text() = "Timesheet"]
${approve_time_sheet_page.icon_unchecked}                         xpath=//span[text() = "{employee_id}"]//ancestor::table[contains(@class, "tblInfoCardRegis")]//img[contains(@src, "icon_uncheck")]/parent::div/../parent::td//following-sibling::td/span[text() = "Timesheet"]

*** Keywords ***
Wait Until Loading Disappear
    Run Keyword And Ignore Error            Wait Until Element Is Visible           ${approve_time_sheet_page.lbl_loading}       timeout=5s
    Wait Until Element Is Not Visible       ${approve_time_sheet_page.lbl_loading}    

Input Date 
    [Arguments]    ${date}
    Clear And Input Text When Ready     ${approve_time_sheet_page.txt_date}        ${date}
    Press Keys                          ${approve_time_sheet_page.txt_date}        TAB

Click Addition Search Bar
    Click Element When Ready            ${approve_time_sheet_page.btn_addition_search_bar}

Check Addition Search Bar Is Collapsed   
    Element Should Be Visible           ${approve_time_sheet_page.btn_addition_search_bar_collapsed}   

Select Filter Transaction Type 
    [Arguments]     ${transaction_type}
    Select From List By Label           ${approve_time_sheet_page.slc_filter_transaction_type}        ${transaction_type}

Click Search Department Button
    Wait Until Progress Popup Disappear
    Click Element When Ready            ${approve_time_sheet_page.btn_search_department} 

Check Department Text 
    [Arguments]     ${text}
    Element Text Should Be              ${approve_time_sheet_page.lbl_filter_type_department}         ${text}       

Click Clear Department Button 
    Click Element When Ready            ${approve_time_sheet_page.btn_clear_selected_department}

Check Sub Department 
    Click Element When Ready            ${approve_time_sheet_page.chk_filter_type_sub_department}

Select Position 
    [Arguments]        ${position}
    Select From List By Label           ${approve_time_sheet_page.slc_filter_type_position}       ${position}

Check Sub Position 
    Click Element When Ready            ${approve_time_sheet_page.chk_filter_type_sub_position}    

Select Employee Group 
    [Arguments]        ${employee_group}
    Select From List By Label            ${approve_time_sheet_page.slc_filter_type_employee_group}        ${employee_group}

Input Employee Id 
    [Arguments]     ${employee_id}
    Input Text When Ready               ${approve_time_sheet_page.txt_employee_id}        ${employee_id}

Input First Name 
    [Arguments]     ${first_name}
    Input Text When Ready               ${approve_time_sheet_page.txt_first_name}     ${first_name}

Input Last Name 
    [Arguments]     ${last_name}
    Input Text When Ready               ${approve_time_sheet_page.txt_last_name}      ${last_name}

Select Day Type  
    [Arguments]     ${day_type}
    Select From List By Label           ${approve_time_sheet_page.slc_day_type}       ${day_type}

Select Approve Status 
    [Arguments]     ${approve_status}
    Select From List By Label           ${approve_time_sheet_page.slc_approve_status}        ${approve_status}

Select Payable Status 
    [Arguments]     ${payable_status}
    Select From List By Label            ${approve_time_sheet_page.slc_payable_status}        ${payable_status}

Click Search Button 
    Click Element When Ready            ${approve_time_sheet_page.btn_search} 

Click Clear Button 
    Click Element When Ready            ${approve_time_sheet_page.btn_clear}    

Click Load More Button 
    Click Element When Ready            ${approve_time_sheet_page.btn_load_more} 

Check Load More Button Is Visible 
    Element Should Be Visible           ${approve_time_sheet_page.btn_load_more} 

Check Load More Button Is Not Visible
    Element Should Not Be Visible           ${approve_time_sheet_page.btn_load_more}   

Click Approve Button
    Click Element When Ready            ${approve_time_sheet_page.btn_approve} 

Click Pending Button
    Click Element When Ready            ${approve_time_sheet_page.btn_pending}   

Click Re Process Button
    Click Element When Ready            ${approve_time_sheet_page.btn_re-process}     

Click Re Process Time Sheet Checkbox 
    [Arguments]    ${name}        ${employee_id}
    # ${locator} =        Replace String        ${approve_time_sheet_page.chk_re_process}       {name}                 ${name}
    ${locator} =        Replace String        ${approve_time_sheet_page.chk_re_process}       {employee_id}          ${employee_id}

    Sleep    2s    reason=Fixed flaky test

    Click Element When Ready                  ${locator}                         

Check Re Process Time Sheet Is Checked 
    [Arguments]    ${employee_id}

    ${locator} =        Replace String        ${approve_time_sheet_page.icon_checked}       {employee_id}                 ${employee_id}

    Wait Until Element Is Visible    ${locator}

Check Re Process Time Sheet Is Not Checked
    [Arguments]    ${employee_id}

    ${locator} =        Replace String        ${approve_time_sheet_page.icon_unchecked}       {employee_id}                 ${employee_id}

    Wait Until Element Is Visible    ${locator}

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}                     Replace String    ${approve_time_sheet_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot                     ${screenshot_file_name}