*** Settings ***
Resource          ${CURDIR}/../../../resources/web/imports_page.robot
Resource          ${CURDIR}/../../../resources/web/imports_feature.robot
Suite Setup       Process Start
Test Setup        Run Keywords
...               Set Selenium Speed      ${selenium_speed}
...    AND        Set Selenium Timeout    ${global_timeout}
Suite Teardown    End Process

*** Test Cases ***
TC_MONTHLY16
    [Documentation]    มาทำงาน มีเวลาเข้าออก + Key Plan OT (=8) + ส่วนเกิน 8 ชม        Holiday
    #Assign O.T. Plan
    login_keywords.Login Local                                   ${kunyarat['username']}    ${kunyarat['password']}
    main_menu_keywords.Go To Assign OT Plan Menu
    assign_ot_plan_keywords.Search Employee And Assign OT Plan   ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['workgroup']}    ${TC_MONTHLY16['department']}
    ...                                                          ${TC_MONTHLY16['ot_type']}    ${TC_MONTHLY16['ot_hour']}    ${TC_MONTHLY16['ot_min']}
    ...                                                          ${TC_MONTHLY16['employee_data']['EmployeeID']}   ${TC_MONTHLY16['employee_data']['First Name']}

    #Assign O.T. Plan ex
    assign_ot_plan_keywords.Search Employee And Assign OT Plan   ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['workgroup']}    ${TC_MONTHLY16['department']}
    ...                                                          ${TC_MONTHLY16['ot_ex_type']}    ${TC_MONTHLY16['ot_ex_hour']}    ${TC_MONTHLY16['ot_ex_min']}
    ...                                                          ${TC_MONTHLY16['employee_data']['EmployeeID']}   ${TC_MONTHLY16['employee_data']['First Name']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Time Request
    login_keywords.Login Local                                   ${kunyarat['username']}    ${kunyarat['password']}
    main_menu_keywords.Go To Time Request By Manager Menu
    time_request_by_manager_keywords.Save Time Request           ${TC_MONTHLY16['employee_data']['EmployeeID']}    ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['date_in']}
    ...                                                          ${TC_MONTHLY16['date_out']}    ${TC_MONTHLY16['time_in']}    ${TC_MONTHLY16['time_out']}
    ...                                                          ${TC_MONTHLY16['time_req_reason']}    ${TC_MONTHLY16['department']}
    time_request_by_manager_keywords.Check PopUp And Info
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve O.T. Plan
    login_keywords.Login Local                                   ${parichat['username']}    ${parichat['password']}
    main_menu_keywords.Go To Approve OT Plan Menu
    approve_ot_plan_keywords.Search Ot Plan                      ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['workgroup']}
    ...                                                          ${TC_MONTHLY16['department']}    ${TC_MONTHLY16['employee_data']['EmployeeID']}    ${TC_MONTHLY16['employee_data']['First Name']}
    approve_ot_plan_keywords.Approve Ot Plan                     ${TC_MONTHLY16['employee_data']['EmployeeID']}    ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['ot_type']}    ${TC_MONTHLY16['ot_time']}

    #Approve O.T. Plan ex
    approve_ot_plan_keywords.Approve Ot Plan                     ${TC_MONTHLY16['employee_data']['EmployeeID']}    ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['ot_ex_type']}    ${TC_MONTHLY16['ot_ex_time']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Time Request
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Request Menu
    approve_time_request_keywords.Approve Time Request           ${TC_MONTHLY16['employee_data']['EmployeeID']}    ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['time_in']}
    ...                                                          ${TC_MONTHLY16['time_out']}    ${TC_MONTHLY16['time_req_reason']}
    main_menu.Click Back Button

    #Approve Time Sheet
    main_menu_keywords.Go To Approve Time Sheet Menu
    approve_time_sheet_keywords.Search Re Process Time Sheet     ${TC_MONTHLY16['employee_data']['Date']}    ${TC_MONTHLY16['department']}    ${TC_MONTHLY16['employee_data']['First Name']}    ${TC_MONTHLY16['employee_data']['EmployeeID']}
    approve_time_sheet_keywords.Re Process Time Sheet            ${TC_MONTHLY16['employee_data']['First Name']}    ${TC_MONTHLY16['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Payable
    login_keywords.Login Local                                   ${surasak['username']}    ${surasak['password']}
    main_menu_keywords.Go To Approve Payable Time
    approve_payable_time_keywords.Select Employee And Period     ${TC_MONTHLY16['work_type']}    ${TC_MONTHLY16['payable_period']}    ${TC_MONTHLY16['department']}
    approve_payable_time_keywords.Verify Payable Is Approved     ${TC_MONTHLY16['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #View Report
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Detail Of TRC Report Menu
    detail_of_trc_report_keywords.Download CSV                   ${TC_MONTHLY16['workgroup']}    ${TC_MONTHLY16['department']}    ${TC_MONTHLY16['date_in']}    ${TC_MONTHLY16['date_out']}
    ...                                                          ${TC_MONTHLY16['employee_data']['EmployeeID']}    ${TC_MONTHLY16['employee_data']['First Name']}
    detail_of_trc_report_keywords.Verify CSV                     ${TC_MONTHLY16['employee_data']}    ${detail_trc_report_file}

Delete All Data
    common_keywords.Re-start Process
    login_keywords.Login Local                                   ${delete['username']}    ${delete['password']}
    home_keywords.Delete Data                                    ${TC_MONTHLY16['employee_data']['EmployeeID']}
    home_page.Click Logout Button        