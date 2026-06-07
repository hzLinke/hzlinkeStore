<template>
  <Teleport to="body">
    <div
      v-if="visible"
      class="modal-wrapper"
      @click="handleDialogClick"
      @keydown.stop="handleKeyDown"
    >
      <div
        ref="backdropRef"
        class="modal-backdrop"
        tabindex="0"
      ></div>
      <div
        ref="dialogRef"
        class="modal"
        :style="dialogStyle"
      >
        <!-- 标题栏 -->
        <div
          v-if="title"
          class="modal__header"
          @mousedown="handleMouseDown"
        >
          <span class="modal__title">{{ title }}</span>
          <span class="modal__close" @click.stop="handleClose(ModalResultEnum.mrClose)">
            <slot name="closeIcon">
              <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M13 1L1 13M1 1L13 13" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
              </svg>
            </slot>
          </span>
        </div>
        <!-- 内容区域 -->
        <div class="modal__body">
          <slot>
            <component v-if="typeof content !== 'string'" 
              :is="content"
              :parent-instance="currentInstance"
              v-bind="$attrs"
            />
            <span v-else>{{ content }}</span>
          </slot>
        </div>
      </div>
    </div>
  </Teleport>
</template>

<script setup lang="ts">
import { ref, computed, watch, nextTick, useTemplateRef, getCurrentInstance } from 'vue'
import { ModalResultEnum, type ModalOptions, type ModalResultValue } from './types'

defineOptions({
  inheritAttrs: false
})

const props = withDefaults(defineProps<ModalOptions>(), {
  title: '',
  width: 500,
  position: 'center',
  closeOnClickMask: true
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'close'): void
}>()

const dialogRef = useTemplateRef('dialogRef')
const backdropRef = useTemplateRef('backdropRef')
const position = ref({ x: 0, y: 0 })
const isDragging = ref(false)
const dragOffset = ref({ x: 0, y: 0 })
const resultValue = ref<ModalResultValue>({action:ModalResultEnum.mrClose,data:null});
  // 获取当前组件实例
const currentInstance = getCurrentInstance()

const dialogStyle = computed(() => {
  const widthValue = typeof props.width === 'string' ? props.width : `${props.width}px`
  const heightValue = props.height ? (typeof props.height === 'string' ? props.height : `${props.height}px`) : 'auto'
  return {
    width: widthValue,
    height: heightValue,
    left: `${position.value.x}px`,
    top: `${position.value.y}px`
  }
})


// 保存原始的 body 样式
let originalBodyStyle: string | null = null
let originalBodyPaddingRight: string | null = null
// 保存打开模态框前的活动元素
let previousActiveElement: Element | null = null

// 阻止 body 滚动
function preventBodyScroll() {
  // 保存原始样式
  originalBodyStyle = document.body.style.overflow
  originalBodyPaddingRight = document.body.style.paddingRight
  
  // 计算滚动条宽度
  const scrollbarWidth = window.innerWidth - document.documentElement.clientWidth
  
  // 阻止滚动并添加右侧 padding 以避免页面跳动
  document.body.style.overflow = 'hidden'
  if (scrollbarWidth > 0) {
    document.body.style.paddingRight = `${scrollbarWidth}px`
  }
}

// 恢复 body 滚动
function restoreBodyScroll() {
  // 恢复原始样式
  document.body.style.overflow = originalBodyStyle || ''
  document.body.style.paddingRight = originalBodyPaddingRight || ''
  // 重置保存的样式
  originalBodyStyle = null
  originalBodyPaddingRight = null
}
// 初始化位置
const initModalPosition = (_position: 'left' | 'center' | 'right') => {
  if (!dialogRef.value) return

  const dialog = dialogRef.value
  const vw = window.innerWidth
  const vh = window.innerHeight
  const dialogHeight = dialog.offsetHeight || 400

  let x: number
  let actualWidth: number
  
  if (typeof props.width === 'string' && props.width.includes('%')) {
    actualWidth = vw * (parseFloat(props.width) / 100)
  } else if (typeof props.width === 'number') {
    actualWidth = props.width
  } else {
    actualWidth = dialog.offsetWidth || 500
  }

  switch (_position) {
    case 'left':
      x = 0
      break
    case 'center':
      x = (vw - actualWidth) / 2
      break
    case 'right':
      x = vw - actualWidth
      break
    default:
      x = (vw - actualWidth) / 2
  }

  position.value = {
    x,
    y: Math.max(0, (vh - dialogHeight) / 2)
  }
}

const handleKeyDown = (event: KeyboardEvent) => {
  const target = event.target as HTMLElement
  const tagName = target.tagName
  
  switch (event.key) {
    case 'Escape':
      event.preventDefault()
      resultValue.value = { action: ModalResultEnum.mrCancel, data: null }
      handleDialogClose()
      break;
    case 'Enter':
      if (tagName === 'TEXTAREA' || tagName === 'INPUT') return
      event.preventDefault()
      console.log(props.defaultButton)
      resultValue.value = { action: props.defaultButton||ModalResultEnum.mrCancel, data: null }
      handleDialogClose()
      break;
  }
}

// 在 capture 阶段监听 ESC 键，优先于子组件的 keydown.stop
const handleGlobalKeyDown = (event: KeyboardEvent) => {
  if (!props.visible) return
  if (event.key === 'Escape') {
    event.preventDefault()
    event.stopPropagation()
    resultValue.value = { action: ModalResultEnum.mrCancel, data: null }
    handleDialogClose()
  }
}

// 显示/隐藏 dialog
watch(() => props.visible, (newVal) => {
  if (newVal) {
    // 保存当前活动元素
    previousActiveElement = document.activeElement
    // 在 capture 阶段注册键盘事件监听，优先于子组件处理 ESC
    document.addEventListener('keydown', handleGlobalKeyDown, true)
    preventBodyScroll()
    nextTick(() => {
      if (dialogRef.value) { 
        initModalPosition(props.position)
      }
      // 聚焦到 backdrop 元素以接收键盘事件
      backdropRef.value?.focus()
    })
  } else {
    // 移除 capture 阶段的键盘事件监听
    document.removeEventListener('keydown', handleGlobalKeyDown, true)
    // 重置位置状态
    position.value = { x: 0, y: 0 }
    // 恢复 body 滚动
    restoreBodyScroll()
    // 还原焦点到之前的活动元素
    if (previousActiveElement instanceof HTMLElement) {
      previousActiveElement.focus()
    }
    previousActiveElement = null
  }
}, { immediate: true })

// 拖拽逻辑
const handleMouseDown = (event: MouseEvent) => {
  if (!dialogRef.value) return

  const dialog = dialogRef.value
  const rect = dialog.getBoundingClientRect()

  isDragging.value = true
  dragOffset.value = {
    x: event.clientX - rect.left,
    y: event.clientY - rect.top
  }

  document.addEventListener('mousemove', handleMouseMove)
  document.addEventListener('mouseup', handleMouseUp)
}

const handleMouseMove = (event: MouseEvent) => {
  if (!isDragging.value || !dialogRef.value) return

  const newX = event.clientX - dragOffset.value.x
  const newY = event.clientY - dragOffset.value.y

  position.value = { x: newX, y: newY }
}

const handleMouseUp = () => {
  isDragging.value = false
  document.removeEventListener('mousemove', handleMouseMove)
  document.removeEventListener('mouseup', handleMouseUp)
}

const handleDialogClose = () => {
  props.closeModal?.(resultValue.value)
  emit('close')
  emit('update:visible', false)
}

const handleClose = (action: ModalResultEnum, data?: any) => {
  resultValue.value = { action, data }
  handleDialogClose()
}

const handleDialogClick = (event: MouseEvent) => {
  if (props.closeOnClickMask && event.target === event.currentTarget) {
    resultValue.value = { action: ModalResultEnum.mrCancel, data: null }
    handleDialogClose()
  }
}

defineExpose({
  close: handleDialogClose,
  resultValue
})
</script>

<style scoped lang="scss">
.modal-wrapper {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 1000;
}

.modal-backdrop {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  outline: none;
}

.modal {
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  border: none;
  padding: 0;
  margin: 0;
  position: absolute;
  outline: none;
  z-index: 1001;
  display: flex;
  flex-direction: column;
}

.modal__header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 5px 20px;
  background-color: #f5f7fa;
  border-bottom: 1px solid #e4e7ed;
  cursor: move;
  user-select: none;
}

.modal__title {
  font-size: 16px;
  font-weight: 500;
  color: #303133;
}

.modal__close {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 24px;
  height: 24px;
  cursor: pointer;
  color: #909399;
  transition: color 0.2s, background-color 0.2s;
  border-radius: 4px;

  &:hover {
    color: #409eff;
    background-color: #ecf5ff;
  }
}

.modal__body {
  flex:1;
  overflow-y: auto;
}
</style>
