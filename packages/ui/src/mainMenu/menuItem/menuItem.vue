
<template>
    <li v-if="items.title=='-'" class="separate"></li>
    <li v-else class="menu-item"
        @mouseenter.stop="handleMouseEnter($event,items)"
        @mouseleave="handleMouseLeave($event,items)"
        @click.stop="handleParentClick($event,items)">
		<div :class="[items.level==0?'menu-item-title-level0':(items.title=='-'?'_Separate':'menu-item-title')]" >
			<span class="_Icon" :class="items.iconcls" />
            <span v-if="items.title=='-'" style="flex: 1;"></span>
			<span v-else class="_Title" style="flex: 1;">{{items.title}}</span>
			<icons v-if="items.children&&items.children.length>0&&items.level>0" type='arrowRight'/>
            <icons v-if="direction=='h'&&items.level==0" class="menu-item-indicator" :type="(items.open)?'arrowUp':'arrowDown'" ></icons>
		</div>
        <ul class="sub-menu" ref="subMenu" v-show="items.open" :style="{ position: direction=='v'?'absolute':'static' }">
            <menu-item v-for="(item, index) in items.children" :items="item"  :key="index" 
                :itemClick="itemClick"
                @click="handleItemClick(item,items)"
            />
        </ul>

    </li>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { type MenuDataType } from '@v4x/ui'
import Icons from '../../LkxIcons/Icons.vue'

// 组件递归必要条件，定义组件名
defineOptions({
    name: 'MenuItem'
})

// 定义 props
interface Props {
    items: MenuDataType
    curOpenIndex?: number
    index?: number
    direction?: string
    itemClick?: (item: MenuDataType) => void
}

const props = withDefaults(defineProps<Props>(), {
    items: () => ({
        open: false,
        level: 0,
        idcode: 0,
        title: '',
        name: '',
        showModel: false,
        children: [],
        iconcls: ''
    }) as MenuDataType,
    curOpenIndex: 0,
    index: 0,
    direction: 'v'
})

// 定义 emits
const emit = defineEmits<{
    changeIndex: [index: number]
}>()

// 子菜单引用
const subMenu = ref<HTMLElement | null>(null)

// 鼠标进入处理
const handleMouseEnter = (e: MouseEvent, item: MenuDataType) => {
    if (props.direction !== 'v') return

    const el = e.target as HTMLElement
    if (item.children && item.children.length > 0) {
        item.open = true

        // 弹出菜单高度计算
        const ElClientRect = el.getBoundingClientRect()
        const childrenCaptionArr = item.children.filter((item: any) => item.title !== '-')
        const childrenSeparateArr = item.children.filter((item: any) => item.title === '-')
        const popupMenuHeight = childrenCaptionArr.length * ElClientRect.height + childrenSeparateArr.length * 6

        const subNode = subMenu.value
        const _ScrollTop = (el.parentNode?.parentNode?.parentNode?.parentNode?.parentNode as HTMLDivElement)?.scrollTop || 0
        const _top = ElClientRect.top

        // 指向的位置到底部高度（余高度）
        const _YHeight = document.documentElement.clientHeight - _top - 41

        if (props.direction === 'v' && item.level > 0) {
            subNode!.style.left = el.offsetWidth + 15 + 'px'
            // 余高度 >= 弹出菜单高度?正常弹出:弹出菜单高度 - 余高度
            subNode!.style.top = _YHeight >= popupMenuHeight
                ? el.offsetTop - _ScrollTop + 'px'
                : el.offsetTop - (popupMenuHeight - _YHeight + _ScrollTop) + 'px'
        } else {
            subNode!.style.left = el.offsetLeft + 'px'
            subNode!.style.top = el.offsetTop + el.offsetHeight + 'px'
        }
    }
}

// 鼠标离开处理
const handleMouseLeave = (_e: MouseEventInit, item: MenuDataType) => {
    if (props.direction !== 'v') return
    item.open = false
}

// 菜单项点击处理
const handleItemClick = (item: MenuDataType, parentItem: MenuDataType) => {
    if (props.direction === 'v') {
        // 关闭浮动菜单项
        parentItem.open = false
    }
    if (!item.children || item.children.length === 0) {
        props.itemClick?.(item)
    }
}

// 父菜单点击处理
const handleParentClick = (_e: MouseEvent, item: MenuDataType) => {
    emit('changeIndex', props.index)
    item.open = !item.open
}
</script>

<style lang="scss" scoped>
    .menu-item-title-level0{
        min-width: 100px;
        padding-left: 5px;
		display: flex;
        align-items: center;
         &:hover{
			color:$hover-font-color;
			background: $active-bg-color;
		}
    }
	.menu-item-title{
		min-width: 160px;
		display: flex;
        padding-left: 5px;
        align-items: center;
        &:hover{
			color:$hover-font-color;
			background: $active-bg-color;
		}
	}
	.menu-item{
		display: block;
        padding:2px;
        cursor: pointer;
        /**指示icon */
		.menu-item-indicator{
            padding-right: 5px;
        }
	}
	.sub-menu{
        padding: 0;
        margin: 0;
        z-index: 80000;
        color:white;
        list-style-type: none;
       /* border: 1px solid #bbbb;*/
        background: #40515c;
        padding-left:15px;
	}
	._Title{
		white-space:nowrap;
        padding:4px 8px;
        margin-top: 4px ;
	}
    ._Separate{
        padding-left: 5px;
        height: 1px;
        border-bottom: 1px solid #eeee ;
    }
	._Icon{
        width: 20px;
        text-align: center;
        font-size: 20px;
	}
	._Status{
		padding: 0 12px;
	}
    .separate{
        height: 1px;
        border-top: 1px solid #bbbb;
        padding-top:3px;
        padding-bottom: 3px;
    }
</style>