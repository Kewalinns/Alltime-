*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Download CSV
    [Documentation]    Download CSV with employee detail
    [Arguments]        ${workgroup}    ${department}    ${from_date}    ${to_date}    ${employee_id}    ${first_name}=${empty}    ${last_name}=${empty}
    detail_of_trc_report_page.Select Workgroup                     ${workgroup}
    detail_of_trc_report_page.Click Search Department Button
    popup_select_department_keywords.Select Department             ${department}
    detail_of_trc_report_page.Check Department Name                ${department}
    detail_of_trc_report_page.Input From Date                      ${from_date}
    detail_of_trc_report_page.Input To Date                        ${to_date}
    detail_of_trc_report_page.Input Employee ID                    ${employee_id}
    # detail_of_trc_report_page.Input First Name                     ${first_name}
    # detail_of_trc_report_page.Input Last Name                      ${last_name}
    detail_of_trc_report_page.Click Download CSV
    FOR    ${i}    IN RANGE    5
        ${file_status}      Run Keyword And Return Status    Wait Until Created    ${detail_trc_report_file}    timeout=10s
        Run Keyword If      '${file_status}' == 'False'      detail_of_trc_report_page.Click Download CSV
        Exit For Loop If    '${file_status}' == 'True'
    END
    ${new_file}                                                    Get File    ${detail_trc_report_file}    encoding=SYSTEM    encoding_errors=ignore
    Remove File                                                    ${detail_trc_report_file}     
    Create File                                                    ${detail_trc_report_file}    ${new_file}   encoding=SYSTEM
    Wait Until Created                                             ${detail_trc_report_file}

Verify CSV
    [Documentation]    Verift CSV with employee detail
    [Arguments]        ${employee_data}    ${report_file}
    ${report_data} 		                                           Read Csv File To Associative    ${report_file}
    FOR   ${i}   IN    @{report_data[0]}
        Log                   ${i}
        Log                                    ${report_data[0]['${i}']}
        Run Keyword And Ignore Error           Log   ${employee_data['${i}']}
        Run Keyword And Continue On Failure    Should Be Equal    ${report_data[0]['${i}']}    ${employee_data['${i}']}    ${\n}${i}
    END
    # Should Be Equal    ${employee_data['EmployeeID']}                          ${report_data[0]['EmployeeID']}
    # Should Be Equal    ${employee_data['Full Name']}                           ${report_data[0]['Full Name']}
    # Should Be Equal    ${employee_data['Date']}                                ${report_data[0]['Date']}
    # Should Be Equal    ${employee_data['ลาไม่จ่าย (Day)']}                       ${report_data[0]['ลาไม่จ่าย (Day)']}
    # Should Be Equal    ${employee_data['พักงาน (Day)']}                         ${report_data[0]['พักงาน (Day)']}
    # Should Be Equal    ${employee_data['Work (Day)']}                          ${report_data[0]['Work (Day)']}
    # Should Be Equal    ${employee_data['Absent (Day)']}                        ${report_data[0]['Absent (Day)']}
    # Should Be Equal    ${employee_data['OT1 (Guard-Holiday) (Hours)']}         ${report_data[0]['OT1 (Guard-Holiday) (Hours)']}
    # Should Be Equal    ${employee_data['OT. 1.5(Before Work) (Hours)']}        ${report_data[0]['OT. 1.5(Before Work) (Hours)']}
    # Should Be Equal    ${employee_data['O.T.1.5(After Shift) (Hours)']}        ${report_data[0]['O.T.1.5(After Shift) (Hours)']}
    # Should Be Equal    ${employee_data['O.T. 1(Daily) (Hours)']}               ${report_data[0]['O.T. 1(Daily) (Hours)']}
    # Should Be Equal    ${employee_data['O.T.2 (Hours)']}                       ${report_data[0]['O.T.2 (Hours)']}
    # Should Be Equal    ${employee_data['O.T.3(After Shift) (Hours)']}          ${report_data[0]['O.T.3(After Shift) (Hours)']}
    # Should Be Equal    ${employee_data['O.T.2(Guard) (Hours)']}                ${report_data[0]['O.T.2(Guard) (Hours)']}
    # Should Be Equal    ${employee_data['O.T.1(Guard) (Hours)']}                ${report_data[0]['O.T.1(Guard) (Hours)']}
    # Should Be Equal    ${employee_data['O.T.1(Monthly) (Hours)']}              ${report_data[0]['O.T.1(Monthly) (Hours)']}
    # Should Be Equal    ${employee_data['Vacation (Day)']}                      ${report_data[0]['Vacation (Day)']}
    # Should Be Equal    ${employee_data['Personal Leave (Day)']}                ${report_data[0]['Personal Leave (Day)']}
    # Should Be Equal    ${employee_data['Personal Leave(Unpaid) (Day)']}        ${report_data[0]['Personal Leave(Unpaid) (Day)']}
    # Should Be Equal    ${employee_data['Sick (Day)']}                          ${report_data[0]['Sick (Day)']}
    # Should Be Equal    ${employee_data['Sick (Unpaid) (Day)']}                 ${report_data[0]['Sick (Unpaid) (Day)']}
    # Should Be Equal    ${employee_data['Maternity (Day)']}                     ${report_data[0]['Maternity (Day)']}
    # Should Be Equal    ${employee_data['Pregnancy Examination (Day)']}         ${report_data[0]['Pregnancy Examination (Day)']}
    # Should Be Equal    ${employee_data['Military (Day)']}                      ${report_data[0]['Military (Day)']}
    # Should Be Equal    ${employee_data['Monkshood (Day)']}                     ${report_data[0]['Monkshood (Day)']}
    # Should Be Equal    ${employee_data['Working Outside (Day)']}               ${report_data[0]['Working Outside (Day)']}
    # Should Be Equal    ${employee_data['Other Leave (Day)']}                   ${report_data[0]['Other Leave (Day)']}
    # Should Be Equal    ${employee_data['Sick (Accident) (Day)']}               ${report_data[0]['Sick (Accident) (Day)']}
    # Should Be Equal    ${employee_data['Sterilization  (Day)']}                ${report_data[0]['Sterilization  (Day)']}
    # Should Be Equal    ${employee_data['Maternity (Unpaid) (Day)']}            ${report_data[0]['Maternity (Unpaid) (Day)']}
    # Should Be Equal    ${employee_data['Pregnancy (Unpaid) (Day)']}            ${report_data[0]['Pregnancy (Unpaid) (Day)']}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
