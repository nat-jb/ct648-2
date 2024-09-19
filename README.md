
main.tsx
โค้ดนี้เป็นจุดเริ่มต้นในการรันแอปพลิเคชัน React โดยทำหน้าที่หลักในการสร้าง root component และทำการเรนเดอร์ (render) component หลักของแอปพลิเคชัน (App) ลงใน DOM ของหน้าเว็บจริง

การทำงาน:
import statements:

React: นำเข้า React library เพื่อให้สามารถใช้ JSX และการทำงานของ React ได้
ReactDOM: นำเข้า ReactDOM library ที่ใช้สำหรับการเรนเดอร์ component ลงใน DOM
App: นำเข้า component หลักของแอปพลิเคชันจากไฟล์ App.tsx ที่จะถูกแสดงในหน้าเว็บ
./index.css: นำเข้าไฟล์ CSS เพื่อใช้กำหนดสไตล์ในแอปพลิเคชัน
สร้าง root ด้วย ReactDOM.createRoot:

document.getElementById('root'): ดึง element ที่มี id เป็น root จาก HTML เพื่อเป็นที่เรนเดอร์เนื้อหาของแอป
ReactDOM.createRoot(): สร้าง "root" ที่จะใช้ในการเรนเดอร์แอปทั้งหมดเข้าไปใน element นั้น
การเรนเดอร์ App component:

root.render(): เรียกใช้คำสั่งเพื่อเรนเดอร์ component ที่เราต้องการ ซึ่งในที่นี้คือ component App
React.StrictMode: ใช้เพื่อเปิดใช้งานโหมด strict ของ React ที่จะช่วยในการตรวจจับข้อผิดพลาดหรือพฤติกรรมที่ไม่ถูกต้องในการพัฒนา (ไม่ได้ใช้ใน production)
สรุป:
โค้ดนี้ทำการสร้าง root ของแอปและแสดงผล component หลัก (App) ลงในหน้า HTML โดยจุดที่เรนเดอร์คือ element ที่มี id เป็น root

app.tsx
React component ชื่อว่า App ที่ทำหน้าที่ในการดึงข้อมูลราคาของสกุลเงินดิจิทัล (Bitcoin, Ethereum, Litecoin) จาก API ของ CoinGecko และแสดงผลข้อมูลเหล่านั้นบนหน้าเว็บ โดยทำงานดังนี้:

โครงสร้างหลัก:
State Variables:

prices: ใช้สำหรับเก็บข้อมูลราคาของสกุลเงินดิจิทัล
loading: ใช้ตรวจสอบสถานะว่ากำลังดึงข้อมูลอยู่หรือไม่
error: ใช้สำหรับเก็บข้อความเมื่อมีข้อผิดพลาดเกิดขึ้น
fetchPrices Function:

ดึงข้อมูลราคาของ Bitcoin, Ethereum, และ Litecoin จาก API ของ CoinGecko.
เมื่อได้รับข้อมูลมาแล้ว จะทำการแปลงข้อมูลให้อยู่ในรูปแบบของ CoinPrice ซึ่งประกอบด้วย id (ชื่อของสกุลเงินดิจิทัล), price (ราคาปัจจุบัน), และ prevPrice (ราคาก่อนหน้า).
ในกรณีที่ไม่สามารถดึงข้อมูลได้หรือมีปัญหา เช่น การตอบสนองของเครือข่ายไม่ถูกต้อง จะจับข้อผิดพลาดและแสดงข้อความ.
useEffect Hook:

เมื่อ component โหลดขึ้น จะเรียกใช้ fetchPrices เพื่อดึงข้อมูลราคาสกุลเงินดิจิทัล.
มีการตั้ง setInterval เพื่อเรียกใช้ fetchPrices ทุก ๆ 20 วินาที เพื่อให้ข้อมูลอัปเดตตามเวลาจริง.
เมื่อ component ถูก unmount (เช่น เปลี่ยนหน้า) จะทำการล้าง interval เพื่อหยุดการเรียก API.
การแสดงผลใน JSX:

หาก loading กำลังทำงานอยู่ จะขึ้นข้อความว่า "Loading..."
หากเกิดข้อผิดพลาด จะแสดงข้อความข้อผิดพลาดที่ error
หากข้อมูลถูกโหลดสำเร็จ จะแสดงราคาสกุลเงินดิจิทัล และเปรียบเทียบราคาปัจจุบันกับราคาก่อนหน้า:
หากราคาขึ้น จะเพิ่ม class increase
หากราคาลด จะเพิ่ม class decrease
หากไม่มีการเปลี่ยนแปลง จะไม่เพิ่ม class ใด ๆ
Class ในการกำหนดสี:
increase: ใช้สำหรับแสดงราคาเพิ่มขึ้น
decrease: ใช้สำหรับแสดงราคาลดลง

คำสั่ง upload ขึ้น GitHub
git init

git remote add origin https://github.com/nat-jb/ct648-2.git

git add .

git commit -m "Initial commit"

git push -u origin master



docker build -t my-react-app .

docker run -p 80:3000 my-react-app

