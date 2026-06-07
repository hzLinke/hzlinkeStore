import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath } from 'url'
import path from 'path'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

export default defineConfig({
  base: process.env.NODE_ENV === 'production' ? '/V4x' : '/',
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src') //tsconfig.json 中要增加 baseUrl 和 paths 配置，不然 @/ 别名无法解析
    }
  },
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@use "@/assets/css/lkxCommon.scss" as *;`,
        api: 'modern-compiler'
      }
    }
  },
  server: {
    port: 3000
  }
})
