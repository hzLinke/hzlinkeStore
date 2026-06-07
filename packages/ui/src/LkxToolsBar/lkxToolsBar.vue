<template>
    <div class="_toolsbar">
        <div v-for="(groupItem, groupIndex) in toolsBarItems" :key="groupIndex" class="toolsbar-group">
            <span v-if="groupItem.Separate" class="toolsbar-Separate"></span>
            <span
                v-else
                class="toolsbar-button-content"
                :class="{ 'toolsbar-button-rightIcon iconfont iconArrawDown': groupItem.dropDown }"
                @mousedown.stop.prevent="handleClick(groupItem.idCode, groupItem.index, groupItem.dropDown||false, groupItem)"
            >
                <div v-if="!groupItem.dropDown && showIcon" class="toolsbar-button" :class="groupItem.iconCls"></div>
                <div v-if="!groupItem.dropDown" class="toolsbar-button-caption">
                    {{ groupItem.title }}
                </div>
            </span>
        </div>
    </div>
</template>

<script setup lang="ts">

// 定义组件名
defineOptions({
    name: 'LkxToolsBar'
})

import type {  ToolsBarItemType, ToolsBarProps } from './types'

withDefaults(defineProps<ToolsBarProps>(), {
    toolsBarItems: () => [],
    showIcon: true
})

const emit = defineEmits<{
    itemClick: [{idCode: string, index: number, dropDown: boolean, groupItem: ToolsBarItemType}]
}>()

const handleClick = (idCode: string, index: number, dropDown: boolean, groupItem: ToolsBarItemType): void => {
    emit('itemClick', {idCode, index, dropDown, groupItem})
}
</script>

<style lang="scss" scoped>
._toolsbar {
    padding: 4px 0;
    width: 100%;
    display: flex;
    border-bottom: 1px solid #eee8d5;
    background: $basic-bg-color;
    color: $basic-color;
}

.toolsbar-button-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 0 8px;
    cursor: pointer;
}

.toolsbar-Separate {
    float: left;
    width: 1px;
    height: 85%;
    padding: 0;
    margin: 2px 2px;
    border-left: 1px solid #eee8d5;
}

.toolsbar-group {
    display: flex;
    align-items: center;
}

.toolsbar-button-rightIcon {
    width: 5px;
}

.toolsbar-button {
    text-align: center;
    font-size: 18px;
    align-items: center;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.toolsbar-button-caption {
    text-align: center;
}

.toolsbar-button-content:hover {
    color: red;
    background-color: #f0f7ff;
    border-radius: 5px;
}

.toolsbar-button-content:active {
    background-color: #a0cfff;
}
</style>
