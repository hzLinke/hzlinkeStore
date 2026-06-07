<template>
  <div class="home-page">
    <header class="header">
      <h1>报表设计器</h1>
      <div class="actions">
        <button @click="goToDesign">新建报表</button>
      </div>
    </header>
    <main class="main-content">
      <div class="welcome">
        <h2>欢迎使用报表设计器</h2>
        <p>点击"新建报表"开始设计您的报表</p>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'

const router = useRouter()

const goToDesign = () => {
  router.push('/design')
}
</script>

<style scoped lang="scss">
.home-page {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;

  .header {
    height: 60px;
    background: #1890ff;
    color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 24px;

    h1 {
      font-size: 20px;
      font-weight: 500;
    }

    .actions {
      button {
        padding: 8px 16px;
        background: white;
        color: #1890ff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;

        &:hover {
          opacity: 0.9;
        }
      }
    }
  }

  .main-content {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f5f5f5;

    .welcome {
      text-align: center;

      h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 16px;
      }

      p {
        font-size: 14px;
        color: #666;
      }
    }
  }
}
</style>
