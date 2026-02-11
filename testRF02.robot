*** Settings ***
Library           SeleniumLibrary
Suite Setup       เปิดเบราว์เซอร์และเข้าสู่ระบบ
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://reg.up.ac.th/app/main
${BROWSER}        chrome
${USERNAME}       67022759
${PASSWORD}       ${EMPTY}

*** Keywords ***
เปิดเบราว์เซอร์และเข้าสู่ระบบ
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[contains(.,'เข้าสู่ระบบ')]
    Click Element    xpath=//a[contains(.,'เข้าสู่ระบบ')]
    Input Text       id=username    ${USERNAME}
    Input Password   id=password    ${PASSWORD}
    # Sleep    10s
    Click Button     xpath=//button[@type='submit']
    Wait Until Page Contains    ยินดีต้อนรับ    timeout=10s

ไปที่เมนูทดลองคำนวณเกรด
    Click Element    xpath=//span[contains(text(),'ประมวลผลการเรียน')]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'ทดลองคำนวณ')]
    Click Element    xpath=//a[contains(text(),'ทดลองคำนวณ')]

ไปที่เมนูประเมินอาจารย์ที่ปรึกษา
    Click Element    xpath=//span[contains(text(),'ประเมินการเรียนการสอน')]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'ประเมินอาจารย์ที่ปรึกษา')]
    Click Element    xpath=//a[contains(text(),'ประเมินอาจารย์ที่ปรึกษา')]

*** Test Cases ***
F01.1_TC1 ทดลองคำนวณเกรด
    ไปที่เมนูทดลองคำนวณเกรด
    Wait Until Element Is Visible    xpath=(//select)[1]
    Select From List By Label    xpath=(//select)[1]    A
    # Click Button    xpath=//button[contains(.,'คำนวณ')]
    Capture Page Screenshot    tc1_result.png
    Sleep    3s

F03.2_TC2 ประเมินอาจารย์ที่ปรึกษา
    ไปที่เมนูประเมินอาจารย์ที่ปรึกษา
    Wait Until Element Is Visible    xpath=//input[@type='number']
    Input Text      xpath=//input[@type='number']    5
    Click Element   xpath=(//input[@type='radio'])[1]
    # Click Button    xpath=//button[contains(.,'บันทึก')]
    Capture Page Screenshot    tc2_result.png
    Sleep    3s