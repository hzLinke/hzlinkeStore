import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath } from 'url'
import path from 'path'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

export default defineConfig({
  base: process.env.NODE_ENV === 'production' ? '/reportsDesign/V4x' : '/',
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src')
    }
  },
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@use "@/assets/css/common.scss" as *;`,
        api: 'modern-compiler'
      }
    }
  },
  server: {
    port: 3006
  },
  build: {
    sourcemap: true
  }
})
