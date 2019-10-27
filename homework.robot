*** Settings ***
Library           ../../../../Python27/Lib/site-packages/ExcelLibrary/
Library           ../../../../Python27/Lib/site-packages/SeleniumLibrary/
Library           OperatingSystem
Library           Collections

*** Variables ***
${excel_file}     %{USERPROFILE}/Desktop/homework.xls

*** Test Cases ***
Search value from Excel
    [Timeout]
    Open Excel    ${excel_file}
    ${sheet_name}=    Get Sheet Names
    ${content}=    Read Cell Data By Name    ${sheet_name}[0]    A1
    Open Browser    https://www.google.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains    Google
    Input Text    //input[@name='q']    ${content}
    Click Button    //input[@name='btnK']
    Wait Until Element Is Visible    //*[@id="resultStats"]    1s    Search response time longer than 1s
    [Teardown]    Close Browser
