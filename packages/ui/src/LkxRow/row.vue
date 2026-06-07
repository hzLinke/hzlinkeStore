<template>
    <div ref="rowx" class="row" :style="rowStyle" :class="rowClass">
        <slot></slot>
    </div>
</template>

<script setup lang="ts">
import { computed, ref, provide } from 'vue'
import type { RowProps } from './types'

const props = withDefaults(defineProps<RowProps>(), {
    align: 'left'
})

provide('gutter', props.gutter)

const rowx = ref<HTMLElement | null>(null)

const rowStyle = computed(() => {
    const gutter = Number(props.gutter) || 0
    return {
        marginLeft: `${gutter / 2}px`,
        marginRight: `${gutter / 2}px`
    }
})

const rowClass = computed(() => {
    return props.align ? `align-${props.align}` : ''
})
</script>
<style scoped lang="scss">
    .row {
        padding: 3px 0;
        display: flex;
        flex-wrap: wrap;        // 允许换行，当row的两个col的span值都为24时，就呈现两行
        &.align-left{
            justify-content: flex-start;
        }
        &.align-right{
            justify-content: flex-end;
        }
        &.align-center{
            justify-content: center;
        }
    }
</style>