*** Settings ***
Library           SeleniumLibrary
Suite Setup       เปิดเบราว์เซอร์และเข้าสู่ระบบ
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://reg.up.ac.th/app/main
${BROWSER}        chrome
${USERNAME}       67022759
${PASSWORD}       ${EMPTY}    # ใส่ผ่าน Terminal: python -m robot -v "PASSWORD:xxx"

*** Keywords ***
เปิดเบราว์เซอร์และเข้าสู่ระบบ
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # รอให้ปุ่มเข้าสู่ระบบปรากฏ (เพิ่มเวลาเป็น 15 วินาที)
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'login')]    timeout=15s
    Click Element    xpath=//a[contains(@href, 'login')]
    
    # รอหน้า Login โหลด
    Wait Until Element Is Visible    id=username    timeout=15s
    Input Text       id=username    ${USERNAME}
    Input Password   id=password    ${PASSWORD}
    
    # หากมี Captcha ให้เอา # หน้า Sleep ออกแล้วกรอกเองใน 10 วินาที
    # Sleep    10s
    
    Click Button     xpath=//button[@type='submit']
    # ตรวจสอบว่าเข้าหน้าหลักสำเร็จ (เช็คจากรหัสนิสิตบนหน้าจอ)
    Wait Until Page Contains    ${USERNAME}    timeout=15s

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
    [Documentation]    รันตามเงื่อนไขภาพแรก (เลือกเกรดแต่ไม่กดคำนวณจริง)
    ไปที่เมนูทดลองคำนวณเกรด
    Wait Until Element Is Visible    xpath=(//select)[1]    timeout=10s
    Select From List By Label    xpath=(//select)[1]    A
    # Click Button    xpath=//button[contains(.,'คำนวณ')]
    Capture Page Screenshot    tc1_result.png
    Sleep    3s

F03.2_TC2 ประเมินอาจารย์ที่ปรึกษา
    [Documentation]    รันตามเงื่อนไขภาพที่สอง (กรอกข้อมูลแต่ไม่กดบันทึกจริง)
    ไปที่เมนูประเมินอาจารย์ที่ปรึกษา
    Wait Until Element Is Visible    xpath=//input[@type='number']    timeout=10s
    Input Text      xpath=//input[@type='number']    5
    Click Element   xpath=(//input[@type='radio'])[1]
    # Click Button    xpath=//button[contains(.,'บันทึก')]
    Capture Page Screenshot    tc2_result.png
    Sleep    3s