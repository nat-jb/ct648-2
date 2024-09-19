# ใช้ Bun และ Node.js ในฐานะ Base Image
FROM bun/with-node:latest

# ตั้งค่า working directory
WORKDIR /app

# คัดลอก package.json และ bun.lockb
COPY package.json bun.lockb ./

# ติดตั้ง dependencies
RUN bun install

# คัดลอกโค้ดทั้งหมด
COPY . .

# รันการ build (หากต้องการ)
RUN bun run build

# เปิดพอร์ตที่แอปจะทำงาน
EXPOSE 3000

# รันแอป
CMD ["bun", "run", "dev"]
