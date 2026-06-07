<template>
    <span
        class="lkx-icon"
        :class="`lkx-icon-${type}`"
        :style="{ color, fontSize }"
        @mousedown="onClick"
    ></span>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import type { IconsProps } from './types'

const props = withDefaults(defineProps<IconsProps>(), {
    size: 14
})

const emit = defineEmits<{
    butClick: [event: MouseEvent]
}>()

const fontSize = computed(() => `${props.size}px`)

const onClick = (e: MouseEvent) => {
    emit('butClick', e)
}
</script>

<style>
@import url("./iconfont.css");
</style>
