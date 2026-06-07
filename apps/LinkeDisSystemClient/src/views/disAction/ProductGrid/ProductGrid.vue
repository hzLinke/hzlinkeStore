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
            <div v-if="disType!=3" class="item item-NumInf">
                <div class="item item-customer">{{itemData.customershortname}}</div>
                <div class="item item-num" :class="{notOver: itemData.distributionstatus!=2}">{{getNumText}}</div>
            </div>
            <div v-else class="item item-NumInf">
                <div class="item item-stock notOver">{{getNumText}}</div>
                <div class="item item-num" :class="{notOver: itemData.distributionstatus!=2}">{{itemData.checknum}}{{ itemData.downunit }}</div>
            </div>
           
		</div>
	</div>
</template>
<script setup lang="ts">
import { computed } from "vue";
import $Utils from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
const errorImage = new URL('@/assets/errorImage.jpg', import.meta.url).href

interface Props {
    itemData?: any
    disType: number
}

const props = withDefaults(defineProps<Props>(), {
    itemData: () => ({ num: 0 })
})

const emit = defineEmits<{
    (e: 'itemClick', item: any): void
}>()

const handleClick = (item: any) => {
    emit('itemClick', item)
}

const getNumText = computed(() => {
    const _thisData = props.itemData;
    if (props.disType == 3) {
        return $Utils.clearDecimal(_thisData.stocknum) + _thisData.unit
    }
    if (props.itemData.distributionstatus == 2) {
        if (_thisData.saletype == 2) {
            return $Utils.clearDecimal(_thisData.num) + _thisData.downunit + '/' +
                $Utils.clearDecimal(_thisData.distributionnum) + _thisData.unit
        }
        return $Utils.clearDecimal(props.itemData.distributionnum) + props.itemData.downunit
    } else {
        if (_thisData.saletype == 2) {
            return $Utils.clearDecimal(_thisData.num) + _thisData.downunit + '/' +
                $Utils.clearDecimal(_thisData.owenumex) + _thisData.unit
        }
        return $Utils.clearDecimal(props.itemData.owenumex) + props.itemData.downunit
    }
})

const handleImgError = (e: Event) => {
    const img = e.target as HTMLImageElement
    img.src = errorImage
    img.onerror = null
}

const ImgUrl = computed(() => {
    return $Utils.getfirstImg(`https://www.hzlinke.com.cn/LinkeServiceSystem/upImage/${commonParam.$linkname}/product/`, props.itemData.picsrc, new URL('@/assets/errorImage.jpg', import.meta.url).href) || ''
})
</script>
<style lang="scss" scoped>
    .overStauts{
        background: yellow;
        color: black;
    }
    .overStautsEx{
        background: green;
        color: white;
    }
    .grid{
       
        display: flex;
        border: 1px solid rebeccapurple;
        border-radius: 5px;
        //margin: 2px;
        cursor: pointer;
    }
    .grid-left{
        height: 100%;
        width: 100px;
        display: flex;
        align-items: center;
        justify-items: center;
        img{
            height: 90%;
            width: 90%; 
            margin-left: 5px;          
        }
    }
    .grid-right{
        height: 100%;
        flex: 1;
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
            white-space: nowrap; /* 不换行 */
            overflow: hidden;    /* 隐藏超出部分 */
            text-overflow: ellipsis; /* 显示省略号 */
        }
        
        .item-specInf{
            display: flex;
            flex-direction: row;
            height: 30px;
            margin-right: 4px;
            .item-spec{
                font-size: 18px;
                flex: 1;
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
                overflow: hidden;    /* 隐藏超出部分 */
            }
            .item-num{
                flex: 1;
                font-size: 22px;
                font-weight: 600;
                text-align: right;
                padding:0;
               
            }
            .item-stock{
                flex: 1;
                font-size: 22px;
                font-weight: 600;
                padding:0;
               
            }
        }
        
    }
    .notOver{
        color: red;
    }
</style>
