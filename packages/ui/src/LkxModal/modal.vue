<template>
    <Teleport to="body">
        <div v-if="modalConfig.open" class="modal" :style="{ zIndex: modalConfig.zIndex }">
            <div class="modal-mask" @click="maskClose"></div>
            <div
                ref="Win"
                class="modal-content"
                tabindex="100"
                :style="{ width: modalConfig.width }"
                @keyup.stop.prevent="handleKeyUp"
            >
                <div
                    class="modal-header"
                    @mousedown.prevent="handleHeaderMouseDown"
                    @mousemove="handleHeaderMouseMove"
                    @mouseup="handleHeaderMouseUp"
                >
                    <slot name="header">{{ modalConfig.title }}</slot>
                </div>
                <div class="modal-body" :style="{ height: modalConfig.height }" @mousedown="handleMouseDown">
                    <slot></slot>
                </div>
                <div v-if="!modalConfig.hideFooter" class="modal-footer">
                    <slot name="footer">
                        <span class="modal-footer-note">{{ modalConfig.note }}</span>
                        <button v-if="modalConfig.showCancel" class="modal-button" @click="closeModal('mrCancel')">
                            {{ modalConfig.CancelCaption }}
                        </button>
                        <button type="submit" class="modal-button modal-button-primary" @click="closeModal('mrOk')">
                            {{ modalConfig.OkCaption }}
                        </button>
                    </slot>
                </div>
                <div class="modal-close" @click="closeModal('mrClose')"></div>
            </div>
        </div>
    </Teleport>
</template>

<script setup lang="ts">
import { reactive, ref, watch, nextTick } from 'vue'
import type { ModalConfigProps } from './types'

const props = defineProps<{
    datas?: Record<string, unknown>
    rowIndex?: number
    config?: Partial<ModalConfigProps>
}>()

const emit = defineEmits<{
    ok: []
    close: [data: { type: string; datas: Record<string, unknown>; rowIndex: number }]
}>()

const defaultConfig: ModalConfigProps = {
    open: false,
    title: '',
    hideFooter: false,
    width: '500px',
    height: 'auto',
    maskClosable: false,
    zIndex: 9000,
    showCancel: true,
    OkCaption: '确定',
    CancelCaption: '取消',
    note: ''
}

const modalConfig = reactive({ ...defaultConfig, ...props.config })

const elementParams = reactive({
    x: 0,
    y: 0,
    l: 0,
    t: 0,
    isDown: false
})

const Win = ref<HTMLElement | null>(null)
const activeElement = ref<Element | null>(null)

const initPosition = () => {
    if (Win.value) {
        if (!Win.value.style.left) {
            const rect = Win.value.getBoundingClientRect()
            Win.value.style.left = `${(window.innerWidth - rect.width) / 2}px`
            Win.value.style.top = `${(window.innerHeight - rect.height) / 2}px`
        }
    }
}

const closeModal = (type: string) => {
    if (type === 'mrOk') {
        const els = document.querySelectorAll('.modal-body input[pattern]') as NodeListOf<HTMLInputElement>
        let checkStatus = els.length === 0

        for (let i = 0; i < els.length; i++) {
            const regStr = els[i].pattern
            const reg = new RegExp(regStr)
            const curVal = (els[i] as HTMLInputElement & { dataset: { curval?: string } }).dataset.curval

            if (!reg.test(curVal || '')) {
                els[i].parentElement!.style.borderColor = 'red'
                checkStatus = false
                break
            } else {
                els[i].parentElement!.style.borderColor = ''
                checkStatus = true
            }
        }

        if (checkStatus) {
            emit('close', { type, datas: props.datas || {}, rowIndex: props.rowIndex || -1 })
        }
    } else {
        emit('close', { type, datas: props.datas || {}, rowIndex: props.rowIndex || -1 })
        activeElement.value && (activeElement.value as HTMLElement).focus()
    }
}

const maskClose = () => {
    if (modalConfig.maskClosable) {
        closeModal('mrClose')
    }
}

const handleMouseDown = (e: MouseEvent) => {
    const target = e.target as HTMLElement
    if (target.tagName !== 'INPUT' && target.tagName !== 'TEXTAREA') {
        e.preventDefault()
    }
}

const handleHeaderMouseDown = (e: MouseEvent) => {
    elementParams.x = e.clientX
    elementParams.y = e.clientY
    elementParams.l = (Win.value as HTMLDivElement)?.offsetLeft || 0
    elementParams.t = (Win.value as HTMLDivElement)?.offsetTop || 0
    elementParams.isDown = true
    ;(e.target as HTMLDivElement).style.cursor = 'move'
}

const handleHeaderMouseMove = (e: MouseEvent) => {
    if (elementParams.isDown && Win.value) {
        const nx = e.clientX
        const ny = e.clientY
        const nl = nx - (elementParams.x - elementParams.l)
        const nt = ny - (elementParams.y - elementParams.t)
        Win.value.style.left = `${nl}px`
        Win.value.style.top = `${nt}px`
    }
}

const handleHeaderMouseUp = (e: MouseEvent) => {
    elementParams.isDown = false
    ;(e.target as HTMLDivElement).style.cursor = 'default'
}

const handleKeyUp = (e: KeyboardEvent) => {
    if (e.key === 'Escape') {
        closeModal('mrClose')
    }
}

watch(
    () => props.config?.open,
    newVal => {
        if (newVal !== undefined) modalConfig.open = newVal
        if (newVal) {
            nextTick(() => {
                initPosition()
                Win.value?.focus()
            })
        }
    }
)

watch(
    () => props.config?.title,
    newVal => {
        if (newVal !== undefined) modalConfig.title = newVal
    }
)

nextTick(() => {
    activeElement.value = document.activeElement
})
</script>
<style lang="scss" scoped>
.modal {
    position:fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    &-mask {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba($color: #000000, $alpha: 0.4);
    }
    &-content {
        position: relative;
        outline: 0;
        background-color: #fff;
        border-radius: 8px;
        z-index: 1;
    }
    &-header {
        padding: 8px 16px;
        border-bottom: 1px solid #e4e7ed;
    }
    &-footer {
        padding: 5px 16px;
        border-top: 1px solid #e4e7ed;
        text-align: right;
        &-note{
            position: absolute;
            left: 10px;
            padding-top: 5px;
            color: red;
            max-width: 600px;
        }
    }
    &-body {
        padding: 10px;
        max-height: 600px;
        overflow: auto;
    }
    &-close {
        position: absolute;
        top: 5px;
        right: 12px;
        width: 16px;
        height: 16px;
        cursor: pointer;
        &::before,
        &::after {
            content: "";
            display: block;
            position: absolute;
            left: 8px;
            top: 0;
            width: 1px;
            height: 16px;
            background-color: #999;
            border-radius: 0.5px;
            transform: rotate(-45deg);
            z-index: -1;
        }
        &::before {
            transform: rotate(45deg);
        }
        &:hover::before,
        &:hover::after {
            background-color: red;
        }
    }
    &-button {
        line-height: 1em;
        font-size: 14px;
        padding: 8px 20px;
        border: 1px solid #dcdfe6;
        outline: none;
        display: inline-block;
        border-radius: 4px;
        cursor: pointer;
        background-color: #fff;
        transition: 0.1s;
        &:hover {
            color: #409eff;
            border-color: #c6e2ff;
            background-color: #ecf5ff;
        }
        & + & {
            margin-left: 10px;
        }

        &-primary {
            background-color: #2d8cf0;
            border-color: #2d8cf0;
            color: white;
            &:hover {
                background: #66b1ff;
                border-color: #66b1ff;
                color: #fff;
            }
        }
    }
}
</style>