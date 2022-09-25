*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${time_request_by_manager_page.tab_time_request_selected}                           xpath=//li[@class="active"]/a[normalize-space(text()) = "Time Request"]
${time_request_by_manager_page.tab_time_request}                                    xpath=//li[@class=""]/a[normalize-space(text()) = "Time Request"]
${time_request_by_manager_page.tab_history_selected}                                xpath=//li[@class="active"]/a[text() = "History"]
${time_request_by_manager_page.tab_history}                                         xpath=//li[@class=""]/a[text() = "History"]

${time_request_by_manager_page.lbl_loading}                                         xpath=//*[contains(@class, "mx-progress")]

#Time Request
${time_request_by_manager_page.time_request.btn_addition_search_bar_collapsed}      xpath=//h2[text() = "Addition search bar"]/parent::div[contains(@class, "collapsed")]
${time_request_by_manager_page.time_request.btn_addition_search_bar}                xpath=//h2[text() = "Addition search bar"]/parent::div
${time_request_by_manager_page.time_request.slc_filter_type}                        xpath=//select[contains(@class, "mx-name-dropDown1")]
${time_request_by_manager_page.time_request.lbl_filter_type_department_txt}         xpath=//label[@class = "mx-name-label1"][text() = "Department"]
${time_request_by_manager_page.time_request.lbl_filter_type_department}             xpath=//label[@class = "mx-name-label1"][text() = "Department"]/following::div[@class = "mx-textarea"]
${time_request_by_manager_page.time_request.btn_search_department}                  xpath=//button[contains(@class, "mx-name-actionButton10")]
${time_request_by_manager_page.time_request.btn_clear_selected_department}          xpath=//button[contains(@class, "mx-name-actionButton11")]
${time_request_by_manager_page.time_request.lbl_filter_type_sub_department}         xpath=//label[contains(@class, "mx-name-label4")][normalize-space(text()) = "Sub dept."]
${time_request_by_manager_page.time_request.chk_filter_type_sub_department}         xpath=//input[@class = "mx-name-checkBox1"]
${time_request_by_manager_page.time_request.lbl_filter_type_position_txt}           xpath=//label[@class = "mx-name-label5"][text() = "Position"]
${time_request_by_manager_page.time_request.slc_filter_type_position}               xpath=//div[contains(@class, "mx-name-referenceSelector5")]//select[@class = "form-control"]
${time_request_by_manager_page.time_request.lbl_filter_type_sub_position}           xpath=//label[contains(@class, "mx-name-label6")][normalize-space(text()) = "Sub position"]
${time_request_by_manager_page.time_request.chk_filter_type_sub_position}           xpath=//input[@class = "mx-name-checkBox3"]
${time_request_by_manager_page.time_request.lbl_filter_type_employee_group_txt}     xpath=//label[@class = "mx-name-label7"][normalize-space(text()) = "Employee Group"]
${time_request_by_manager_page.time_request.slc_filter_type_employee_group}         xpath=//div[contains(@class, "mx-name-referenceSelector4")]//select[@class = "form-control"]
${time_request_by_manager_page.time_request.txt_employee_id}                        xpath=//div[contains(@class, "mx-name-dataView2")]//div[contains(@class, "mx-name-textBox1")]//input
${time_request_by_manager_page.time_request.txt_first_name}                         xpath=//div[contains(@class, "mx-name-dataView2")]//div[contains(@class, "mx-name-textBox3")]//input
${time_request_by_manager_page.time_request.txt_last_name}                          xpath=//div[contains(@class, "mx-name-dataView2")]//div[contains(@class, "mx-name-textBox4")]//input
${time_request_by_manager_page.time_request.slc_day_type}                           xpath=//div[contains(@class, "mx-name-dataView2")]//div[contains(@class, "mx-name-dropDown5")]//select
${time_request_by_manager_page.time_request.btn_clear}                              xpath=//button[contains(@class, "mx-name-actionButton8")]
${time_request_by_manager_page.time_request.btn_search}                             xpath=//button[contains(@class, "mx-name-actionButton7")]
${time_request_by_manager_page.time_request.li_search_result}                       xpath=//div[contains(@class, "mx-name-listView12")]/ul/li
${time_request_by_manager_page.time_request.li_chevron_icon}                        xpath=//div[contains(@class, "mx-name-listView12")]/ul/li//span[a]
${time_request_by_manager_page.time_request.btn_load_more}                          xpath=//button[normalize-space(text()) = "Load more..."]
${time_request_by_manager_page.time_request.lbl_empty_search}                       xpath=//li[@class = "mx-listview-empty"]/label[normalize-space(text()) = "No items found"]

#Adjust Time
${time_request_by_manager_page.time_request.adjust_time.selected_employee_name}         xpath=//div[contains(@class, "mx-name-textArea1")]//label
${time_request_by_manager_page.time_request.adjust_time.txt_date}                       xpath=//input[contains(@class, "mx-dateinput-input")]
${time_request_by_manager_page.time_request.adjust_time.btn_select_date}                xpath=//button[contains(@class, "mx-dateinput-select-button")]
${time_request_by_manager_page.time_request.adjust_time.div_calendar}                   xpath=//div[@id='dijit_Calendar_0']
${time_request_by_manager_page.time_request.adjust_time.div_calendar_selected_date}     xpath=//div[@id='dijit_Calendar_0']//td[contains(@class, "dijitCalendarSelectedDate")]
${time_request_by_manager_page.time_request.adjust_time.div_validation_msg}             xpath=//div[contains(@class, "mx-validation-message")]
${time_request_by_manager_page.time_request.adjust_time.lbl_work_date_validation_message_1}       xpath=//div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Workdate must less than or equal current date."]
${time_request_by_manager_page.time_request.adjust_time.lbl_work_date_validation_message_2}       xpath=//div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Workdate is required."]
${time_request_by_manager_page.time_request.adjust_time.lbl_work_date_validation_message_3}       xpath=//div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Invalid date"]
${time_request_by_manager_page.time_request.adjust_time.lbl_work_date_validation_message_4}       xpath=//div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Please select workdate first."]
${time_request_by_manager_page.time_request.adjust_time.div_shift_time}                 xpath=//div[contains(@class, "mx-name-customString2")]
${time_request_by_manager_page.time_request.adjust_time.chk_in_work_point}              xpath=//input[@class = "mx-name-checkBox3"]
${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_date}         xpath=//div[contains(@class, "mx-name-datePicker6")]//input[contains(@class, "mx-dateinput-input")]
${time_request_by_manager_page.time_request.adjust_time.btn_select_in_work_point_date}         xpath=//div[contains(@class, "mx-name-datePicker6")]//button[contains(@class, "mx-dateinput-select-button")]
${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_time}         xpath=//div[contains(@class, "mx-name-datePicker17")]//input[contains(@class, "mx-dateinput-input")]
${time_request_by_manager_page.time_request.adjust_time.lbl_in_work_point_date_validation_message_1}         xpath=//div[contains(@class, "mx-name-datePicker6")]/div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Invalid date"]
${time_request_by_manager_page.time_request.adjust_time.lbl_in_work_point_time_validation_message_1}         xpath=//div[contains(@class, "mx-name-datePicker17")]/div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Invalid date"]
${time_request_by_manager_page.time_request.adjust_time.div_calendar_in_work_point}                   xpath=//div[@id='dijit_Calendar_1']
${time_request_by_manager_page.time_request.adjust_time.div_calendar_in_work_point_selected_date}     xpath=//div[@id='dijit_Calendar_1']//td[contains(@class, "dijitCalendarSelectedDate")]
${time_request_by_manager_page.time_request.adjust_time.chk_out_work_point}             xpath=//input[@class = "mx-name-checkBox2"]
${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_date}        xpath=//div[contains(@class, "mx-name-datePicker5")]//input[contains(@class, "mx-dateinput-input")]
${time_request_by_manager_page.time_request.adjust_time.btn_select_out_work_point_date}        xpath=//div[contains(@class, "mx-name-datePicker5")]//button[contains(@class, "mx-dateinput-select-button")]
${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_time}        xpath=//div[contains(@class, "mx-name-datePicker18")]//input[contains(@class, "mx-dateinput-input")]
${time_request_by_manager_page.time_request.adjust_time.lbl_out_work_point_date_validation_message_1}         xpath=//div[contains(@class, "mx-name-datePicker5")]/div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Invalid date"]
${time_request_by_manager_page.time_request.adjust_time.lbl_out_work_point_time_validation_message_1}         xpath=//div[contains(@class, "mx-name-datePicker18")]/div[contains(@class, "mx-validation-message")][normalize-space(text()) = "Invalid date"]
${time_request_by_manager_page.time_request.adjust_time.div_calendar_out_work_point}                   xpath=//div[@id='dijit_Calendar_2']
${time_request_by_manager_page.time_request.adjust_time.div_calendar_out_work_point_selected_date}     xpath=//div[@id='dijit_Calendar_2']//td[contains(@class, "dijitCalendarSelectedDate")]
${time_request_by_manager_page.time_request.adjust_time.slc_reason_for_adjust}          xpath=//div[@class = "mx-referenceselector"]//select
${time_request_by_manager_page.time_request.adjust_time.txt_remark}                     xpath=//div[contains(@class, "mx-name-textArea2")]/textarea
${time_request_by_manager_page.time_request.adjust_time.btn_save}                       xpath=//button[contains(@class, "mx-name-actionButton3")]
${time_request_by_manager_page.time_request.adjust_time.btn_continue}                   xpath=//button[text() = "Continue" ]

#History
${time_request_by_manager_page.history.search_bar_collapsed}            xpath=//h2[normalize-space(text()) = "Search bar"]/parent::div[contains(@class, "collapsed")]
${time_request_by_manager_page.history.search_bar}                      xpath=//h2[normalize-space(text()) = "Search bar"]/parent::div
${time_request_by_manager_page.history.txt_search_date}                 xpath=//div[contains(@class, "mx-name-datePicker5")]//input[contains(@class, "mx-dateinput-input")]
${time_request_by_manager_page.history.btn_calendar_search_date}        xpath=//div[contains(@class, "mx-name-datePicker5")]//button[contains(@class, "mx-dateinput-select-button")]
${time_request_by_manager_page.history.txt_search_employee_Id}          xpath=//table[contains(@class, "mx-name-table10")]//div[contains(@class, "mx-name-textBox1")]/input
${time_request_by_manager_page.history.txt_search_first_name}           xpath=//table[contains(@class, "mx-name-table10")]//div[contains(@class, "mx-name-textBox3")]//input
${time_request_by_manager_page.history.txt_search_last_name}            xpath=//table[contains(@class, "mx-name-table10")]//div[contains(@class, "mx-name-textBox8")]//input
${time_request_by_manager_page.history.slc_search_reason_for_adjust}    xpath=//table[contains(@class, "mx-name-table10")]//div[contains(@class, "mx-name-referenceSelector2")]//select
${time_request_by_manager_page.history.slc_search_approve_status}       xpath=//table[contains(@class, "mx-name-table10")]//div[contains(@class, "mx-name-dropDown8")]/select
${time_request_by_manager_page.history.btn_clear}                       xpath=//button[contains(@class, "mx-name-actionButton4")]
${time_request_by_manager_page.history.btn_search}                      xpath=//button[contains(@class, "mx-name-actionButton3")]
${time_request_by_manager_page.screenshot_file_name}                    Time-Request-TEST_NAME-{index}.png

*** Keywords ***
Wait Until Loading Disappear
    Run Keyword And Ignore Error            Wait Until Element Is Visible           ${time_request_by_manager_page.lbl_loading}    timeout=3s
    Wait Until Element Is Not Visible       ${time_request_by_manager_page.lbl_loading}
    
Check Time Request Tab Is Selected 
    Element Should Be Visible           ${time_request_by_manager_page.tab_time_request_selected}

Check History Tab Is Selected
    Element Should Be Visible           ${time_request_by_manager_page.tab_history_selected}  

Click Time Request Tab 
    Click Element When Ready            ${time_request_by_manager_page.tab_time_request} 

Click History Tab 
    Click Element When Ready            ${time_request_by_manager_page.tab_history} 

Click Addition Search Bar
    Click Element When Ready            ${time_request_by_manager_page.time_request.btn_addition_search_bar}

Check Addition Search Bar Is Collapsed   
    Element Should Be Visible           ${time_request_by_manager_page.time_request.btn_addition_search_bar_collapsed}     

Select Filter Type 
    [Arguments]     ${filter_type}
    Select From List By Label           ${time_request_by_manager_page.time_request.slc_filter_type}        ${filter_type}

Click Search Department Button
    Click Element When Ready            ${time_request_by_manager_page.time_request.btn_search_department} 

Click Clear Department Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.btn_clear_selected_department}

Check Sub Department 
    Click Element When Ready            ${time_request_by_manager_page.time_request.chk_filter_type_sub_department}

Check Sub Department Is Checked
    ${element} =     execute javascript      return window.getComputedStyle(document.querySelector('#mxui_widget_BoolSelect_0'),':after').getPropertyValue('border')
    Should Be True     '${element}' == '1px solid rgb(19, 85, 146)'   

Select Position 
    [Arguments]        ${position}
    Select From List By Label           ${time_request_by_manager_page.time_request.slc_filter_type_position}       ${position}

Check Sub Position 
    Click Element When Ready            ${time_request_by_manager_page.time_request.chk_filter_type_sub_position}    

Check Sub Position Is Checked
    ${element} =     execute javascript      return window.getComputedStyle(document.querySelector('#mxui_widget_BoolSelect_1'),':after').getPropertyValue('border')
    Should Be True     '${element}' == '1px solid rgb(19, 85, 146)'   

Select Employee Group 
    [Arguments]    ${employee_group}
    Select From List By Label            ${time_request_by_manager_page.time_request.slc_filter_type_employee_group}           ${employee_group}       

Input Search Employee Id 
    [Arguments]     ${employee_id}
    Input Text When Ready               ${time_request_by_manager_page.time_request.txt_employee_id}        ${employee_id}

Input Search First Name 
    [Arguments]     ${first_name}
    Input Text When Ready               ${time_request_by_manager_page.time_request.txt_first_name}     ${first_name}

Input Search Last Name 
    [Arguments]     ${last_name}
    Input Text When Ready               ${time_request_by_manager_page.time_request.txt_last_name}      ${last_name}

Select Search Day Type  
    [Arguments]     ${day_type}
    Select From List By Label           ${time_request_by_manager_page.time_request.slc_day_type}       ${day_type}
    
Click Search Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.btn_search} 

Click Clear Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.btn_clear}    

Click Load More Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.btn_load_more} 

Check Load More Button Is Visible 
    Element Should Be Visible           ${time_request_by_manager_page.time_request.btn_load_more} 

Check Load More Button Is Not Visible
    Element Should Not Be Visible       ${time_request_by_manager_page.time_request.btn_load_more}   

Check Department Text 
    [Arguments]     ${text}
    Wait Until Element Contains         ${time_request_by_manager_page.time_request.lbl_filter_type_department}         ${text} 

Click Selected Employee Id From List 
    [Arguments]     ${employee_id}
    Click Element When Ready        xpath=//span[text() = "${employee_id}"]/ancestor::tr//span[@role = "button"]             

#List
Check Search Result Returned 
    ${elements} =       Get Element Count  ${time_request_by_manager_page.time_request.li_search_result}
    Should Be True      ${elements} > 0

Click Result Chevron icon
    Click Element When Ready            ${time_request_by_manager_page.time_request.li_chevron_icon}

#Adjust Time   
Check Selected Employee Name
    [Arguments]     ${displayed_name}
    Element Text Should Be              ${time_request_by_manager_page.time_request.adjust_time.selected_employee_name}     ${displayed_name}

Input Work Date 
    [Arguments]     ${date}
    Input Text When Ready               ${time_request_by_manager_page.time_request.adjust_time.txt_date}       ${date}
    Press Keys                          ${time_request_by_manager_page.time_request.adjust_time.txt_date}       TAB  

Click Work Date Calendar Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.btn_select_date}

Check Work Date Calendar Is Shown 
    Element Should Be Visible           ${time_request_by_manager_page.time_request.adjust_time.div_calendar} 

Click Selected Work Date Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.div_calendar_selected_date}

Check In Work Point 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.chk_in_work_point}

Input In Work Point Date
    [Arguments]     ${date}
    Clear And Input Text When Ready     ${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_date}     ${date}  

Check In Work Point Calendar Is Shown 
    Element Should Be Visible           ${time_request_by_manager_page.time_request.adjust_time.div_calendar_in_work_point} 

Click Selected In Work Point Date Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.div_calendar_in_work_point_selected_date}

Click In Work Point Calendar Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.btn_select_in_work_point_date} 

Input In Work Point Time 
    [Arguments]     ${time}
    Clear And Input Text When Ready     ${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_time}     ${time} 
    # Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_time}
    # Clear Text                          ${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_time}
    # Input Text When Ready               ${time_request_by_manager_page.time_request.adjust_time.txt_in_work_point_time}     ${time} 

Check Out Work Point 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.chk_out_work_point}

Input Out Work Point Date
    [Arguments]     ${date}
    Clear And Input Text When Ready     ${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_date}     ${date} 

Click Out Work Point Calendar Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.btn_select_out_work_point_date} 

Check Out Work Point Calendar Is Shown 
    Element Should Be Visible           ${time_request_by_manager_page.time_request.adjust_time.div_calendar_out_work_point} 

Click Selected Out Work Point Date Button 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.div_calendar_out_work_point_selected_date}    

Input Out Work Point Time 
    [Arguments]     ${time}
    Clear And Input Text When Ready     ${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_time}     ${time} 
    # Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_time}
    # Clear Text                          ${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_time}
    # Input Text When Ready               ${time_request_by_manager_page.time_request.adjust_time.txt_out_work_point_time}     ${time} 

Select Reason For Adjust 
    [Arguments]     ${reason}
    Select From List By Label           ${time_request_by_manager_page.time_request.adjust_time.slc_reason_for_adjust}      ${reason}

Input Adjust Remark 
    [Arguments]     ${remark}
    Input Text When Ready               ${time_request_by_manager_page.time_request.adjust_time.txt_remark}     ${remark}

Click Save Adjust Time 
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.btn_save}     

Click Continue Warning Alert
    Click Element When Ready            ${time_request_by_manager_page.time_request.adjust_time.btn_continue}

#History
Check History Searh Bar Is Collapsed 
    Element Should Be Visible           ${time_request_by_manager_page.history.search_bar_collapsed}

Click History Search Bar 
    Click Element When Ready            ${time_request_by_manager_page.history.search_bar}    

Input History Search Date 
    [Arguments]     ${date}
    Input Text When Ready               ${time_request_by_manager_page.history.txt_search_date}     ${date}

Click History Search Date Calendar    
    Click Element When Ready            ${time_request_by_manager_page.history.btn_calendar_search_date} 

Input History Search Employee ID 
    [Arguments]     ${employee_id}
    Input Text When Ready               ${time_request_by_manager_page.history.txt_search_employee_Id}      ${employee_id} 

Input History Search First Name    
    [Arguments]     ${first_name}
    Input Text When Ready               ${time_request_by_manager_page.history.txt_search_first_name}       ${first_name} 

Input History Search Last Name 
    [Arguments]     ${last_name}
    Input Text When Ready               ${time_request_by_manager_page.history.txt_search_last_name}        ${last_name}

Select History Search Reason For Adjust    
    [Arguments]     ${reason}
    Select From List By Label           ${time_request_by_manager_page.history.slc_search_reason_for_adjust}        ${reason} 

Select History Search Approve Status 
    [Arguments]     ${approve_status}
    Select From List By Label           ${time_request_by_manager_page.history.slc_search_approve_status}       ${approve_status} 

Click Clear History Search Button    
    Click Element When Ready            ${time_request_by_manager_page.history.btn_clear} 

Click Search History Button 
    Click Element When Ready            ${time_request_by_manager_page.history.btn_search}    

Capture Screenshot
    [Documentation]    Capture page screenshot
    ${screenshot_file_name}             Replace String    ${time_request_by_manager_page.screenshot_file_name}                  TEST_NAME            ${TEST NAME}
    Capture Page Screenshot             ${screenshot_file_name}