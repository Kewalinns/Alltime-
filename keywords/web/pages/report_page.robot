*** Settings ***
Resource    ${CURDIR}/../../../resources/web/imports.robot

*** Variables ***
${report_page.btn_detail_of_trc_report}              xpath=//a[normalize-space(text()) = "Detail of TRC Report"]

*** Keywords ***
Click Detail Of TRC Report Menu button
    [Documentation]    Click detail of trc report menu button
    Click Element When Ready         ${report_page.btn_detail_of_trc_report}