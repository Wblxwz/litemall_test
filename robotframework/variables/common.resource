*** Settings ***
Library    ../lib/custom_random.py

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
