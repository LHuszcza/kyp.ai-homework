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
    #    Opening given .xls file
    Open Excel    ${excel_file}
    #    getting workbook's sheets names - in this case file with one sheet
    ${sheet_name}=    Get Sheet Names
    #    taking value from A1 cell
    ${content}=    Read Cell Data By Name    ${sheet_name}[0]    A1
    #    Opening chrome browser with google site
    Open Browser    https://www.google.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains    Google
    #    entering value into Search field
    Input Text    //input[@name='q']    ${content}
    #    clicking Search button
    Click Button    //input[@name='btnK']
    #    waiting max 1s for results. In case of timeout, err msg shows up
    Wait Until Element Is Visible    //*[@id="resultStats"]    1s    Search response time longer than 1s
    [Teardown]    Close Browser
