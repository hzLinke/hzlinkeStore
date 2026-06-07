<template>
    <div class="tabs-bar">
        <!--标签页标题，通过v-for实现循环-->
        <div
            v-for="(item, index) in tabList"
            :key="item.idcode"
            :class="tabCls(item)"
            @click="handleChange(item, index)"
        >
            <div class="tabs-bar-tab-icon" :class="item.iconcls"></div>
            <div class="tabs-bar-tab-title">{{ item.title }}</div>
            <div
                v-if="item.idcode !== 0 && closeBut"
                class="tabs-bar-tab-close"
                @click.stop="handleClose(item, index)"
            >
                ×
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">

// 定义组件名
defineOptions({
    name: 'LinkeTabs'
})

interface TabItem {
    idcode: number
    title: string
    iconcls?: string
}

interface Props {
    defaultValue?: string | number
    tabList: TabItem[]
    closeBut?: boolean
}

const props = withDefaults(defineProps<Props>(), {
    defaultValue: 0,
    tabList: () => [],
    closeBut: false
})

const emit = defineEmits<{
    input: [item: TabItem]
    tabClick: [item: TabItem, index: number]
    tabClose: [index: number]
}>()

const tabCls = (item: TabItem) => {
    return [
        'tabs-bar-tab',
        {
            'tabs-tab-active': item.idcode === props.defaultValue,
            'tabs-bar-tab-padding': item.idcode !== 0 && props.closeBut
        }
    ]
}

const handleChange = (item: TabItem, index: number) => {
    emit('input', item)
    emit('tabClick', item, index)
}

const handleClose = (_item: TabItem, index: number) => {
    emit('tabClose', index)
}
</script>

<style lang="scss" scoped>
$spacing: 1px;

.tabs-bar {
    color: $basic-color;
    background: $basic-bg-color;
    flex-direction: row;
    align-items: center;
    /* 垂直居中 */
    &:after {
        content: '';
        display: block;
        width: 100%;
        height: 1px;
        -webkit-transform: scaleY(0.5);
        transform: scaleY(0.5);
        background-color: #c8c7cc;
        margin-top: -3px;
    }

    &-tab {
        display: inline-block;
        margin-bottom: $spacing;
        padding: $spacing 25px $spacing 5px;
        margin-right: $spacing;
        background: $basic-bg-color;
        border: 1px solid #d7dde4;
        cursor: pointer;
        position: relative;
        &-padding {
            padding: $spacing 20px $spacing 5px;
        }

        &-icon {
            float: left;
            margin-top: 3px;
            padding-right: 5px;
        }

        &-title {
            float: left;
            margin-top: 3px;
        }

        &-close {
            position: absolute;
            top: 0;
            right: 1px;
            width: 10px;
        }
    }
}

.tabs-tab-active {
    border-top: 2px solid red;
    /* border-bottom: 1px solid red; */
}

.tabs-tab-active:before {
    content: '';
    display: block;
    height: 1px;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
}
</style>
