*** Settings ***
Resource    ../variables/common.resource

*** Test Cases ***
LogIn Success
    [Tags]    Auto-1
    [Documentation]
    ...    超级管理员成功登录
    AdminLogIn    url=${admin_url}    username=${super_admin_username}    password=${super_admin_password}
    Get Text    xpath=//span[text()="用户管理"]    contains    用户管理

LogIn Fail By UserName
    [Tags]    Auto-1
    [Documentation]
    ...    超级管理员登录失败
    AdminLogIn    url=${admin_url}    username=${wrong_username}    password=${super_admin_password}
    Get Text    xpath=//p[text()="用户帐号或密码不正确"]    contains    用户帐号或密码不正确

LogIn Fail By Password
    [Tags]    Auto-1
    [Documentation]
    ...    超级管理员登录失败
    AdminLogIn    url=${admin_url}    username=${super_admin_username}    password=${wrong_password}
    Get Text    xpath=//p[text()="用户帐号或密码不正确"]    contains    用户帐号或密码不正确    