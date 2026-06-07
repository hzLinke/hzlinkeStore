<template>
  <div class="preview-page">
    <header class="header">
      <div class="left">
        <button class="back-btn" @click="goBack">返回设计</button>
        <span class="title">报表预览</span>
      </div>
      <div class="right">
        <button @click="print">打印</button>
        <button @click="exportReport">导出</button>
      </div>
    </header>
    <main class="preview-content">
      <div class="report-container">
        <h2>报表预览区域</h2>
        <p>这里显示设计好的报表内容</p>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'

const router = useRouter()

const goBack = () => {
  router.back()
}

const print = () => {
  window.print()
}

const exportReport = () => {
  alert('导出功能开发中...')
}
</script>

<style scoped lang="scss">
.preview-page {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  background: #f0f2f5;

  .header {
    height: 50px;
    background: #fff;
    border-bottom: 1px solid #e8e8e8;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;

    .left {
      display: flex;
      align-items: center;
      gap: 16px;

      .back-btn {
        padding: 6px 12px;
        background: #f5f5f5;
        border: 1px solid #d9d9d9;
        border-radius: 4px;
        cursor: pointer;

        &:hover {
          background: #e8e8e8;
        }
      }

      .title {
        font-size: 16px;
        font-weight: 500;
      }
    }

    .right {
      display: flex;
      gap: 8px;

      button {
        padding: 6px 16px;
        background: #1890ff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;

        &:hover {
          background: #40a9ff;
        }
      }
    }
  }

  .preview-content {
    flex: 1;
    padding: 24px;
    overflow: auto;

    .report-container {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      min-height: 800px;
      border-radius: 4px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      padding: 48px;

      h2 {
        text-align: center;
        margin-bottom: 24px;
        color: #333;
      }

      p {
        text-align: center;
        color: #999;
      }
    }
  }
}

@media print {
  .header {
    display: none !important;
  }

  .preview-content {
    padding: 0 !important;
    background: white !important;
  }

  .report-container {
    box-shadow: none !important;
  }
}
</style>
