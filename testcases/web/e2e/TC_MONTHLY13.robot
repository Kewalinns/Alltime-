*** Settings ***
Resource          ${CURDIR}/../../../resources/web/imports_page.robot
Resource          ${CURDIR}/../../../resources/web/imports_feature.robot
Suite Setup       Process Start
Test Setup        Run Keywords
...               Set Selenium Speed      ${selenium_speed}
...    AND        Set Selenium Timeout    ${global_timeout}
Suite Teardown    End Process

*** Test Cases ***
TC_MONTHLY13
    [Documentation]    ไม่มาทำงาน - Holiday
    #Approve Time Sheet
    login_keywords.Login Local                                   ${chutinan['username']}    ${chutinan['password']}
    main_menu_keywords.Go To Approve Time Sheet Menu
    approve_time_sheet_keywords.Search Re Process Time Sheet     ${TC_MONTHLY13['employee_data']['Date']}    ${TC_MONTHLY13['department']}    ${TC_MONTHLY13['employee_data']['First Name']}    ${TC_MONTHLY13['employee_data']['EmployeeID']}
    approve_time_sheet_keywords.Re Process Time Sheet            ${TC_MONTHLY13['employee_data']['First Name']}    ${TC_MONTHLY13['employee_data']['EmployeeID']}
    main_menu.Click Back Button
    home_page.Click Logout Button

     #View Report
    login_keywords.Login Local                                   ${hr['username']}    ${hr['password']}
    main_menu_keywords.Go To Detail Of TRC Report Menu
    detail_of_trc_report_keywords.Download CSV                   ${TC_MONTHLY13['workgroup']}    ${TC_MONTHLY13['department']}    ${TC_MONTHLY13['date_in']}    ${TC_MONTHLY13['date_out']}
    ...                                                          ${TC_MONTHLY13['employee_data']['EmployeeID']}    ${TC_MONTHLY13['employee_data']['First Name']}
    detail_of_trc_report_keywords.Verify CSV                     ${TC_MONTHLY13['employee_data']}    ${detail_trc_report_file}

Delete All Data
    common_keywords.Re-start Process
    login_keywords.Login Local                                   ${delete['username']}    ${delete['password']}
    home_keywords.Delete Data                                    ${TC_MONTHLY13['employee_data']['EmployeeID']}
    home_page.Click Logout Button            
    