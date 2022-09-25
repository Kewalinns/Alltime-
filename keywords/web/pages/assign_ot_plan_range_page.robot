*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${assign_ot_plan_range_page.txt_search_from_date}                    xpath=(//div[contains(@class,'dtpFilter')]//input)[1]
${assign_ot_plan_range_page.txt_search_to_date}                      xpath=(//div[contains(@class,'dtpFilter')]//input)[2]
${assign_ot_plan_range_page.slc_search_workgroup}                    xpath=//div[contains(@class,'Selector3')]//select
${assign_ot_plan_range_page.slc_search_ot}                           xpath=//div[contains(@class,'Selector8')]//select
${assign_ot_plan_range_page.btn_search_search}                       xpath=//div[contains(@class,'groupBox4')]//button[text()='Search']
${assign_ot_plan_range_page.slc_hours}                               xpath=//div[contains(@class,'Selector5')]//select
${assign_ot_plan_range_page.slc_minutes}                             xpath=//div[contains(@class,'Selector6')]//select
${assign_ot_plan_range_page.btn_change}                              xpath=//div[contains(@class,'groupBox3')]//button[text()='Change']
${assign_ot_plan_range_page.btn_search_bar}                          xpath=//div[contains(@class,'groupBox2')]//i
${assign_ot_plan_range_page.slc_transaction_type}                    xpath=//div[contains(@class,'dropDown4')]//select
${assign_ot_plan_range_page.btn_department_search}                   xpath=//button[contains(@class,'actionButton3')]
${assign_ot_plan_range_page.btn_department_delete}                   xpath=//button[contains(@class,'actionButton4')]
${assign_ot_plan_range_page.chk_subdept}                             xpath=//div[contains(@class,'checkBox2')]//input
${assign_ot_plan_range_page.txt_search_code}                         xpath=//th[@title="Code"]//input
${assign_ot_plan_range_page.txt_search_name}                         xpath=//th[@title="Name"]//input
${assign_ot_plan_range_page.tbl_department}                          xpath=//div[text() = "DEPARTMENT_VALUE"]
${assign_ot_plan_range_page.btn_select_select_department}            xpath=//button[contains(@class,'actionButton2')]
${assign_ot_plan_range_page.btn_close_select_department}             xpath=//button[contains(@class,'actionButton1')]
${assign_ot_plan_range_page.slc_position}                            xpath=//div[contains(@class,'referenceSelector4')]//select
${assign_ot_plan_range_page.chk_sub_position}                        xpath=//div[contains(@class,'checkBox4')]//input
${assign_ot_plan_range_page.slc_manage_group}                        xpath=//div[contains(@class,'referenceSelector7')]//select
${assign_ot_plan_range_page.txt_employee_id}                         xpath=//div[contains(@class,'textBox1')]//input
${assign_ot_plan_range_page.txt_firstname}                           xpath=//div[contains(@class,'textBox3')]//input
${assign_ot_plan_range_page.txt_lastname}                            xpath=//div[contains(@class,'textBox4')]//input
${assign_ot_plan_range_page.slc_day_type}                            xpath=//div[contains(@class,'dropDown1')]//select
${assign_ot_plan_range_page.chk_filter_planned_ot}                   xpath=//div[contains(@class,'checkBox5')]//input
${assign_ot_plan_range_page.slc_ot_status}                           xpath=//div[contains(@class,'dropDown7')]//select
${assign_ot_plan_range_page.btn_clear_from_addition}                 xpath=//button[contains(@class,'actionButton11')]
${assign_ot_plan_range_page.btn_search_from_addition}                xpath=//button[contains(@class,'actionButton8')]
${assign_ot_plan_range_page.btn_cancel}                              xpath=//button[contains(@class,'actionButton9')]


*** Keywords ***
# Search Group
Search Start Date
    [Arguments]         ${StartDate}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_search_from_date}            ${StartDate}

Search End Date
    [Arguments]         ${EndDate}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_search_to_date}              ${EndDate}

Select Search Workgroup
    [Arguments]         ${Workgroup}
    Select From List By Label               ${assign_ot_plan_range_page.slc_search_workgroup}            ${Workgroup} 

Select Search OT
    [Arguments]         ${OT}
    Select From List By Label               ${assign_ot_plan_range_page.slc_search_ot}                   ${OT} 

Click Search Button In Search Group
    Click Element When Ready                ${assign_ot_plan_range_page.btn_search_search} 

# Assign All
Assign All Select Hours
    [Arguments]         ${Hours}
    Select From List By Label               ${assign_ot_plan_range_page.slc_hours}                       ${Hours} 

Assign All Select Minutes
    [Arguments]         ${Minutes}
    Select From List By Label               ${assign_ot_plan_range_page.slc_minutes}                     ${Minutes} 

Assign All Change Button
    Click Element When Ready                ${assign_ot_plan_range_page.btn_change}

# Tab Search Bar
Click Tap Search Bar
    Click Element When Ready                ${assign_ot_plan_range_page.btn_search_bar} 

Search Bar Search Agency
    [Arguments]         ${Agency}
    Select From List By Label               ${assign_ot_plan_range_page.slc_transaction_type}           ${Agency} 

Search Department Button Search
    Click Element When Ready                ${assign_ot_plan_range_page.btn_department_search} 

Search Department Button Delete
    Click Element When Ready                ${assign_ot_plan_range_page.btn_department_delete} 

Addition Search Bar Checkbox Subdept
    Click Element When Ready                ${assign_ot_plan_range_page.chk_subdept}

Search Department By Code
    [Arguments]         ${Code}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_search_code}                 ${Code}

Search Department By Name
    [Arguments]         ${Name}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_search_name}                 ${Name}

Select Department From Search
    [Arguments]        ${department_code}
    ${tbl_department}                       Replace String    ${assign_ot_plan_range_page.tbl_department}    DEPARTMENT_VALUE    ${department_code}
    Click Element When Ready                ${tbl_department}

Search Department Select Button
    Click Element When Ready                ${assign_ot_plan_range_page.btn_select_select_department}

Search Department Close Button
    Click Element When Ready                ${assign_ot_plan_range_page.btn_close_select_department}

Position Select
    [Arguments]         ${Select}
    Select From List By Label               ${assign_ot_plan_range_page.slc_position}                    ${Select} 

Position Sub Position Checkbox
    Click Element When Ready                ${assign_ot_plan_range_page.chk_sub_position}

Manage Group Emp Select
    [Arguments]         ${Select}
    Select From List By Label               ${assign_ot_plan_range_page.slc_manage_group}                ${Select} 

Input Employee Id
    [Arguments]         ${Employee_Id}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_employee_id}                 ${Employee_Id}

Input Firstname
    [Arguments]         ${Firstname}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_firstname}                   ${Firstname}

Input Lastname
    [Arguments]         ${Lastname}
    Input Text When Ready                   ${assign_ot_plan_range_page.txt_lastname}                    ${Lastname}

Select Day Type
    [Arguments]         ${Day_Type}
    Select From List By Label               ${assign_ot_plan_range_page.slc_day_type}                    ${Day_Type} 

Checkbox Filter Planned OT
    Click Element When Ready                ${assign_ot_plan_range_page.chk_filter_planned_ot}

Select OT Status
    [Arguments]         ${OT_Status}
    Select From List By Label               ${assign_ot_plan_range_page.slc_ot_status}                   ${OT_Status} 

Click Clear
    Click Element When Ready                ${assign_ot_plan_range_page.btn_clear_from_addition}

Click Search From Addition
    Click Element When Ready                ${assign_ot_plan_range_page.btn_search_from_addition}

Click Cancel Button
    Click Element When Ready                ${assign_ot_plan_range_page.btn_cancel} 


