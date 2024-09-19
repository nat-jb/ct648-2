# ใช้ Bun Official Docker Image
FROM bun/bun:latest

# ตั้งค่า working directory
WORKDIR /app

# คัดลอก package.json และ bun.lockb
COPY package.json bun.lockb ./

# ติดตั้ง dependencies
RUN bun install

# คัดลอกโค้ดทั้งหมด
COPY . .

# รันการ build (ถ้าจำเป็น)
RUN bun run build

# เปิดพอร์ตที่แอปจะทำงาน
EXPOSE 3000

# รันแอป
CMD ["bun", "run", "dev"]
