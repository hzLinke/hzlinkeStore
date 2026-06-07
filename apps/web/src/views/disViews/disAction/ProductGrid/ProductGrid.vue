<template>
	<div class="grid"  @click.stop="handleClick(itemData)">
		<div class="grid-left">
			<img :src="ImgUrl" @error="handleImgError">
		</div>
		<div class="grid-right" :class="{overStauts: itemData.distributionstatus==1,
                overStautsEx: itemData.distributionstatus==2}">
			<div class="item item-name">{{itemData.name}}</div>
            <div class="item item-specInf">
                <div class="item item-spec">{{itemData.spec}}</div>
                <div class="item item-note">{{itemData.note}}</div>
            </div>
            <div class="item item-NumInf">
                <div class="item item-customer">{{itemData.customershortname}}</div>
                <div class="item item-num" :class="{notOver: itemData.distributionstatus!=2}">{{getNumText}}</div>
            </div>
           
		</div>
	</div>
</template>
<script setup lang="ts">
import { computed, onMounted } from "vue";
import $Utils from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
import errorImage from '@/assets/errorImage.jpg'
import { useAppStore } from '@/stores'

const appStore = useAppStore()
defineOptions({
    name: 'ProductGrid'
})

const props = withDefaults(defineProps<{
    itemData: any
}>(), {
    itemData: () => ({} as any)
})

const emit = defineEmits<{
    (e: 'item-click', item: any): void
}>()

const handleClick = (item: any)=>{
    emit('item-click', item)
}

const getNumText = computed(()=>{
    const _thisData = props.itemData;
    if (props.itemData.distributionstatus==2){
        if (_thisData.saletype == 2){
            return $Utils.clearDecimal(_thisData.num) + _thisData.downunit + '/'+
                $Utils.clearDecimal(_thisData.distributionnum) + _thisData.unit
        }
        return $Utils.clearDecimal(props.itemData.distributionnum) + props.itemData.downunit
    } else {
        if (_thisData.saletype == 2){
            return $Utils.clearDecimal(_thisData.num) + _thisData.downunit + '/'+
                $Utils.clearDecimal(_thisData.owenumex) + _thisData.unit
        }
        return $Utils.clearDecimal(props.itemData.owenumex) + props.itemData.downunit
    }
})

const ImgUrl = computed(()=>{
    return $Utils.getfirstImg(`https://www.hzlinke.com.cn/LinkeServiceSystem/upImage/${commonParam.$linkname}/product/`,props.itemData.picsrc,errorImage)||''
})

const handleImgError = (e: Event) => {
    const img = e.target as HTMLImageElement
    img.src = errorImage
    // 防止 errorImage 也加载失败导致无限循环
    img.onerror = null
}

onMounted(()=>{
    
})

</script>
<style lang="scss" scoped>
    .overStauts{
        background: yellowgreen;
        color: white;
    }
    .overStautsEx{
        background: blue;
        color: white;
    }
    .grid{
       
        display: flex;
        border:1px solid rebeccapurple;
        border-radius: 5px;
        cursor: pointer;
    }
    .grid-left{
        height: 100%;
        width: 100px;
        display: flex;
        align-items: center;
        img{
            height: 90%;
            width: 90%;           
        }
    }
    .grid-right{
        height: 100%;
        flex:1;
        display: flex;
        flex-direction: column;
        .item{
            padding-top: 4px;
        }
        .item-name{
            font-size: 22px;
            font-weight: 600;
            padding-bottom: 4px;
            width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .item-specInf{
            display: flex;
            flex-direction: row;
            height: 30px;
            margin-right: 4px;
            .item-spec{
                font-size: 18px;
                flex:1;
            }
            .item-Note{
                font-size: 18px;
                width: 200px;
            }
        }
        .item-NumInf{
            font-size: 18px;
            font-weight: 500;
            margin-right: 4px;
            display: flex;
            flex-direction: row;
            height: 30px;
            .item-customer{
                padding:0;
                width: 100px;
                white-space: nowrap;
                overflow: hidden;
            }
            .item-num{
                flex: 1;
                font-size: 22px;
                font-weight: 600;
                text-align: right;
                padding:0;
               
            }
        }
        
    }
    .notOver{
        color: red;
    }
</style>
