# Software-Testing-_Quiz02
# 🤖 Project: Automation Testing with Robot Framework (reg.up.ac.th)

โปรเจกต์นี้เป็นการทดสอบ Automation สำหรับระบบบริการการศึกษา มหาวิทยาลัยพะเยา ในส่วนของเมนู **ทดลองคำนวณเกรด** และ **ประเมินอาจารย์ที่ปรึกษา**

## 📂 โครงสร้างไฟล์ในโปรเจกต์
- `testRF02.robot`: ไฟล์สคริปต์หลักสำหรับรันการทดสอบ
- `.gitignore`: ใช้สำหรับยกเว้นไฟล์ที่ไม่จำเป็น (เช่น log, report, .venv) ไม่ให้ขึ้น GitHub
- `README.md`: คู่มือการใช้งาน

## 🔐 ข้อมูลสำคัญด้านความปลอดภัย
เพื่อความปลอดภัย ข้อมูล **Password** จะไม่ได้ถูกระบุไว้ในซอร์สโค้ดโดยตรง (Hard-coded) แต่จะใช้วิธีรับค่าผ่าน Command Line (Arguments) ในขณะรันการทดสอบ

## 🚀 วิธีการรันการทดสอบ (How to Run)
กรุณาเปิด Terminal ในโฟลเดอร์ของโปรเจกต์ และใช้คำสั่งดังนี้:

```bash
python -m robot -v PASSWORD:RockZee040848@ testRF02.robot