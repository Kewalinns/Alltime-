*** Variables ***
${popup_info_module.popup}                        xpath=//div[contains(@class, "mx-dialog-content")]
${popup_info_module.btn_close}                    xpath=//button[contains(@class, "mx-dialog-close")]
${popup_info_module.btn_ok}                       xpath=//div[contains(@class, "mx-dialog-content")]//button[contains(@class, "btn-primary")]
${popup_info_module.lbl_info}                     xpath=//div[contains(@class, "mx-dialog-body")]/p
${popup_info_module.lbl_loading}                  xpath=//*[contains(@class, "mx-progress")]

*** Keywords ***
Check Popup Is Shown
    Wait Until Element Is Visible       ${popup_info_module.popup} 

Click Close Button 
    Click Element When Ready            ${popup_info_module.btn_close}

Click Ok Button 
    Click Element When Ready            ${popup_info_module.btn_ok}   

Check Info 
    [Arguments]      ${text}
    Element Should Contain             ${popup_info_module.lbl_info}    ${text}    ignore_case=True

Wait Until Loading Disappear
    Run Keyword And Ignore Error            Wait Until Element Is Visible           ${popup_info_module.lbl_loading}    timeout=3s
    Wait Until Element Is Not Visible       ${popup_info_module.lbl_loading} 