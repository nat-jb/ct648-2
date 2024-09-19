
main.tsx:ในโปรเจกต์ React ทำหน้าที่เป็นจุดเริ่มต้นของแอปพลิเคชัน

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


app.tsx: ในโปรเจกต์ React ทำหน้าที่เป็น component หลัก ของแอปพลิเคชัน

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


คำสั่ง upload ขึ้น GitHub

- git init

- git remote add origin https://github.com/nat-jb/ct648-2.git

- git add .

- git commit -m "Initial commit"

- git push -u origin master

คำสั่ง Clone จาก Github ลงที่ AWS EC2 เพื่อรันใช้งานต่อไป
- git clone https://github.com/nat-jb/ct648-2.git

คำสั่ง build และ run docker ที่ AWS EC2

- docker build -t my-react-app .

- docker run -p 80:3000 my-react-app

