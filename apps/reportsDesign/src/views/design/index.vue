<template>
  <div class="design-page">
    <!-- 顶部工具栏 -->
    <header class="toolbar">
      <div class="toolbar-left">
        <div class="btn-group">
          <button class="toolbar-btn">
            <span class="icon">🆕</span>新建
          </button>
          <button class="toolbar-btn">
            <span class="icon">📂</span>打开
          </button>
          <button class="toolbar-btn">
            <span class="icon">💾</span>保存
          </button>
        </div>
        <div class="divider"></div>
        <div class="btn-group">
          <button class="toolbar-btn" :disabled="!canUndo">
            <span class="icon">↩️</span>撤销
          </button>
          <button class="toolbar-btn" :disabled="!canRedo">
            <span class="icon">↪️</span>重做
          </button>
        </div>
        <div class="divider"></div>
        <div class="btn-group">
          <button class="toolbar-btn">
            <span class="icon">👁️</span>预览
          </button>
          <button class="toolbar-btn">
            <span class="icon">📤</span>导出JSON
          </button>
          <button class="toolbar-btn">
            <span class="icon">🖨️</span>打印
          </button>
        </div>
      </div>
      <div class="toolbar-right">
        <button class="toolbar-btn">
          <span class="icon">⚙️</span>纸张配置
        </button>
        <span class="page-size">A4 (210×297mm)</span>
      </div>
    </header>

    <!-- 主内容区 -->
    <div class="main-container">
      <!-- 左侧组件库 -->
      <aside class="component-panel">
        <div class="panel-title">📦 组件库</div>
        <div class="component-list">
          <div class="component-item" draggable="true" @dragstart="onDragStart('text')">
            <span class="icon">🏷️</span>
            <span class="label">文本标签</span>
          </div>
          <div class="component-item" draggable="true" @dragstart="onDragStart('barcode')">
            <span class="icon">📊</span>
            <span class="label">条码</span>
          </div>
          <div class="component-item" draggable="true" @dragstart="onDragStart('qrcode')">
            <span class="icon">🔲</span>
            <span class="label">二维码</span>
          </div>
          <div class="component-item" draggable="true" @dragstart="onDragStart('table')">
            <span class="icon">📋</span>
            <span class="label">表格</span>
          </div>
          <div class="component-item" draggable="true" @dragstart="onDragStart('line')">
            <span class="icon">➖</span>
            <span class="label">线条</span>
          </div>
          <div class="component-item" draggable="true" @dragstart="onDragStart('image')">
            <span class="icon">🖼️</span>
            <span class="label">图片</span>
          </div>
        </div>
      </aside>

      <!-- 中间画布区 -->
      <main class="canvas-area">
        <div class="canvas-container">
          <!-- A4纸张 -->
          <div class="a4-paper">
            <!-- 页眉区 -->
            <div class="region header-region" :style="{ height: headerHeight + 'px' }">
              <div class="region-label">页眉区</div>
              <div class="region-content" :style="{ height: (headerHeight - 4) + 'px' }">
                <div class="placeholder-text">拖拽组件到此处（单据标题、客户信息等）</div>
              </div>
              <div class="resize-handle" @mousedown="(e) => onResizeStart(e, 'header')"></div>
            </div>
            <!-- 明细区 -->
            <div class="region detail-region" :style="{ height: detailHeight + 'px' }">
              <div class="region-label">明细区</div>
              <div class="region-content" :style="{ height: (detailHeight - 4) + 'px' }">
                <div class="placeholder-text">拖拽组件到此处（产品明细表格）</div>
              </div>
            </div>
            <!-- 页脚区 -->
            <div class="region footer-region" :style="{ height: footerHeight + 'px' }">
              <div class="region-label">页脚区</div>
              <div class="region-content" :style="{ height: (footerHeight - 4) + 'px' }">
                <div class="placeholder-text">拖拽组件到此处（合计金额、签字栏、条码等）</div>
              </div>
              <div class="resize-handle" @mousedown="(e) => onResizeStart(e, 'footer')"></div>
            </div>
          </div>
        </div>
      </main>

      <!-- 右侧属性面板 -->
      <aside class="property-panel">
        <div class="panel-title">⚡ 属性面板</div>
        <div class="property-tabs">
          <div class="tab active">组件属性</div>
          <div class="tab">数据绑定</div>
          <div class="tab">样式设置</div>
        </div>
        <div class="property-content">
          <div class="empty-state">请选择画布上的组件进行设置</div>
        </div>
      </aside>
    </div>

    <!-- 底部状态栏 -->
    <footer class="statusbar">
      <span class="status-item">✅ 就绪</span>
      <span class="status-item">|</span>
      <span class="status-item">组件数: {{ componentCount }}</span>
      <span class="status-item">|</span>
      <span class="status-item">💾 已保存</span>
      <span class="status-item">|</span>
      <span class="status-item">🕐 {{ currentTime }}</span>
    </footer>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const canUndo = ref(false)
const canRedo = ref(false)
const componentCount = ref(0)
const currentTime = ref('')

// A4 纸张内容区高度 (297mm ≈ 1123px - 上下padding各20px = 1083px, 再减去边距约111px = 972px)
const PAPER_CONTENT_HEIGHT = 972
const MIN_REGION_HEIGHT = 40
const MAX_REGION_HEIGHT = 400

// 区域高度
const headerHeight = ref(120)
const footerHeight = ref(150)
const detailHeight = ref(PAPER_CONTENT_HEIGHT - 120 - 150) // 702px

let timer: number

const updateTime = () => {
  const now = new Date()
  currentTime.value = now.toLocaleTimeString('zh-CN')
}

onMounted(() => {
  updateTime()
  timer = window.setInterval(updateTime, 1000)
})

onUnmounted(() => {
  clearInterval(timer)
})

const onDragStart = (type: string) => {
  console.log('拖拽开始:', type)
}

// 拖拽调整高度
let isResizing = false
let resizeTarget: 'header' | 'footer' | null = null
let startY = 0
let startHeight = 0

const onResizeStart = (e: MouseEvent, target: 'header' | 'footer') => {
  isResizing = true
  resizeTarget = target
  startY = e.clientY
  startHeight = target === 'header' ? headerHeight.value : footerHeight.value
  document.addEventListener('mousemove', onResizeMove)
  document.addEventListener('mouseup', onResizeEnd)
}

const onResizeMove = (e: MouseEvent) => {
  if (!isResizing || !resizeTarget) return
  const delta = e.clientY - startY
  
  if (resizeTarget === 'header') {
    // 页眉高度变化，明细区自适应
    const newHeaderHeight = Math.max(MIN_REGION_HEIGHT, Math.min(MAX_REGION_HEIGHT, startHeight + delta))
    const availableHeight = PAPER_CONTENT_HEIGHT - newHeaderHeight - footerHeight.value
    if (availableHeight >= MIN_REGION_HEIGHT) {
      headerHeight.value = newHeaderHeight
      detailHeight.value = availableHeight
    }
  } else {
    // 页脚高度变化，明细区自适应
    const newFooterHeight = Math.max(MIN_REGION_HEIGHT, Math.min(MAX_REGION_HEIGHT, startHeight + delta))
    const availableHeight = PAPER_CONTENT_HEIGHT - headerHeight.value - newFooterHeight
    if (availableHeight >= MIN_REGION_HEIGHT) {
      footerHeight.value = newFooterHeight
      detailHeight.value = availableHeight
    }
  }
}

const onResizeEnd = () => {
  isResizing = false
  resizeTarget = null
  document.removeEventListener('mousemove', onResizeMove)
  document.removeEventListener('mouseup', onResizeEnd)
}
</script>

<style scoped lang="scss">
.design-page {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  background: #f5f5f5;
  overflow: hidden;
}

// 顶部工具栏
.toolbar {
  height: 48px;
  background: #fff;
  border-bottom: 1px solid #e0e0e0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 16px;
  flex-shrink: 0;

  .toolbar-left {
    display: flex;
    align-items: center;
    gap: 12px;

    .btn-group {
      display: flex;
      gap: 4px;
    }

    .toolbar-btn {
      display: flex;
      align-items: center;
      gap: 4px;
      padding: 6px 12px;
      border: 1px solid #d9d9d9;
      background: #fff;
      border-radius: 4px;
      cursor: pointer;
      font-size: 13px;
      color: #333;
      transition: all 0.2s;

      &:hover:not(:disabled) {
        background: #f0f0f0;
        border-color: #1890ff;
        color: #1890ff;
      }

      &:disabled {
        opacity: 0.5;
        cursor: not-allowed;
      }

      .icon {
        font-size: 14px;
      }
    }

    .divider {
      width: 1px;
      height: 24px;
      background: #e0e0e0;
    }
  }

  .toolbar-right {
    display: flex;
    align-items: center;
    gap: 12px;

    .page-size {
      font-size: 13px;
      color: #666;
      background: #f5f5f5;
      padding: 4px 12px;
      border-radius: 4px;
    }
  }
}

// 主内容区
.main-container {
  flex: 1;
  display: flex;
  overflow: hidden;
}

// 左侧组件库
.component-panel {
  width: 200px;
  background: #fafafa;
  border-right: 1px solid #e0e0e0;
  display: flex;
  flex-direction: column;
  flex-shrink: 0;

  .panel-title {
    height: 40px;
    display: flex;
    align-items: center;
    padding: 0 16px;
    font-size: 14px;
    font-weight: 500;
    color: #333;
    border-bottom: 1px solid #e0e0e0;
  }

  .component-list {
    flex: 1;
    padding: 12px;
    overflow-y: auto;

    .component-item {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px 16px;
      margin-bottom: 8px;
      background: #fff;
      border: 1px solid #e0e0e0;
      border-radius: 6px;
      cursor: move;
      transition: all 0.2s;

      &:hover {
        border-color: #1890ff;
        background: #e6f7ff;
        box-shadow: 0 2px 8px rgba(24, 144, 255, 0.15);
      }

      .icon {
        font-size: 20px;
      }

      .label {
        font-size: 13px;
        color: #333;
      }
    }
  }
}

// 中间画布区
.canvas-area {
  flex: 1;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  overflow: auto;
  padding: 24px;

  .canvas-container {
    .a4-paper {
      width: 210mm;
      height: 297mm;
      background: #fff;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
      padding: 20px;
      box-sizing: border-box;

      .region {
        border: 2px dashed #d9d9d9;
        border-radius: 4px;
        margin-bottom: 12px;
        position: relative;
        transition: border-color 0.2s;

        &:hover {
          border-color: #1890ff;
        }

        &.header-region {
          .region-content {
            width: 100%;
          }
        }

        &.detail-region {
          .region-content {
            width: 100%;
          }
        }

        &.footer-region {
          margin-bottom: 0;
        }

        .resize-handle {
          position: absolute;
          left: 0;
          right: 0;
          bottom: -6px;
          height: 12px;
          cursor: ns-resize;
          z-index: 10;
          display: flex;
          align-items: center;
          justify-content: center;

          &::before {
            content: '';
            width: 40px;
            height: 4px;
            background: #d9d9d9;
            border-radius: 2px;
            transition: background 0.2s;
          }

          &:hover::before {
            background: #1890ff;
          }
        }

        .region-label {
          position: absolute;
          top: -10px;
          left: 12px;
          background: #1890ff;
          color: #fff;
          font-size: 11px;
          padding: 2px 8px;
          border-radius: 3px;
          z-index: 1;
        }

        .region-content {
          display: flex;
          align-items: center;
          justify-content: center;

          .placeholder-text {
            color: #bfbfbf;
            font-size: 13px;
          }
        }
      }
    }
  }
}

// 右侧属性面板
.property-panel {
  width: 280px;
  background: #fafafa;
  border-left: 1px solid #e0e0e0;
  display: flex;
  flex-direction: column;
  flex-shrink: 0;

  .panel-title {
    height: 40px;
    display: flex;
    align-items: center;
    padding: 0 16px;
    font-size: 14px;
    font-weight: 500;
    color: #333;
    border-bottom: 1px solid #e0e0e0;
  }

  .property-tabs {
    display: flex;
    border-bottom: 1px solid #e0e0e0;

    .tab {
      flex: 1;
      height: 36px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 13px;
      color: #666;
      cursor: pointer;
      transition: all 0.2s;

      &:hover {
        color: #1890ff;
      }

      &.active {
        color: #1890ff;
        border-bottom: 2px solid #1890ff;
      }
    }
  }

  .property-content {
    flex: 1;
    padding: 24px;

    .empty-state {
      text-align: center;
      color: #999;
      font-size: 13px;
      padding: 40px 0;
    }
  }
}

// 底部状态栏
.statusbar {
  height: 28px;
  background: #f0f0f0;
  border-top: 1px solid #e0e0e0;
  display: flex;
  align-items: center;
  padding: 0 16px;
  gap: 12px;
  flex-shrink: 0;

  .status-item {
    font-size: 12px;
    color: #666;
  }
}
</style>
