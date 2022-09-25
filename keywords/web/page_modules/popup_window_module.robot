*** Variables ***
${popup_window_module.popup}            xpath=//div[contains(@class, "mx-window-content")]
${popup_window_module.btn_close}        xpath=//div[contains(@class, "mx-window-content")]//button[text() = "Close"]
${popup_window_module.btn_continue}     xpath=//div[contains(@class, "mx-window-content")]//button[text() = "Continue"]


*** Keywords ***
Check Popup Window Is Shown
    Wait Until Element Is Visible       ${popup_window_module.popup}  

Click Close Button 
    Click Element When Ready            ${popup_window_module.btn_close}

Click Continue Button 
    Click Element When Ready            ${popup_window_module.btn_continue}   

