<template>
    <div class="col" :class="colClass" :style="colStyle">
        <slot></slot>
    </div>
</template>

<script setup lang="ts">
import { computed, inject, onMounted, ref } from 'vue'

import type { ColProps, ResponsiveConfig } from './types'

const validator = (value: unknown): boolean => {
    if (!value || typeof value !== 'object') return true
    const keys = Object.keys(value as Record<string, unknown>)
    return keys.every(key => ['span', 'offset'].includes(key))
}

const props = withDefaults(defineProps<ColProps>(), {})

const gutter = inject<number | string>('gutter', 0)

const internalGutter = ref(Number(gutter))

onMounted(() => {
    internalGutter.value = Number(gutter)
})

const createClasses = (obj?: ResponsiveConfig, prefix = ''): string[] => {
    if (!obj) return []
    const classes: string[] = []
    if (obj.span) classes.push(`col-${prefix}${obj.span}`)
    if (obj.offset) classes.push(`offset-${prefix}${obj.offset}`)
    return classes
}

const colClass = computed(() => [
    ...createClasses({ span: props.span, offset: props.offset }),
    ...createClasses(props.ipad, 'ipad-'),
    ...createClasses(props.narrowPc, 'narrow-pc-'),
    ...createClasses(props.pc, 'pc-'),
    ...createClasses(props.widePc, 'wide-pc-')
])

const colStyle = computed(() => ({
    paddingLeft: `${internalGutter.value / 2}px`,
    paddingRight: `${internalGutter.value / 2}px`
}))
</script>
<style scoped lang="scss">
    @use "sass:math";
    .col {
        box-sizing:border-box;//box-sizing设置成border-box，所以这时候设置padding，content的宽度就会变小，然后列与列之间的分隔就出来了
        $class-prefix: col-;
        @for $n from 1 through 24 {
            &.#{$class-prefix}#{$n} {
                width: math.div($n, 24) * 100%;
            }
        }
        $class-prefix: offset-;
        @for $n from 1 through 24 {
            &.#{$class-prefix}#{$n} {
                margin-left: math.div($n, 24) * 100%;
            }
        }
        @media (min-width: 577px) {
            $class-prefix: col-ipad-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    width: math.div($n, 24) * 100%;
                }
            }
            $class-prefix: offset-ipad-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    margin-left: math.div($n, 24) * 100%;
                }
            }
        }
        @media (min-width: 769px) { // 770
            $class-prefix: col-narrow-pc-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    width: math.div($n, 24) * 100%;
                }
            }
            $class-prefix: offset-narrow-pc-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    margin-left: math.div($n, 24) * 100%;
                }
            }
        }
        @media (min-width: 993px) {
            $class-prefix: col-pc-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    width: math.div($n, 24) * 100%;
                }
            }
            $class-prefix: offset-pc-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    margin-left: math.div($n, 24) * 100%;
                }
            }
        }
        @media (min-width: 1201px) {
            $class-prefix: col-wide-pc-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    width: math.div($n, 24) * 100%;
                }
            }
            $class-prefix: offset-wide-pc-;
            @for $n from 1 through 24 {
                &.#{$class-prefix}#{$n} {
                    margin-left: math.div($n, 24) * 100%;
                }
            }
        }
    }
</style>