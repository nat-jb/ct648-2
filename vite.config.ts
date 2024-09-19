import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000, // ตั้งพอร์ตที่ต้องการให้ Vite ใช้
    host: '0.0.0.0', // เปิดรับการเชื่อมต่อจากเครือข่ายภายนอก
  },

})
