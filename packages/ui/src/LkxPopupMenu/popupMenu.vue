<template>
    <div  ref="popuMenu" class="menu"  :style="{top:pointXy.top+'px',left:pointXy.left+'px'}" >
        <ul  class="main-menu">
            <menu-item v-for="(item, index) in items" :items="item" :key="index" @itemClick="handleClick(item,cellIndex)"></menu-item>
        </ul>
    </div>
</template>

<script lang="ts">
import { defineComponent ,ref,watch} from 'vue';
import userClickOutside from '../usehook/UserClickOutside'
import MenuItem from './menuItem/menuItem.vue'
export default defineComponent({
    components:{
        MenuItem
    },
    props: {
        items:{
            type:Object,
            default:function(){
                return {
                    iconCls:''
                }
            }
        },
        pointXy:{
            type:Object,
            default:function(){
                return {
                    left:0,
                    top:0
                }
            }
        },
        open:{
            type:Boolean,
            default: false
        },
        cellIndex:{
            type: Number,
            default: -1
        },
        closePopuMenu: {
            type: Function,
            default: null
        },
    },
    emits:['itemClick'],
    setup(props){
        const selectIndex = ref(0)
        const handleClick = (item: any,cellIndex: any)=>{
            //ctx.emit('itemClick',item,cellIndex)
           const func = (props as any).closePopuMenu
           func&&func({item,cellIndex})
        }
        const popuMenu = ref<null | HTMLElement>(null)
        const isClickOutside = userClickOutside(popuMenu,'null') //是否点击菜单外部

        watch(
            isClickOutside,
            () => {
                if (isClickOutside.value){
                   const func = (props as any).closePopuMenu
                    func&&func()
                }
        })
        return {
            selectIndex,
            popuMenu,
            handleClick
        }
    }
})
</script>

<style lang="scss" scoped>
	.menu{
		position: absolute;
		border: 1px solid #bbbb;
        background: $basic-bg-color;
        max-height: 300px;
        overflow: auto;
        z-index: 9999999;
	}
	.menu ul{
        padding: 0;
        margin: 0;
        list-style-type: none;
	}
    .main-menu li{
        position: relative;
	}
</style>
