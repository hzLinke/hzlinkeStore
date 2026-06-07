<template>
    <div class="accordion">
        <div 
            v-for="(item, index) in items" 
            :key="index" 
            class="accordion-item"
        >
            <div 
                class="accordion-header" 
                @click="handleHeaderClick(index)"
            >
                <span class="accordion-title">{{ item.title }}</span>
                <icons 
                    class="accordion-icon" 
                    :type="item.open ? 'arrowUp' : 'arrowDown'"
                />
            </div>
            <div class="accordion-content" v-show="item.open">
                <div class="accordion-content-inner">
                    <slot :name="`content-${index}`" :item="item" :index="index">
                        {{ item.content }}
                    </slot>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import type {AccordionDataType} from './types'
import Icons from '../LkxIcons/Icons.vue'

interface AccordionProps {
    items: AccordionDataType[];
    multiple?: boolean;
}

const props = withDefaults(defineProps<AccordionProps>(), {
    items: () => [],
    multiple: false
})

const emit = defineEmits<{
    (e: 'change', index: number, item: AccordionDataType): void;
}>()

const handleHeaderClick = (index: number) => {
    const item = props.items[index]
    item.open = !item.open
    
    if (!props.multiple && item.open) {
        props.items.forEach((otherItem, otherIndex) => {
            if (otherIndex !== index) {
                otherItem.open = false
            }
        })
    }
    
    emit('change', index, item)
}
</script>

<style lang="scss" scoped>
.accordion {
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
}

.accordion-item {
    border-bottom: 1px solid #ddd;

    &:last-child {
        border-bottom: none;
    }
}

.accordion-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 16px;
    background: #f5f5f5;
    cursor: pointer;
    transition: background 0.3s;

    &:hover {
        background: #e8e8e8;
    }
}

.accordion-title {
    font-weight: 500;
    color: #333;
}

.accordion-icon {
    font-size: 16px;
    color: #666;
    transition: transform 0.3s;
}

.accordion-content {
    background: #fff;
    overflow: hidden;
}

.accordion-content-inner {
    padding: 16px;
    color: #666;
    line-height: 1.6;
}
</style>
