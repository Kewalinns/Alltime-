*** Settings ***
Resource          ${CURDIR}/../../../resources/web/imports_page.robot
Resource          ${CURDIR}/../../../resources/web/imports_feature.robot
Suite Setup       Process Start
Test Setup        Run Keywords
...               Set Selenium Speed      ${selenium_speed}
...    AND        Set Selenium Timeout    ${global_timeout}
Suite Teardown    End Process

*** Test Cases ***
Step:1
    [Documentation]   Add leave
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Employee Master Menu
    employee_hr_keywords.Search Employee By ID                   ${testdata01['workgroup']}    ${testdata01['employee_data']['EmployeeID']}
    employee_hr_keywords.Add And Verify Employee Leave           ${current_date}    ${testdata01['leave_name']}    ${testdata01['leave_start_date']}
    ...                                                          ${testdata01['leave_end_date']}    ${testdata01['leave_type']}    ${testdata01['leave_status']}
    ...                                                          ${testdata01['leave_approval']}    ${testdata01['leave_approve_date']}
    home_page.Click Logout Button
    
Step:2
    [Documentation]   Assign O.T. Plan
    login_keywords.Login Local                                   ${kunyarat['username']}    ${kunyarat['password']}
    main_menu_keywords.Go To Assign OT Plan Menu
    assign_ot_plan_keywords.Search Employee And Assign OT Plan   ${testdata01['employee_data']['Date']}    ${testdata01['workgroup']}    ${testdata01['department']}
    ...                                                          ${testdata01['ot_type']}    ${testdata01['ot_hour']}    ${testdata01['ot_min']}
    ...                                                          ${testdata01['employee_data']['EmployeeID']}   ${testdata01['employee_data']['First Name']}
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:3
    [Documentation]   Time Request
    login_keywords.Login Local                                   ${kunyarat['username']}    ${kunyarat['password']}
    main_menu_keywords.Go To Time Request By Manager Menu
    time_request_by_manager_keywords.Save Time Request           ${testdata01['employee_data']['EmployeeID']}    ${testdata01['employee_data']['Date']}    ${testdata01['date_in']}
    ...                                                          ${testdata01['date_out']}    ${testdata01['time_in']}    ${testdata01['time_out']}
    ...                                                          ${testdata01['time_req_reason']}    ${testdata01['department']}
    time_request_by_manager_keywords.Check PopUp And Info
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:4.1
    [Documentation]   Approve O.T. Plan
    login_keywords.Login Local                                   ${parichat['username']}    ${parichat['password']}
    main_menu_keywords.Go To Approve OT Plan Menu
    approve_ot_plan_keywords.Search Ot Plan                      ${testdata01['employee_data']['Date']}    ${testdata01['employee_data']['Date']}    ${testdata01['workgroup']}
    ...                                                          ${testdata01['department']}    ${testdata01['employee_data']['EmployeeID']}    ${testdata01['employee_data']['First Name']}
    approve_ot_plan_keywords.Approve Ot Plan                     ${testdata01['employee_data']['EmployeeID']}    ${testdata01['employee_data']['Date']}    ${testdata01['ot_type']}    ${testdata01['ot_time']}
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:4.2
    [Documentation]   Approve Time Request
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Request Menu
    approve_time_request_keywords.Approve Time Request           ${testdata01['employee_data']['First Name']}    ${testdata01['employee_data']['Date']}    ${testdata01['time_in']}
    ...                                                          ${testdata01['time_out']}    ${testdata01['time_req_reason']}
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:4.3
    [Documentation]   Approve Time Sheet
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Sheet Menu
    approve_time_sheet_keywords.Search Re Process Time Sheet     ${testdata01['employee_data']['Date']}    ${testdata01['department']}    ${testdata01['employee_data']['First Name']}    ${testdata01['employee_data']['EmployeeID']}
    approve_time_sheet_keywords.Re Process Time Sheet            ${testdata01['employee_data']['First Name']}    ${testdata01['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:5
    [Documentation]   Approve Payable
    login_keywords.Login Local                                   ${surasak['username']}    ${surasak['password']}
    main_menu_keywords.Go To Approve Payable Time
    approve_payable_time_keywords.Select Employee And Period     ${testdata01['work_type']}    ${testdata01['payable_period']}    ${testdata01['department']}
    approve_payable_time_keywords.Verify Payable Is Approved     ${testdata01['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:5.1
    [Documentation]   View Time
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To View Time By Manager Menu
    view_time_keywords.Check View Time                           ${testdata01['employee_data']['EmployeeID']}    ${testdata01['employee_data']['First Name']}    ${testdata01['department']}
    ...                                                          ${testdata01['employee_data']['Date']}    Sick Leave    ${testdata01['time_out']}
    ...                                                          ${testdata01['status_in']}    ${testdata01['status_out']}
    main_menu.Click Back Button
    Go Back
    home_page.Click Logout Button

Step:6
    [Documentation]   View Report
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Detail Of TRC Report Menu
    detail_of_trc_report_keywords.Download CSV                   ${testdata01['workgroup']}    ${testdata01['department']}    ${testdata01['date_in']}    ${testdata01['date_out']}
    ...                                                          ${testdata01['employee_data']['EmployeeID']}    ${testdata01['employee_data']['First Name']}
    detail_of_trc_report_keywords.Verify CSV                     ${testdata01['employee_data']}    ${detail_trc_report_file}
    main_menu.Click Back Button
    home_page.Click Logout Button

Step:7
    [Documentation]   Delete leave
    common_keywords.Re-start Process
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Employee Master Menu
    employee_hr_keywords.Search Employee By ID                   ${testdata01['workgroup']}    ${testdata01['employee_data']['EmployeeID']}
    employee_hr_keywords.Delete Employee Leave                   ${current_date}    ${testdata01['leave_name']}    ${testdata01['leave_start_date']}
    ...                                                          ${testdata01['leave_end_date']}    ${testdata01['leave_type']}    ${testdata01['leave_status']}
    ...                                                          ${testdata01['leave_approval']}    ${testdata01['leave_approve_date']}
    home_page.Click Logout Button

Step:8
    [Documentation]   Delete All Data
    common_keywords.Re-start Process
    login_keywords.Login Local                                   ${delete['username']}    ${delete['password']}
    home_keywords.Delete Data                                    ${testdata01['employee_data']['EmployeeID']}
    home_page.Click Logout Button