*** Setting ***
Resource    ${CURDIR}/../../../resources/web/imports.robot
Resource    ${CURDIR}/../../../resources/web/imports_page.robot
Resource    ${CURDIR}/../../../resources/web/imports_page_module.robot

*** Variables ***
@{months}   January  February  March  April  May  June  July  August  September  October  November  December
${time_displayed}    {time}({status})

*** Keywords ***
Search Time
    [Arguments]    ${employee_id}        ${name}        ${department}
    view_time_page.Click Search Department Button
    ${selected_department} =         popup_select_department_keywords.Select Department       ${department}        name
    Should Be Equal As Strings       ${selected_department}         ${department}      ignore_case=True
    view_time_page.Check Department Text               ${department}
    view_time_page.Input Employee Id                   ${employee_id}
    # view_time_page.Input First Name                    ${name}
    view_time_page.Click Search Button

Check View Time   
    [Documentation]    Checks if view time records for the given employee are shown correctly
    # ...    view_time_keywords.Check View Time    10072354    วันเพ็ญ    งานบรรจุกล่อง กะ 1        02/02/2021        08:01        16:59        L         B
    [Arguments]    ${employee_id}        ${name}         ${department}        ${date}        ${time_in}     ${time_out}        ${status_in}        ${status_out}
    view_time_keywords.Search Time    ${employee_id}        ${name}       ${department}
    view_time_page.Check Search Result By Employee ID                 ${employee_id} 
    view_time_page.Click Chevron Button For Selected Employee ID      ${employee_id} 

    #Check calendar
    ${month_of_year} =    DateTime.Convert Date    ${date}        result_format=%B %Y     date_format=%d/%m/%Y 
    ${full_date} =  DateTime.Convert Date     ${date}    date_format=%d/%m/%Y  result_format=%Y-%m-%d %H:%M:%S.%f
    ${full_date} =	Convert Date  ${full_date}  datetime
    view_time_keywords.Check Date            ${full_date}    ${month_of_year}

    #Check times and status
    view_time_keywords.Check Time Shown On Calendar        ${date}        ${time_in}     ${time_out}        ${status_in}        ${status_out}
    view_time_page.Capture Screenshot

Check Date
    [Documentation]    Checks if month-year shown on the current calendar matches the given month-year; if not, then click previous or next until matches 
    [Arguments]        ${date}        ${month_of_year}
    ${calendar_month_of_year} =    view_time_page.Get Calendar Month Of Year

    Run Keyword If    '${calendar_month_of_year}' != '${month_of_year}'        view_time_keywords.Go To Selected Month Of Year        ${date}        ${month_of_year}        ${calendar_month_of_year}

Go To Selected Month Of Year 
    [Documentation]    Checks if month-year shown on the current calendar matches the given month-year; if not, then click previous or next until matches
    [Arguments]        ${date}        ${month_of_year}    ${calendar_month_of_year}   

    #get current calendar month and year
    ${calendar_month_name}    ${calendar_year} =        Split String    ${calendar_month_of_year}    separator=${SPACE}
    ${calendar_month} =       evaluate  ${months}.index("${calendar_month_name}") + 1

    Run Keyword If    (('${calendar_year}' == '${date.year}' and ${calendar_month} > ${date.month}) or ${calendar_year} > ${date.year})         view_time_page.Click Provious Month Button
    ...        ELSE        view_time_page.Click Next Month Button 

    #Recheck until matches
    view_time_keywords.Check Date    ${date}    ${month_of_year}

Check Time Shown On Calendar 
    [Documentation]     Checks time and status (in/out) shown on the calendar
    [Arguments]    ${date}        ${time_in}     ${time_out}        ${status_in}        ${status_out}
    ${data_date} =    DateTime.Convert Date    ${date}        result_format=%Y-%m-%d     date_format=%d/%m/%Y 
    ${formatted_date} =    DateTime.Convert Date    ${date}        datetime     date_format=%d/%m/%Y 
    ${count} =        view_time_page.Get Column Count     ${data_date}
    ${rowspan_count} =    Set Variable    0

    #Find the indexs of the <td> of the date given for time in <tr>[1] and out <tr>[2]
    FOR  ${i}     IN RANGE     1    ${count}+1
        ${index} =        Set Variable    ${i}
        ${day} =     view_time_page.Get Column Text        ${data_date}     ${index}

        #Find number of columns that having rowspan
        ${rowspan} =    view_time_page.Check Rowspan For Selected Index        ${data_date}     ${index}
        ${rowspan_count} =    evaluate    ${rowspan} + ${rowspan_count}

        Run Keyword If    '${formatted_date.day}' == '${day}'    Exit For Loop
    END

    ${is_holiday} =        Run Keyword And Return Status     view_time_page.Check Holiday     ${data_date}    ${index}
    ${is_weekend} =        Run Keyword And Return Status     view_time_page.Check Weekend     ${data_date}    ${index}
    ${status_in} =         Set Variable If    '${is_holiday}' == 'True' or '${is_weekend}' == 'True'        ${EMPTY}
    ...                    ${status_in}
    ${status_out} =        Set Variable If    '${is_holiday}' == 'True' or '${is_weekend}' == 'True'        ${EMPTY}
    ...                    ${status_out}

    #Check in work time and status
    ${time_in_displayed} =        Replace String    ${time_displayed}        {time}        ${time_in}
    ${time_in_displayed} =        Replace String    ${time_in_displayed}     {status}      ${status_in}
    ${time_in_displayed} =        Replace String    ${time_in_displayed}     ()            ${EMPTY}
    view_time_page.Check Time And Status For In Work       ${data_date}      ${index}      ${time_in_displayed}

    #Check out work time and status
    ${out_index} =    Evaluate    ${index} - ${rowspan_count}
    ${time_out_displayed} =        Replace String    ${time_displayed}        {time}        ${time_out}
    ${time_out_displayed} =        Replace String    ${time_out_displayed}    {status}      ${status_out}    
    ${time_out_displayed} =        Replace String    ${time_out_displayed}    ()            ${EMPTY} 
    view_time_page.Check Time And Status For Out Work       ${data_date}      ${out_index}  ${time_out_displayed}


