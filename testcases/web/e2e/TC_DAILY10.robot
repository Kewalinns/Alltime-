*** Settings ***
Resource          ${CURDIR}/../../../resources/web/imports_page.robot
Resource          ${CURDIR}/../../../resources/web/imports_feature.robot
Suite Setup       Process Start
Test Setup        Run Keywords
...               Set Selenium Speed      ${selenium_speed}
...    AND        Set Selenium Timeout    ${global_timeout}
Suite Teardown    End Process

*** Test Cases ***
TC_DAILY10
    [Documentation]    มาทำงาน มีเวลาเข้าออก แต่ไม่ได้ Plan OT

    #Time Request
    login_keywords.Login Local                                   ${kunyarat['username']}    ${kunyarat['password']}
    main_menu_keywords.Go To Time Request By Manager Menu
    time_request_by_manager_keywords.Save Time Request           ${TC_DAILY10['employee_data']['EmployeeID']}    ${TC_DAILY10['employee_data']['Date']}    ${TC_DAILY10['date_in']}
    ...                                                          ${TC_DAILY10['date_out']}    ${TC_DAILY10['time_in']}    ${TC_DAILY10['time_out']}
    ...                                                          ${TC_DAILY10['time_req_reason']}    ${TC_DAILY10['department']}
    time_request_by_manager_keywords.Check PopUp And Info
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Time Request
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Request Menu
    approve_time_request_keywords.Approve Time Request           ${TC_DAILY10['employee_data']['EmployeeID']}    ${TC_DAILY10['employee_data']['Date']}    ${TC_DAILY10['time_in']}
    ...                                                          ${TC_DAILY10['time_out']}    ${TC_DAILY10['time_req_reason']}
    main_menu.Click Back Button
    home_page.Click Logout Button

    #Approve Time Sheet
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Sheet Menu
    approve_time_sheet_keywords.Search Re Process Time Sheet     ${TC_DAILY10['employee_data']['Date']}    ${TC_DAILY10['department']}    ${TC_DAILY10['employee_data']['First Name']}    ${TC_DAILY10['employee_data']['EmployeeID']}
    approve_time_sheet_keywords.Re Process Time Sheet            ${TC_DAILY10['employee_data']['First Name']}    ${TC_DAILY10['employee_data']['EmployeeID']}       False
    main_menu.Click Back Button
    home_page.Click Logout Button

    #View Report
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Detail Of TRC Report Menu
    detail_of_trc_report_keywords.Download CSV                   ${TC_DAILY10['workgroup']}    ${TC_DAILY10['department']}    ${TC_DAILY10['date_in']}    ${TC_DAILY10['date_out']}
    ...                                                          ${TC_DAILY10['employee_data']['EmployeeID']}    ${TC_DAILY10['employee_data']['First Name']}
    detail_of_trc_report_keywords.Verify CSV                     ${TC_DAILY10['employee_data']}    ${detail_trc_report_file}
    main_menu.Click Back Button
    home_page.Click Logout Button

Delete All Data
    common_keywords.Re-start Process
    login_keywords.Login Local                                   ${delete['username']}    ${delete['password']}
    home_keywords.Delete Data                                    ${TC_DAILY10['employee_data']['EmployeeID']}
    home_page.Click Logout Button