*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Keywords ***
Select Department
    [Arguments]     ${value}        ${type}=name
    Run Keyword If      '${type}' == 'code'     popup_select_department_module.Input Search Department Code       ${value} 
    ...     ELSE    popup_select_department_module.Input Search Department Name       ${value}     

    popup_select_department_module.Check Department Result Returned   
    popup_select_department_module.Select First Department Returned 
    popup_select_department_module.Check First Department Returned Selected After Clicked
    ${selected_department} =        popup_select_department_module.Get First Department Returned Name
    popup_select_department_module.Click Select Department Button  

    [Return]        ${selected_department}