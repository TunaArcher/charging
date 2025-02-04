# 🚗 Evx Charging

Evx Charging เป็นแอปพลิเคชันสำหรับค้นหาสถานีชาร์จรถยนต์ไฟฟ้า (EV) ที่พัฒนาด้วย **Flutter** สำหรับฝั่ง Mobile Application และ **Node.js** สำหรับ API backend

## 📌 คุณสมบัติของระบบ
- 🔍 **ค้นหาสถานีชาร์จ** ได้แบบเรียลไทม์
- 📍 **แสดงตำแหน่ง** ของสถานีชาร์จบนแผนที่
- ⚡ **แสดงรายละเอียดจุดชาร์จ** (ประเภทของหัวชาร์จ, ค่าใช้จ่าย, ความพร้อมให้บริการ)
- 📊 **ระบบรีวิวและให้คะแนน** สถานีชาร์จจากผู้ใช้งาน
- 🔗 **เชื่อมต่อ API ภายนอก** เพื่อดึงข้อมูลสถานีชาร์จ
- 👤 **ระบบบัญชีผู้ใช้** สำหรับบันทึกประวัติการใช้งานและสถานีชาร์จที่ชื่นชอบ

## 🏗 เทคโนโลยีที่ใช้
### Frontend (Mobile Application)
- **Flutter** (Dart)
- **Google Maps API** (สำหรับแสดงแผนที่)
- **Provider / Riverpod** (State Management)

### Backend (API)
- **Node.js** (Express.js)
- **MongoDB / PostgreSQL** (Database)
- **JWT** (Authentication)
- **RESTful API**

## 🔧 การติดตั้งและใช้งาน
### 1️⃣ ติดตั้ง Mobile Application
```sh
# Clone โปรเจกต์
git clone https://github.com/TunaArcher/charging.git
cd charging

# ติดตั้ง dependencies
flutter pub get

# Run บน Emulator หรือ Device จริง
flutter run
```

### 2️⃣ ติดตั้ง Backend API อยู่อีก Repository -> https://github.com/TunaArcher/api.evx
```sh
# Clone โปรเจกต์ API
cd backend

# ติดตั้ง dependencies
npm install

# กำหนดค่าตัวแปรสภาพแวดล้อม
cp .env.example .env

# Run server
npm start
```

## 📜 License
โปรเจกต์นี้อยู่ภายใต้สัญญาอนุญาต MIT License - ดูไฟล์ [LICENSE](LICENSE) สำหรับรายละเอียดเพิ่มเติม

---

