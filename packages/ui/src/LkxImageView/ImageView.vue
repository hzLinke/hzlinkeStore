<template>
    <Teleport to="body">
        <div v-if="open" id="imageView" class="imageView">
            <div v-if="mask" class="imageView-mask" @click="handleClose" @contextmenu.prevent="handleClose"></div>
            <div class="imageView-content" @contextmenu.prevent="handleClose">
                <img
                    id="img"
                    border="0"
                    :src="imageUrl"
                    :style="{ height: `${height}px` }"
                    @wheel="imageZoom"
                    @contextmenu.stop="handleImageContextmenu"
                />
            </div>
        </div>
    </Teleport>
</template>

<script setup lang="ts">
import { ref } from 'vue'

interface Props {
    mask?: boolean
    open: boolean
    imageUrl?: string
    imageMaxHeight?: number
    imageMinHeight?: number
    css?: string
}

const props = withDefaults(defineProps<Props>(), {
    mask: true,
    imageUrl: '',
    imageMaxHeight: 5000,
    imageMinHeight: 100,
    css: ''
})

const emit = defineEmits<{
    close: []
}>()

const height = ref(200)

const imageZoom = (e: WheelEvent) => {
    if (e.deltaY > 0) {
        if (height.value < props.imageMaxHeight) {
            height.value = height.value * 1.1
        }
    } else {
        if (height.value > props.imageMinHeight) {
            height.value = height.value / 1.1
        }
    }
}

const handleClose = () => {
    emit('close')
    document.oncontextmenu = () => {
        // 关闭右击菜单功能
        return false
    }
}

const handleImageContextmenu = () => {
    document.oncontextmenu = () => {
        // 打开右击菜单功能
        return true
    }
}
</script>

<style lang="scss">
.imageView {
    position: fixed;
    justify-content: center;
    align-items: center;
    top: 50%;
    left: 50%;
    width: 100%;
    height: 100%;
    transform: translate(-50%, -50%);
    font-size: 14px;
    z-index: 9999999999999;

    &-mask {
        width: 100vw;
        height: 100vh;
        background-color: rgba($color: #000000, $alpha: 0.6);
    }

    &-content {
        position: absolute;
        height: 80%;
        width: 80%;
        top: 50%;
        left: 50%;
        z-index: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px dashed white;
        transform: translate(-50%, -50%);
        overflow: auto;

        img {
            width: auto;
            height: auto;
            cursor: zoom-in;
        }
    }
}
</style>
