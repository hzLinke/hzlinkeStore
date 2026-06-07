
<template>
    <div class="tree" > 
        <div class="tree-item" @mousedown.prevent="toggle">
            <div v-if="hasChild" class="hasChild">{{open ? '-' : '+'}}</div>
            <div v-if="!hasChild" class="notHasChild"></div>
            <div class="icon" @mousedown.stop="handleCheckClick(data)">{{data.checked&&data.checked!='0'?'√':''}}</div>
            <div class="tree-item-panel" style="padding-left: 10px;">
                <div class="tree-item-panel-text">
                    {{ data.title }}
                </div>
                <div class="tree-item-panel-action">
                   
                </div>
            </div>
        </div>
        <div class="sub-item" v-show="open" v-if="hasChild">
            <tree-item v-for="(item,index) in data.children" :data="item"  :key="index"  @item-click="onItemClick"></tree-item>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'

defineOptions({
    name: 'TreeItem' // 递归组件必要条件
})

export interface TreeNode {
    title: string
    checked?: string | boolean
    children?: TreeNode[]
    [key: string]: any
}

interface Props {
    data: TreeNode
}

const props = withDefaults(defineProps<Props>(), {
    data: () => ({ title: '', checked: false })
})

const emit = defineEmits<{
    'item-click': [item: TreeNode]
}>()

const open = ref(false)

const hasChild = computed(() => {
    return props.data.children && props.data.children.length > 0
})

const toggle = () => {
    if (hasChild.value) {
        open.value = !open.value
    }
    emit('item-click', props.data)
}

const handleCheckClick = (item: TreeNode) => {
    // 处理 checked 为字符串 '0' 或布尔值的情况
    const currentChecked = item.checked === '0' ? false : Boolean(item.checked)
    item.checked = !currentChecked
}

const onItemClick = (item: TreeNode) => {
    // 递归组件，要加的事件
    emit('item-click', item)
}
</script>

<style lang="scss" scoped>
    .tree{
		padding-left: 15px;
	}
	.tree-item{
		display: flex;
		cursor: pointer;
		line-height: 20px;
		width: 100%;
        padding: 2px 0;
		.tree-item-panel{
			display: flex;
			flex: 1;
            &-text{
                flex: 1;
            }
            &-action{
                width: auto;
            }
			span:last-child{
				flex:1
			}
		}
	}
	.tree-item:hover{
		background-color: #85b0fe;
	}
	.tree-item-text:active{
		background-color: #b998fe;
	}
	
	.hasChild {
		display: inline-block;
		width: 20px;
		height: 20px;
		text-align: center;
		background-repeat: no-repeat;
		vertical-align: middle;
		border: 1px solid #E0E2E4;
        margin-left:5px;
	}
    .notHasChild {
		display: inline-block;
		width: 20px;
		height: 20px;
		text-align: center;
		background-repeat: no-repeat;
		vertical-align: middle;
        margin-left:5px;
	}
    .icon {
		display: inline-block;
		width: 20px;
		height: 20px;
		text-align: center;
		background-repeat: no-repeat;
		vertical-align: middle;
		border: 1px solid #E0E2E4;
        margin-left:5px;
	}
	.sub-item:not(:first-child){
		margin-left: 15px;
		border-left: 1px dotted #000000;
	}
</style>