<template>
  <Teleport to="body">
    <Transition name="modal"  @after-leave="handleAfterLeave" >
      <dialog
        v-if="visible"
        key="modal-dialog"
        ref="dialogRef"
        class="modal"
        :style="dialogStyle"
        @click="handleDialogClick"
        @cancel="handleDialogCancel"
        @close="handleDialogClose"
      >
        <!-- 标题栏 -->
        <div
          v-if="title"
          class="modal__header"
          @mousedown="handleMouseDown"
        >
          <span class="modal__title">{{ title }}</span>
          <span class="modal__close" @click="handleClose(ModalResultEnum.mrClose)">
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
              :is = "content"
              :parent-instance="currentInstance"
              v-bind="$attrs"
            />
            <span v-else>{{ content }}</span>
          </slot>
        </div>
        <div class="modal__footer">
          <slot name = "footer"></slot>
        </div>
      </dialog>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { ref, computed, watch, nextTick, useTemplateRef, getCurrentInstance, type VNode,type Component } from 'vue'
import { ModalResultEnum, type ModalOptions, type ModalResultValue } from './types'

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
const position = ref({ x: 0, y: 0 })
const isDragging = ref(false)
const dragOffset = ref({ x: 0, y: 0 })
const resultValue = ref<ModalResultValue>({action:ModalResultEnum.mrClose,data:null});
  // 获取当前组件实例
const currentInstance = getCurrentInstance()

const dialogStyle = computed(() => ({
  width: `${props.width}px`,
  height: `${props.height}px`,
  left: `${position.value.x}px`,
  top: `${position.value.y}px`
}))


// 保存原始的 body 样式
let originalBodyStyle: string | null = null
let originalBodyPaddingRight: string | null = null

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
  switch (_position) {
    case 'left':
      x = 0
      break
    case 'center':
      x = (vw - props.width) / 2
      break
    case 'right':
      x = vw - props.width
      break
    default:
      x = (vw - props.width) / 2
  }

  position.value = {
    x,
    y: Math.max(0, (vh - dialogHeight) / 2)
  }
}

// 显示/隐藏 dialog
watch(() => props.visible, (newVal) => {
  if (newVal) {
    preventBodyScroll()
    nextTick(() => {
      if (dialogRef.value) { 
        dialogRef.value.showModal()
        initModalPosition(props.position)
      }
    })
  } else {
    // 重置位置状态，确保下次打开时有动画
    position.value = { x: 0, y: 0 }
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

  let newX = event.clientX - dragOffset.value.x
  let newY = event.clientY - dragOffset.value.y

  // 边界检查
  const dialog = dialogRef.value
  const dialogWidth = dialog.offsetWidth || props.width
  const dialogHeight = dialog.offsetHeight || 400
  const vw = window.innerWidth
  const vh = window.innerHeight

  newX = Math.max(0, Math.min(newX, vw - dialogWidth))
  newY = Math.max(0, Math.min(newY, vh - dialogHeight))

  position.value = { x: newX, y: newY }
}

const handleMouseUp = () => {
  isDragging.value = false
  document.removeEventListener('mousemove', handleMouseMove)
  document.removeEventListener('mouseup', handleMouseUp)
}

const handleAfterLeave = () => {
  restoreBodyScroll()
}
const handleDialogCancel = () => {
  // 按 Esc 键触发（原生 dialog 行为）
  resultValue.value = {action:ModalResultEnum.mrCancel,data:null}
  handleDialogClose()
}

const handleDialogClose = ()=>{
 
  props.closeModal?.(resultValue.value)
  emit('close')
  emit('update:visible', false)  // 支持 v-model 双向绑定
}

const handleClose = (action: ModalResultEnum,data?:any) => {
  if (dialogRef.value) {
    dialogRef.value.close()
  }
  resultValue.value = {action,data}
}

const handleDialogClick = (event: MouseEvent) => {
  if (props.closeOnClickMask && event.target === dialogRef.value) {
    resultValue.value = {action:ModalResultEnum.mrCancel,data:null}
    handleDialogClose()
  }
}

defineExpose({
  close: handleDialogClose,
  resultValue
})
</script>

<style scoped lang="scss">
.modal {
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  border: none;
  padding: 0;
  margin: 0;
  position: fixed;
  outline: none;
  &::backdrop {
    background-color: rgba(0, 0, 0, 0.5);
  }
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
  max-height: calc(100vh - 200px);
  overflow-y: auto;
}

/* 模态框动画 - 更自然流畅 */
.modal-enter-active {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.modal-leave-active {
  transition: all 0.3ss cubic-bezier(0.4, 0, 0.2, 1);
}

.modal-enter-from {
  opacity: 0;
  transform: scale(0.9) translateY(-20px);
}

.modal-leave-to {
  opacity: 0;
  transform: scale(0.95) translateY(-10px);
}
</style>
