*** Settings ***
Resource          ${CURDIR}/../../../resources/web/imports_page.robot
Resource          ${CURDIR}/../../../resources/web/imports_feature.robot
Suite Setup       Process Start
Test Setup        Run Keywords
...               Set Selenium Speed      ${selenium_speed}
...    AND        Set Selenium Timeout    ${global_timeout}
Suite Teardown    End Process

*** Test Cases ***
TC_DAILY01
    [Documentation]    มาตรงเวลา มีเวลาเข้า และ ออกครบ (อนุมัติ)
    #Time Request
    login_keywords.Login Local                                   ${kunyarat['username']}    ${kunyarat['password']}
    main_menu_keywords.Go To Time Request By Manager Menu
    time_request_by_manager_keywords.Save Time Request           ${TC_DAILY01['employee_data']['EmployeeID']}    ${TC_DAILY01['employee_data']['Date']}    ${TC_DAILY01['date_in']}
    ...                                                          ${TC_DAILY01['date_out']}    ${TC_DAILY01['time_in']}    ${TC_DAILY01['time_out']}
    ...                                                          ${TC_DAILY01['time_req_reason']}    ${TC_DAILY01['department']}
    time_request_by_manager_keywords.Check PopUp And Info
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Time Request
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Request Menu
    approve_time_request_keywords.Approve Time Request           ${TC_DAILY01['employee_data']['EmployeeID']}    ${TC_DAILY01['employee_data']['Date']}    ${TC_DAILY01['time_in']}
    ...                                                          ${TC_DAILY01['time_out']}    ${TC_DAILY01['time_req_reason']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Time Sheet
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Sheet Menu
    approve_time_sheet_keywords.Search Re Process Time Sheet     ${TC_DAILY01['employee_data']['Date']}    ${TC_DAILY01['department']}    ${TC_DAILY01['employee_data']['First Name']}    ${TC_DAILY01['employee_data']['EmployeeID']}
    approve_time_sheet_keywords.Re Process Time Sheet            ${TC_DAILY01['employee_data']['First Name']}    ${TC_DAILY01['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Payable
    login_keywords.Login Local                                   ${surasak['username']}    ${surasak['password']}
    main_menu_keywords.Go To Approve Payable Time
    approve_payable_time_keywords.Select Employee And Period     ${TC_DAILY01['work_type']}    ${TC_DAILY01['payable_period']}    ${TC_DAILY01['department']}
    approve_payable_time_keywords.Verify Payable Is Approved     ${TC_DAILY01['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #View Time
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To View Time By Manager Menu
    view_time_keywords.Check View Time                           ${TC_DAILY01['employee_data']['EmployeeID']}    ${TC_DAILY01['employee_data']['First Name']}    ${TC_DAILY01['department']}
    ...                                                          ${TC_DAILY01['employee_data']['Date']}    ${TC_DAILY01['time_in']}    ${TC_DAILY01['time_out']}
    ...                                                          ${EMPTY}    ${EMPTY}
    main_menu.Click Back Button
    Go Back
    home_page.Click Logout Button

    #View Report
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Detail Of TRC Report Menu
    detail_of_trc_report_keywords.Download CSV                   ${TC_DAILY01['workgroup']}    ${TC_DAILY01['department']}    ${TC_DAILY01['date_in']}    ${TC_DAILY01['date_out']}
    ...                                                          ${TC_DAILY01['employee_data']['EmployeeID']}    ${TC_DAILY01['employee_data']['First Name']}
    detail_of_trc_report_keywords.Verify CSV                     ${TC_DAILY01['employee_data']}    ${detail_trc_report_file}
    main_menu.Click Back Button
    home_page.Click Logout Button

Delete All Data
    common_keywords.Re-start Process
    login_keywords.Login Local                                   ${delete['username']}    ${delete['password']}
    home_keywords.Delete Data                                    ${TC_DAILY01['employee_data']['EmployeeID']}
    home_page.Click Logout Button