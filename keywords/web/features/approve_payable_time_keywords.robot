*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Select Employee And Period
    [Arguments]         ${employee_type}    ${period}       ${value}        ${type}=name
    approve_payable_time_page.Wait Until Loading Disappear 
    approve_payable_time_page.Select Employee Type             ${employee_type}
    approve_payable_time_page.Select Period                    ${period}
    approve_payable_time_page.Wait Until Loading Disappear 
    approve_payable_time_page.Click Search Department Button
    popup_select_department_keywords.Select Department         ${value}        ${type}
    approve_payable_time_page.Wait Until Loading Disappear 

Verify Payable Is Approved
    [Arguments]         ${ID}
    approve_payable_time_page.Input Employee ID           ${ID}
    approve_payable_time_page.Click Search Value Button
    approve_payable_time_page.Checkbox Select Value       ${ID}
    approve_payable_time_page.Click Approve Button
    approve_payable_time_page.Wait Until Loading Disappear
    approve_payable_time_page.Checkbox Payable Status     Approved
    approve_payable_time_page.Click Search Value Button
    approve_payable_time_page.Payable Should Be Approved  ${ID}
    approve_payable_time_page.Capture Screenshot

Back Step
    [Arguments]         ${ID}       ${PayableStatus}
    approve_payable_time_page.Checkbox Select Value       ${ID}
    approve_payable_time_page.Click Pending Button
    approve_payable_time_page.Checkbox Payable Status     ${PayableStatus}
    approve_payable_time_page.Click Search Value Button