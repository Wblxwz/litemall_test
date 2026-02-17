*** Settings ***
Library    Browser
Library    ../lib/custom_random.py
Resource    test.resource

*** Keywords ***
RandomNum
    [Documentation]
    ...    作用：生成指定长度的数字字符串
    ...    参数：字符串长度
    ...    返回值：指定位数的随机数字字符串
    [Arguments]    ${length}
    ${num_str}=    Custom Random Num    length=${length}
    RETURN    ${num_str}

RandomStr
    [Documentation]
    ...    作用：生成随机长度的混合字符串
    ...    参数：无
    ...    返回值：随机长度的混合字符串
    ${str}=    Custom Random Str
    RETURN    ${str}

LogIn
    [Documentation]
    ...    登录功能实现
    ...    参数：用户名，密码
    ...    返回值：无
    [Arguments]
    ...    ${url}    ${username}    ${password}
    New Page    url=${url}
    Fill Text    css=input[name="user"]    txt=${username}
    Fill Text    css=input[name="password"]    txt=${password}
    Click    css=button.van-button--danger.van-button--large

AdminLogIn
    [Documentation]
    ...    登录功能实现
    ...    参数：用户名，密码
    ...    返回值：无
    [Arguments]
    ...    ${url}    ${username}    ${password}
    New Page    url=${url}
    Fill Text    css=input[name="username"]    txt=${username}
    Fill Text    css=input[name="password"]    txt=${password}
    Click    css=button.el-button.el-button--primary.el-button--mini