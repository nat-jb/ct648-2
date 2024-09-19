# ใช้ Node.js Image
FROM node:latest

# ติดตั้ง Bun
RUN curl -fsSL https://bun.sh/install | bash

# ตั้งค่า PATH
ENV PATH="/root/.bun/bin:$PATH"

# ตั้งค่า working directory
WORKDIR /app

# คัดลอกไฟล์ package.json และ bun.lockb
COPY package.json bun.lockb ./

# ติดตั้ง dependencies
RUN bun install

# คัดลอกโค้ดทั้งหมดไปยัง working directory
COPY . .

# เปิดพอร์ตที่แอปจะทำงาน
EXPOSE 3000

# รันคำสั่งที่กำหนดเมื่อ container เริ่มต้น
CMD ["bun", "run", "dev"]
