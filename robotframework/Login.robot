*** Settings ***
Library    Browser
Resource    variables/test.resource

*** Variables ***
${Browser}    chromium

*** Keywords ***
LogIn
    [Documentation]
    ...    登录功能实现
    ...    参数：无
    ...    返回值：无
    New Page    url=${url}
    Fill Text    css=input[name="user"]    txt=${username}
    Fill Text    css=input[name="password"]    txt=${password}
    Click    css=button.van-button--danger.van-button--large
    Wait For Condition    Text    xpath=//*[@id="app"]/div[2]/div[1]/div[2]    contains    ${username}
    
*** Test Cases ***
LogInToUser
    LogIn

