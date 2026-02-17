*** Settings ***
Resource    ../variables/common.resource
    
*** Test Cases ***
LogIn Success
    [Tags]    Auto-1
    [Documentation]
    ...    用户成功登录
    LogIn    url=${login_url}    username=${default_username}    password=${default_password}
    Wait For Condition    Text    xpath=//*[@id="app"]/div[2]/div[1]/div[2]    contains    ${default_username}

LogIn Fail By UserName
    [Tags]    Auto-1
    [Documentation]
    ...    用户登录失败
    LogIn    url=${login_url}    username=${wrong_username}    password=${default_password}
    Get Text    css=div.van-toast__text    contains    账号不存在

LogIn Fail By Password
    [Tags]    Auto-1
    [Documentation]
    ...    用户登录失败
    LogIn    url=${login_url}    username=${default_username}    password=${wrong_password}
    Get Text    css=div.van-toast__text    contains    账号密码不对
