<template>
    <div class="mainMenu" :class="{'flexColumn':direction=='h'}">
        <div v-if="direction=='h'" class="mainMenu-status"></div>
        <ul class="mainMenu-menu" :class="{'flexColumn':direction=='h'}">
            <menu-item v-for="(item, index) in items"
                :direction="direction"
                :itemClick="(itemClick as any)"
                :items="(item as any)"
                :key="index"
                :index="index"
                :curOpenIndex="curOpenIndex"
                @changeIndex="handleChangeIndex"
            ></menu-item>
        </ul>
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import { type MenuDataType } from './types'
import MenuItem from './menuItem/menuItem.vue'

defineOptions({
    name: 'MainMenu'
})
// 定义 props
interface Props {
    nemuDatas: MenuDataType[]
    defaultActiveIndex?: number
    direction?: string
    itemClick?: (item: MenuDataType) => void
}

const props = withDefaults(defineProps<Props>(), {
    nemuDatas: () => [],
    defaultActiveIndex: 0,
    direction: 'v'
})

// 响应式状态
const curOpenIndex = ref(props.defaultActiveIndex)
const items = ref<MenuDataType[]>([])

// 处理索引变化
const handleChangeIndex = (index: number) => {
    if (curOpenIndex.value !== index) {
        items.value[curOpenIndex.value].open = false
    }
    curOpenIndex.value = index
}

// 监听菜单数据变化
watch(
    () => props.nemuDatas,
    (newVal) => {
        items.value = newVal
        if (items.value[props.defaultActiveIndex]) {
            items.value[props.defaultActiveIndex].open = true
        }
    },
    { immediate: true }
)
</script>

<style lang='scss' scoped>
    .mainMenu{
        display: flex;
        &-status{
            height: 30px;
            line-height: 30px;
            background: $basic-bg-color;;
        }
        &-menu{
            display: flex;
            flex: 1;
            padding: 0;
            margin: 0;
            list-style-type: none;
            background:$basic-bg-color;;
            color: $basic-color;;
        }

    }
    .flexColumn{
        flex-direction: column;
    }
  
</style>
