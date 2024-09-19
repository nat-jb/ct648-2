FROM node:latest

# ตั้งค่า working directory
WORKDIR /app

# ติดตั้ง Bun
RUN curl -fsSL https://bun.sh/install | bash

# ตั้งค่าพาธให้ Bun
ENV PATH="/root/.bun/bin:${PATH}"

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
