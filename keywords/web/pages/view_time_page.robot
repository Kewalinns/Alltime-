*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${view_time_page.btn_addition_search_bar_collapsed}      xpath=//h2[text() = "Addition search bar"]/parent::div[contains(@class, "collapsed")]
${view_time_page.btn_addition_search_bar}                xpath=//h2[text() = "Addition search bar"]
${view_time_page.slc_filter_transaction_type}            xpath=//label[normalize-space(text()) = "Filter type"]/../following-sibling::td/select
${view_time_page.lbl_filter_type_department_txt}         xpath=//label[text() = "Department"]
${view_time_page.lbl_filter_type_department}             xpath=//td/label[text() = "Department"]/../following-sibling::td//label
${view_time_page.btn_search_department}                  xpath=//div[contains(@class, "groupboxSearch ")]//span[contains(@class, "glyphicon-search")]/parent::button
${view_time_page.btn_clear_selected_department}          xpath=//div[contains(@class, "groupboxSearch ")]//span[contains(@class, "glyphicon-remove")]/parent::button
${view_time_page.txt_employee_id}                        xpath=//label[normalize-space(text()) = "Employee ID"]/following-sibling::input
${view_time_page.txt_first_name}                         xpath=//label[normalize-space(text()) = "First name"]/following-sibling::input
${view_time_page.btn_clear}                              xpath=//button[text() = "Clear"]
${view_time_page.btn_search}                             xpath=//button[text() = "Search"]

#List 
${view_time_page.ul_search_result_list}                  xpath=//div[contains(@class, "lstCardRegisFilterTrans")]/ul
${view_time_page.li_search_result_list}                  xpath=//div[contains(@class, "lstCardRegisFilterTrans")]/ul/li[{index}]
${view_time_page.matches_search_result}                  xpath=//div[contains(@class, "lstCardRegisFilterTrans")]/ul/li//span[text() = "{employee_id}"]
${view_time_page.lbl_matches_search_result_name}         xpath=//div[contains(@class, "lstCardRegisFilterTrans")]/ul/li//span[text() = "{employee_id}"]
${view_time_page.matches_search_result_button}           xpath=//div[contains(@class, "lstCardRegisFilterTrans")]/ul/li//span[text() = "{employee_id}"]//ancestor::td/following-sibling::td/span[@role = "button"]

#Calendar
${view_time_page.calendar_work_plan}                     xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]
${view_time_page.calendar_work_plan_month_of_year}       xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//div[contains(@class, "header-toolbar")]//h2
${view_time_page.calendar_previous_month}                xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//div[@class = "fc-button-group"]/button[contains(@class, "corner-left")]
${view_time_page.calendar_next_month}                    xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//div[@class = "fc-button-group"]/button[contains(@class, "corner-right")]
${view_time_page.list_td_for_selected_date}              xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/following-sibling::tbody/tr[1]/td
${view_time_page.span_day_for_select_date}               xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/tr/td[{index}]/span
${view_time_page.td_rowspan_tr_1_for_selected_date}      xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/following-sibling::tbody/tr[1]/td[{index}]
${view_time_page.a_tr_1_for_selected_date_holiday}       xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/following-sibling::tbody/tr[1]/td[{index}]//a[contains(@style, "color:ORANGE")]
${view_time_page.a_tr_1_for_selected_date_weekend}       xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/following-sibling::tbody/tr[1]/td[{index}]//a[contains(@style, "color:SLATEBLUE")]
${view_time_page.span_tr_1_for_selected_date}            xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/following-sibling::tbody/tr[1]/td[{index}]//span[@class = "fc-title"]
${view_time_page.span_tr_2_for_selected_date}            xpath=//ul/li[@class = "active"]/a[text() = "Work Plan"]/ancestor::div[contains(@class, "tabCalendar")]//div[contains(@class, "active")]//div[contains(@class, "calendar")]//thead//td[@data-date = "{date}"]/../parent::thead/following-sibling::tbody/tr[2]/td[{index}]//span[@class = "fc-title"]
${view_time_page.screenshot_file_name}                   View-Time-TEST_NAME-{index}.png

*** Keywords ***
Click Addition Search Bar
    Click Element When Ready            ${view_time_page.btn_addition_search_bar}

Check Addition Search Bar Is Collapsed   
    Element Should Be Visible           ${view_time_page.btn_addition_search_bar_collapsed}   

Click Search Department Button
    Click Element When Ready            ${view_time_page.btn_search_department} 

Check Department Text 
    [Arguments]     ${text}
    Element Text Should Be              ${view_time_page.lbl_filter_type_department}         ${text}       

Click Clear Department Button 
    Click Element When Ready            ${view_time_page.btn_clear_selected_department}

Input Employee Id 
    [Arguments]     ${employee_id}
    Input Text When Ready               ${view_time_page.txt_employee_id}        ${employee_id}

Input First Name 
    [Arguments]     ${first_name}
    Input Text When Ready               ${view_time_page.txt_first_name}     ${first_name}

Click Search Button 
    Click Element When Ready            ${view_time_page.btn_search} 

Click Clear Button 
    Click Element When Ready            ${view_time_page.btn_clear}   

Check Search Result By Employee ID 
    [Arguments]    ${employee_id}
    ${locator} =        Replace String    ${view_time_page.matches_search_result}    {employee_id}    ${employee_id}

    Wait Until Element Is Visible        ${locator}

Click Chevron Button For Selected Employee ID 
    [Arguments]    ${employee_id}
    ${locator} =        Replace String    ${view_time_page.matches_search_result_button}    {employee_id}    ${employee_id}

    Click Element When Ready             ${locator}       

Check Calendar Month Of Year 
    [Arguments]         ${value}
    Element Text Should Be    ${view_time_page.calendar_work_plan_month_of_year}     ${value}    ignore_case=True

Click Provious Month Button 
    Click Element When Ready            ${view_time_page.calendar_previous_month}

Click Next Month Button 
    Click Element When Ready            ${view_time_page.calendar_next_month}  

Get Calendar Month Of Year  
    [Documentation]    Gets the month of the year as shown on the current calendar view (February 2021)
    ${month_of_year} =        Get Element Text When Ready     ${view_time_page.calendar_work_plan_month_of_year}

    [Return]    ${month_of_year}

Get Column Count 
    [Documentation]     Counts how many <td>s there are for the <tr> which contains selected date
    [Arguments]       ${date}
    ${locator} =        Replace String    ${view_time_page.list_td_for_selected_date}    {date}    ${date}
    ${td_count} =        Get Element Count     ${locator}
    [Return]        ${td_count}

Get Column Text
    [Documentation]    Gets the text which will return day shown on the top row <thead> for selected date
    [Arguments]          ${date}        ${index}
    ${i} =               Convert To String    ${index}
    ${locator} =        Replace String    ${view_time_page.span_day_for_select_date}    {index}    ${i}
    ${locator} =        Replace String    ${locator}    {date}    ${date}
    ${text} =           Get Element Text When Ready   ${locator}
    [Return]    ${text}

Check Holiday 
    [Documentation]    Checks if selected date is a holiday
    [Arguments]          ${date}        ${index}
    ${i} =               Convert To String    ${index}
    ${locator} =        Replace String    ${view_time_page.a_tr_1_for_selected_date_holiday}    {index}    ${i}
    ${locator} =        Replace String    ${locator}    {date}    ${date}

    Page Should Contain Element    ${locator}

Check Weekend 
    [Documentation]    Checks if selected date is a weekend
    [Arguments]          ${date}        ${index}
    ${i} =               Convert To String    ${index}
    ${locator} =        Replace String    ${view_time_page.a_tr_1_for_selected_date_weekend}    {index}    ${i}
    ${locator} =        Replace String    ${locator}    {date}    ${date}

    Page Should Contain Element    ${locator}    

Check Rowspan For Selected Index
    [Documentation]    Checks if the selected <td> has attribute rowspan; returns 1 in case it has rowspan otherwise 0
    ...                rowspan only shows on the first <tr> of the <tbody>
    [Arguments]       ${date}        ${index}
    ${i} =               Convert To String    ${index}
    ${locator} =        Replace String    ${view_time_page.td_rowspan_tr_1_for_selected_date}    {index}    ${i}
    ${locator} =        Replace String    ${locator}    {date}    ${date}

    ${rowspan} =        Get Element Attribute    ${locator}        rowspan
    ${rowspan} =        Set Variable If    '${rowspan}' == 'None'    0
    ...                 '${rowspan}' == '2'    1
    [Return]    ${rowspan}

Check Time And Status For In Work
    [Documentation]    Checks if the time and status for in work are shown correctly on the selected column
    [Arguments]        ${date}    ${index}    ${value}
    ${i} =               Convert To String    ${index}
    ${locator} =        Replace String    ${view_time_page.span_tr_1_for_selected_date}    {index}    ${i}
    ${locator} =        Replace String    ${locator}    {date}    ${date}
    
    Element Text Should Be    ${locator}    ${value}    ignore_case=True

Check Time And Status For Out Work
    [Documentation]    Checks if the time and status for out work are shown correctly on the selected column
    [Arguments]        ${date}    ${index}    ${value}
    ${i} =               Convert To String    ${index}
    ${locator} =        Replace String    ${view_time_page.span_tr_2_for_selected_date}    {index}    ${i}
    ${locator} =        Replace String    ${locator}    {date}    ${date}

    Element Text Should Be    ${locator}    ${value}    ignore_case=True    

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}             Replace String    ${view_time_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot             ${screenshot_file_name}