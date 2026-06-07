import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath } from 'url'
import path from 'path'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

export default defineConfig({
  base: process.env.NODE_ENV === 'production' ? '/orderlist' : '/',
  plugins: [vue()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
      'onnxruntime-web': 'onnxruntime-web/dist/ort.min.js'
    }
  },
  optimizeDeps: {
    exclude: ['@xenova/transformers', 'onnxruntime-web'],
    esbuildOptions: {
      target: 'es2020'
    }
  },
  build: {
    target: 'es2020',
    commonjsOptions: {
      transformMixedEsModules: true
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
    port: 3003,
    headers: {
      'Cross-Origin-Opener-Policy': 'same-origin-allow-popups',
      'Cross-Origin-Embedder-Policy': 'require-corp'
    },
    fs: {
      allow: ['..']
    }
  }
})
