<template>
    <div class="tree-container">
        <tree-item
            v-for="(item, index) in treeDatas"
            :key="index"
            :data="item"
            :class="{ 'active': item.idcode === selsindex }"
            @item-click="onItemClick"
        />
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import TreeItem from './TreeItem/treeItem.vue'
import type { TreeNode } from './TreeItem/treeItem.vue'

interface Props {
    data: TreeNode | TreeNode[]
}

const props = defineProps<Props>()

const emit = defineEmits<{
    'tree-click': [item: TreeNode]
}>()

const selsindex = ref(0)
const treeDatas = ref<TreeNode[]>([])

const onItemClick = (e: TreeNode) => {
    emit('tree-click', e)
}

watch(
    () => props.data,
    () => {
        treeDatas.value = Array.isArray(props.data) ? props.data : [props.data]
    },
    { deep: true }
)
</script>

<style lang="scss" scoped>
.tree-container {
    height: 100%;
    width: 100%;
    overflow: auto;
}

.active {
    background-color: #cceeff;
}
</style>
