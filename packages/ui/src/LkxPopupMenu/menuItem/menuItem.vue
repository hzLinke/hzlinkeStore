
<template>
    <li v-if="items.type=='img'">
        <img :src="items.src">
    </li>
    <li v-else-if="items.caption=='-'" class="separate"></li>
    <li v-else class="menu-item" @mouseenter="handleMouseOver" @mouseleave="open=false" @click="handleItemClick">
		<div class="menu-item-title" >
			<LkxIcons class="_Icon" :type="items.type" :size="items.size" :color="items.color" />
			<span  class="_Title" href="#" style="flex: 1;">{{items.caption}}</span>
			<span v-if="items.children&&items.children.length>0" class="_Status iconfont iconBottom" />
		</div>
        <ul class="sub-menu"  v-show="open">
            <menu-item v-for="(item, index) in items.children" :items="item"  :key="index"></menu-item>
        </ul>
    </li>
</template>

<script lang="ts">
import { defineComponent ,ref} from 'vue';
import LkxIcons from '../../LkxIcons/Icons.vue'
export default defineComponent({
    components:{
        LkxIcons
    },
    name: 'MenuItem',// 组件递归必要条件，name属性
    props: {
        items:{
            type:Object,
            default:function(){
                return {
                    iconCls:''
                }
            }
        }
    },
    setup(_, ctx){
        const open = ref(false);
        const handleMouseOver=(e: MouseEvent)=>{
            const el: HTMLElement = e.target as HTMLElement;
            if (el.children.length>1){
                const subNode: HTMLElement = el.children[1] as HTMLElement;
                subNode.style.left = el.offsetWidth+'px';
                subNode.style.top = 0+'px';
                open.value = true
            }
        }
        const handleItemClick=(e: any)=>{
            open.value = false
            ctx.emit('itemClick',e)
        }
        return {
            open,
            handleMouseOver,
            handleItemClick
        }
    }
})
</script>

<style lang="scss" scoped>

	.menu-item-title{
		width: 160px;
		display: flex;
	}
	.menu-item{
		display: block;
		height: 30px;
		line-height: 30px;
        padding:2px;
		background:$basic-bg-color;
        color: $basic-color;
		&:hover{
			color:$hover-font-color;
			background: $active-bg-color;
		}
	}
	.sub-menu{
        position: absolute;
        padding: 0;
        margin: 0;
        list-style-type: none;
	}
	._Title{
		white-space:nowrap;
	}
	._Icon{
		padding: 0 5px;
        width: 20px;
	}
	._Icon,._Status{
		padding: 0 12px;
	}
    .separate{
        height: 1px;
        border-top: 1px solid #bbbb;
        padding-top:3px;
        padding-bottom: 3px;
    }
</style>
