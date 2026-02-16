*** Settings ***
Library    Browser
Resource    variables/test.resource
Resource    variables/common.resource

*** Variables ***
${Browser}    chromium

*** Keywords ***
LogIn
    [Documentation]
    ...    登录功能实现
    ...    参数：用户名，密码
    ...    返回值：无
    [Arguments]
    ...    ${username}    ${password}
    New Page    url=${login_url}
    Fill Text    css=input[name="user"]    txt=${username}
    Fill Text    css=input[name="password"]    txt=${password}
    Click    css=button.van-button--danger.van-button--large
    
*** Test Cases ***
LogInToUserSuccess
    [Tags]    Auto-1
    [Documentation]
    ...    用户成功登录
    LogIn    username=${default_username}    password=${default_password}
    Wait For Condition    Text    xpath=//*[@id="app"]/div[2]/div[1]/div[2]    contains    ${default_username}

SignUpSuccess
    [Tags]    Auto-1
    [Documentation]
    ...    用户成功注册
    New Page    url=${signup_url}
    ${phone_number}=    RandomNum    length=10
    ${phone_number}=    Evaluate    "1" + str(${phone_number})
    Fill Text    xpath=//*[@id="app"]/div[2]/div[2]/div[1]/input    txt=${phone_number}
    Click    css=button.van-button--danger.van-button--large
    Fill Text    xpath=//*[@id="app"]/div[2]/div[1]/div[1]/input    txt=${code}
    ${custom_username}=    Custom Random Str
    ${custom_password}=    Custom Random Str
    Fill Text    xpath=//*[@id="app"]/div[2]/div[2]/div[1]/input    txt=${custom_username}
    Fill Text    xpath=//*[@id="app"]/div[2]/div[3]/div[1]/input    txt=${custom_password}
    Fill Text    xpath=//*[@id="app"]/div[2]/div[4]/div[1]/input    txt=${custom_password}
    Click    css=button.van-button--danger.van-button--large
    Wait For Condition    Text    xpath=//*[@id="app"]/div[2]/div[1]/div    contains    注册成功
    LogIn    username=${custom_username}    password=${custom_password}
    Wait For Condition    Text    xpath=//*[@id="app"]/div[2]/div[1]/div[2]    contains    ${custom_username}
