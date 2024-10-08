# main.tsx:ในโปรเจกต์ React ทำหน้าที่เป็นจุดเริ่มต้นของแอปพลิเคชัน

1. นำเข้า:
- React: ใช้สำหรับ JSX
- ReactDOM: ใช้ในการเรนเดอร์ React component
- App: Component หลักของแอป
- ./index.css: ไฟล์ CSS สำหรับสไตล์

2. สร้าง Root:
- ใช้ ReactDOM.createRoot() เพื่อสร้าง root ที่จะเรนเดอร์แอป

3. การเรนเดอร์:
- root.render(): เรนเดอร์ App ลงใน DOM ของ element ที่มี id เป็น root
- React.StrictMode: เปิดใช้งานโหมด strict สำหรับการพัฒนา

# app.tsx: ในโปรเจกต์ React ทำหน้าที่เป็น component หลัก ของแอปพลิเคชัน

1. State Variables:
- prices: ข้อมูลราคาของสกุลเงินดิจิทัล
- loading: ตรวจสอบสถานะการโหลด
- error: ข้อความข้อผิดพลาด
2. fetchPrices Function:
- ดึงข้อมูลราคาจาก CoinGecko API  https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,litecoin&vs_currencies=usd
- แปลงข้อมูลให้ตรงกับรูปแบบที่ใช้
- จัดการข้อผิดพลาด
3. useEffect Hook:
- เรียก fetchPrices เมื่อโหลด component
- ตั้ง interval เพื่ออัปเดตข้อมูลทุก 20 วินาที
- ล้าง interval เมื่อ component ถูก unmount
4. การแสดงผลใน JSX:
- แสดง "Loading..." ขณะโหลดข้อมูล
- แสดงข้อผิดพลาดหากมี
- แสดงราคาสกุลเงินและเปรียบเทียบกับราคาก่อนหน้า
- ใช้ increase และ decrease class เพื่อแสดงการเปลี่ยนแปลงของราคา

# แก้ไขไฟล์ vite.config.ts
เพิ่มตำสั่งเพื่อใช้ port 3000
server: {
    port: 3000, // ตั้งพอร์ตที่ต้องการให้ Vite ใช้
    host: '0.0.0.0', // เปิดรับการเชื่อมต่อจากเครือข่ายภายนอก
  },

# สร้างคำสั่ง Dockerfile เพื่อติดตั้ง Library ที่จำเป็น

- FROM node:latest

ติดตั้ง Bun
- RUN curl -fsSL https://bun.sh/install | bash

ตั้งค่า PATH
- ENV PATH="/root/.bun/bin:$PATH"

ตั้งค่า working directory
- WORKDIR /app

คัดลอกไฟล์ package.json และ bun.lockb
- COPY package.json bun.lockb ./

ติดตั้ง dependencies
- RUN bun install

คัดลอกโค้ดทั้งหมดไปยัง working directory
- COPY . .

เปิดพอร์ตที่แอปจะทำงาน
- EXPOSE 3000

รันคำสั่งที่กำหนดเมื่อ container เริ่มต้น
- CMD ["bun", "run", "dev"]


# คำสั่ง upload ขึ้น GitHub

- git init

- git remote add origin https://github.com/nat-jb/ct648-2.git

- git add .

- git commit -m "Initial commit"

- git push -u origin master

# คำสั่ง Clone จาก Github ติดตั้งที่ AWS EC2 เพื่อใช้งานต่อไป
- git clone https://github.com/nat-jb/ct648-2.git

# คำสั่ง build และ run docker ที่ AWS EC2

- docker build -t my-react-app .

- docker run -d -p 80:3000 my-react-app

