*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot

*** Keywords ***
Go To Employee Master Menu
    [Documentation]    Go to employee master menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check HR Work Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand HR Work Menu
    main_menu.Click Employee Master Menu Button

Go To Assign Shift Menu
    [Documentation]    Go to assign shift menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Assign Shift Menu Button

Go To Assign OT Plan Menu
    [Documentation]    Go to assign OT plan menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Assign OT Plan Menu Button

Go To Assign OT Plan Range Menu
    [Documentation]    Go to assign OT plan range menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Assign OT Plan Range Menu Button

Go To Approve OT Plan Menu
    [Documentation]    Go to approve OT menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Approve OT Plan Menu Button    

Go To View Time By Manager Menu
    [Documentation]    Go to View time by manager menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click View Time By Manager Menu Button

Go To Time Request By Manager Menu
    [Documentation]    Go to time request by manager menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Time Request By Manager Menu Button

Go To Detail Of TRC Report Menu
    [Documentation]    Go to detail of TRC report menu
    home_page.Click Main Menu Button
    main_menu.Click Report Menu Button
    report_page.Click Detail Of TRC Report Menu button
    detail_of_trc_report_page.Check Go To Detail Of TRC Report Page
    
Go To Approve Time Request Menu
    [Documentation]    Go to Approve Time Request menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Approve Time Request Button

Go To Approve Time Sheet Menu
    [Documentation]    Go to Approve Timesheet menu
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Approve Time Sheet Button

Go To Approve Payable Time
    [Documentation]    Go to Approve Payable Time
    home_page.Click Main Menu Button
    ${expand_status}    Run Keyword And Return Status    main_menu.Check Manage Self Service Menu Is Collapsed
    Run Keyword If      '${expand_status}' == 'True'     main_menu.Expand Manage Self Service Menu
    main_menu.Click Approve Payable Time

