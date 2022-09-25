*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${popup_select_department_module.popup}           xpath=//div[@role = "dialog"]
${popup_select_department_module.btn_select}                        xpath=//button[contains(@class, "mx-name-actionButton2")][text() = "Select"]
${popup_select_department_module.btn_close}                         xpath=//button[contains(@class, "mx-name-actionButton1")][text() = "Close"]
${popup_select_department_module.txt_search_code}                   xpath=//div[text() = "Code"]/../following-sibling::div//input
${popup_select_department_module.txt_search_name}                   xpath=//div[contains(., "Name")]/../following-sibling::div//input
${popup_select_department_module.btn_paging_first}                  xpath=//button[contains(@class, "mx-name-paging-first")]
${popup_select_department_module.btn_paging_previous}               xpath=//button[contains(@class, "mx-name-paging-previous")]
${popup_select_department_module.btn_paging_next}                   xpath=//button[contains(@class, "mx-name-paging-next")]
${popup_select_department_module.btn_paging_last}                   xpath=//button[contains(@class, "mx-name-paging-last")]
${popup_select_department_module.tr_first_department}               xpath=//tbody[@class = "mx-datagrid-body"]/tr[1]
${popup_select_department_module.tr_first_department_selected}      xpath=//tbody[@class = "mx-datagrid-body"]/tr[1][contains(@class, "selected")]
${popup_select_department_module.tr_first_department_selected_name}    xpath=//tbody[@class = "mx-datagrid-body"]/tr[1]/td[2]/div
${popup_select_department_module.tr_department}                     xpath=//tbody[@class = "mx-datagrid-body"]/tr

*** Keywords ***
Check Select Department Popup Is Opened
    Element Should Be Visible           ${popup_select_department_module.popup} 

Click Select Department Button 
    Click Element When Ready            ${popup_select_department_module.btn_select}

Click Close Select Department Popup Button
    Click Element When Ready            ${popup_select_department_module.btn_close} 

Input Search Department Code    
    [Arguments]     ${department_code}
    Input Text When Ready               ${popup_select_department_module.txt_search_code}      ${department_code}

Input Search Department Name 
    [Arguments]     ${department_name}
    Input Text When Ready               ${popup_select_department_module.txt_search_name}       ${department_name}

Click First Page Button 
    Click Element When Ready            ${popup_select_department_module.btn_paging_first}

Click Previous Page Button 
    Click Element When Ready            ${popup_select_department_module.btn_paging_previous}

Click Next Page Button   
    Click Element When Ready            ${popup_select_department_module.btn_paging_next} 

Click Last Page Button 
    Click Element When Ready            ${popup_select_department_module.btn_paging_last}  

Check Department Result Returned   
    ${elements} =       Get Element Count  ${popup_select_department_module.tr_department}
    Should Be True      ${elements} > 0  

Select First Department Returned 
    Click Element When Ready            ${popup_select_department_module.tr_first_department}  

Get First Department Returned Name 
    ${department_name} =    Get Element Text When Ready         ${popup_select_department_module.tr_first_department_selected_name}     
    [Return]        ${department_name}

Check First Department Returned Selected After Clicked
    Element Should Be Visible           ${popup_select_department_module.tr_first_department_selected}    

Check First Paging Button Is Disabled    
    Element Should Be Disabled          ${popup_select_department_module.btn_paging_first}

Check Previous Paging Button Is Disabled
    Element Should Be Disabled          ${popup_select_department_module.btn_paging_previous}   

Check Next Paging Button Is Disabled 
    Element Should Be Disabled          ${popup_select_department_module.btn_paging_next}   

Check Last Paging Button Is Disabled 
    Element Should Be Disabled          ${popup_select_department_module.btn_paging_last} 