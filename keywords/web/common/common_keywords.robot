*** Variables ***
${popup_progress}            xpath=//div[contains(@class, "mx-progress-message")]

*** Keywords ***
Process Start
    [Documentation]    Open website CP All Time
    Open Browser And Set Download Directory
    Goto                             ${site_url}
    Maximize Browser Window
    Get Date
    Start VideoRC

End Process
    [Documentation]    Close browser and stop screen record
    Stop VideoRC
    Close Browser

Re-start Process
    [Documentation]    Force quit browser and re open
    Close Browser
    Open Browser And Set Download Directory
    Goto                             ${site_url}
    Maximize Browser Window
    Set Selenium Speed               ${selenium_speed}
    Set Selenium Timeout             ${global_timeout}

Open Browser And Set Download Directory
    [Documentation]    Open chrome browser and set download directory
    ${options}                       Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${preferences}                   Create Dictionary    prompt_for_download=false    download.default_directory=${download_path}    download.directory_update=True
    Call Method                      ${options}    add_experimental_option    prefs    ${preferences}
    Run Keyword If                   '${headless}' == 'true'    Call Method    ${options}    add_argument    headless
    Create WebDriver                 Chrome    chrome_options=${options}
    Run Keyword If                   '${headless}' == 'true'    Set Window Size    ${1920}    ${1080}
    Run Keyword And Ignore Error     Remove File    ${detail_trc_report_file}     

Start VideoRC
    [Documentation]    Start screen record
    [Arguments]    ${FileNames}=VideoTC
    Run Keyword If    '${record}' == 'true'    Start Video Recording    name=${FileNames}    embed_width=720px

Stop VideoRC
    [Documentation]    Stop screen record
    Run Keyword If    '${record}' == 'true'    Stop Video Recording

Get Date
    [Documentation]    Get current date in format dd/mm/yyyy
    ${current_date}    Get current date    result_format=%d/%m/%Y
    Set Global Variable              ${current_date}

Click Element When Ready
    [Documentation]    Click element when element is visible
    [Arguments]        ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element                    ${locator}

Double Click Element When Ready
    [Documentation]    Double Click element when element is visible
    [Arguments]        ${locator}
    Wait Until Element Is Visible    ${locator}
    Double Click Element             ${locator}

Input Text When Ready
    [Documentation]    Input text in element when element is visible
    [Arguments]        ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}
    Input Text                       ${locator}    ${value}    

Clear And Input Text When Ready
    [Documentation]    Clear locate text box with push the backspace key and input text
    [Arguments]        ${locator}    ${value}
    Click Element When Ready         ${locator}
    Clear Text Field                 ${locator}
    Input Text                       ${locator}    ${value}

Get Element Text When Ready 
    [Arguments]         ${locator}
    Wait Until Element Is Visible    ${locator}
    ${text} =       Get Text    ${locator}
    [Return]    ${text}      

Clear Text 
    [Documentation]    Clear all text in locator
    [Arguments]        ${locator}
    Wait Until Element Is Visible       ${locator}
    Press Keys         ${locator}       CTRL+a+BACKSPACE    

Clear Text Field
    [Documentation]    This keyword pushes the backspace key a specified number of times in a specified field.
    [Arguments]        ${locator}
    ${system}          Evaluate    sys.platform    sys
    Run Keyword If     '${system}' == 'darwin'     Press Keys    None    COMMAND+a
    ...       ELSE     Press Keys    None    CTRL+a
    Press Keys         None    BACKSPACE
    # Set Selenium Speed      0.05
    # ${text field}           Get Value     ${locator}
    # ${text field length}    Get Length    ${text field}
    # FOR    ${index}    IN RANGE    ${text field length}
    #     Press Keys    ${locator}    BACKSPACE
    # END
    # Set Selenium Speed      ${selenium_speed}

Wait Until Progress Popup Disappear
    [Documentation]    Wait until progress popup is hidden from the page (Loading..., Searching...); This progress shows on all pages.
    Wait Until Page Does Not Contain Element        ${popup_progress}