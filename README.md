
main.tsx:

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

