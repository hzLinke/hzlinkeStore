<template>
    <div
        ref="containerRef"
        class="text-scroll-container"
        :style="containerStyle"
        @mouseenter="handleMouseEnter"
        @mouseleave="handleMouseLeave"
        @click="handleClick"
    >
        <div
            ref="contentRef"
            class="text-scroll-content"
            :class="{ 'text-scroll-animating': isAnimating }"
            :style="contentStyle"
        >
            <span class="text-scroll-text">{{ props.text }}</span>
            <span v-if="needClone" class="text-scroll-text text-scroll-clone">{{ props.text }}</span>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, watch, nextTick } from 'vue'
import type { TextScrollProps } from './types'

const props = withDefaults(defineProps<TextScrollProps>(), {
    speed: 50,
    direction: 'left',
    loop: true,
    hoverPause: true,
    width: '100%',
    fontSize: 14,
    color: '#333333',
    backgroundColor: 'transparent'
})

const containerRef = ref<HTMLDivElement>()
const contentRef = ref<HTMLDivElement>()
const containerWidth = ref(0)
const contentWidth = ref(0)
const isAnimating = ref(false)
const isPaused = ref(false)
const needClone = ref(false)

// 容器样式
const containerStyle = computed(() => ({
    width: typeof props.width === 'number' ? `${props.width}px` : props.width,
    backgroundColor: props.backgroundColor
}))

// 内容样式
const contentStyle = computed(() => {
    const styles: Record<string, string> = {
        color: props.color,
        fontSize: typeof props.fontSize === 'number' ? `${props.fontSize}px` : props.fontSize
    }

    if (isAnimating.value && !isPaused.value) {
        const distance = needClone.value ? contentWidth.value / 2 : contentWidth.value
        const duration = distance / props.speed
        styles.animationDuration = `${duration}s`
        styles.animationDirection = props.direction === 'right' ? 'reverse' : 'normal'
    }

    return styles
})

// 检查是否需要滚动
const checkNeedScroll = async () => {
    await nextTick()
    if (!containerRef.value || !contentRef.value) return

    containerWidth.value = containerRef.value.offsetWidth
    const textSpan = contentRef.value.querySelector('.text-scroll-text') as HTMLElement
    if (textSpan) {
        contentWidth.value = textSpan.offsetWidth
    }

    // 当文字宽度超过容器宽度时需要滚动
    const shouldScroll = contentWidth.value > containerWidth.value

    if (shouldScroll && props.loop) {
        needClone.value = true
        // 等待克隆渲染完成
        await nextTick()
        if (contentRef.value) {
            contentWidth.value = contentRef.value.scrollWidth
        }
    } else {
        needClone.value = false
    }

    isAnimating.value = shouldScroll
}

// 鼠标进入
const handleMouseEnter = () => {
    if (props.hoverPause) {
        isPaused.value = true
    }
}

// 鼠标离开
const handleMouseLeave = () => {
    if (props.hoverPause) {
        isPaused.value = false
    }
}

const emit = defineEmits<{
    click: [event: MouseEvent]
}>()

const handleClick = (e: MouseEvent) => {
    emit('click', e)
}

// 监听文字变化
watch(() => props.text, () => {
    isAnimating.value = false
    needClone.value = false
    nextTick(() => {
        checkNeedScroll()
    })
})

// 监听容器宽度变化
watch(() => props.width, () => {
    nextTick(() => {
        checkNeedScroll()
    })
})

let resizeObserver: ResizeObserver | null = null

onMounted(() => {
    checkNeedScroll()

    // 使用 ResizeObserver 监听容器大小变化
    if (containerRef.value && typeof ResizeObserver !== 'undefined') {
        resizeObserver = new ResizeObserver(() => {
            checkNeedScroll()
        })
        resizeObserver.observe(containerRef.value)
    }
})

onUnmounted(() => {
    if (resizeObserver) {
        resizeObserver.disconnect()
    }
})
</script>

<style lang="scss" scoped>
.text-scroll-container {
    overflow: hidden;
    white-space: nowrap;
    position: relative;
}

.text-scroll-content {
    display: inline-flex;
    align-items: center;
    white-space: nowrap;

    &.text-scroll-animating {
        animation-name: text-scroll-marquee;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
    }

    &:hover {
        animation-play-state: paused;
    }
}

.text-scroll-text {
    display: inline-block;
    padding-right: 30px;
}

.text-scroll-clone {
    padding-right: 30px;
}

@keyframes text-scroll-marquee {
    0% {
        transform: translateX(0);
    }
    100% {
        transform: translateX(-50%);
    }
}
</style>
