<template>
	<div class="dropList" :style="{top: offsetTop+'px',left: offsetLeft+'px',width: offsetWidth+'px'}">
        <div v-if="allowFilter">
            <input name="ElFilterInput" autocomplete="off" class="filter-input" placeholder="请输入查找条件回车确认"  @keyup="handleSearchKeyDown"/>
        </div>
        <div class="droplist-body"  ref="dropListBody">
            <li class="dropList-item"
                :class="[{'active':listIndex==selsindex}]"
                v-for="(listItem,listIndex) in ListDatas" 
                :key = "listIndex"
                @mousedown.prevent="handleClose(listIndex)"
            >
                <div v-if="!isObject(listItem)" class="dropList-item-cell">
                    <span> {{listItem}}</span>
                </div>
                <div  v-else v-for="(item,index) in  fields.split('|')" :key="index" 
                    :style="{width:colWidths[index]+'px'}"  class="dropList-item-cell">
                    <span  :class="{'indentation': index==0&&indentation&&listItem['idcode']>10000}">{{listItem[item] }}</span>
                    
                </div>
            </li>
        </div>
	</div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import $Uitl from '@v4x/utils/lkxUtil'
import { fireMoseEvent, TableRowDataType } from '@v4x/ui'

// 定义组件名
defineOptions({
    name: 'DropList'
})

interface DropListPosition {
    top: number
    left: number
    width: number
    height: number
}

interface Props {
    dropListPosition?: DropListPosition
    allowFilter?: boolean
    dropListDatas?: TableRowDataType[]
    fields?: string
    fieldWidths?: string
    groupFieldName?: string
    indentation?: boolean
    filterFunc?: (value: string, data: TableRowDataType[]) => TableRowDataType[]
}

const props = withDefaults(defineProps<Props>(), {
    dropListPosition: () => ({
        top: 0,
        left: 0,
        width: 200,
        height: 0
    }),
    allowFilter: false,
    dropListDatas: () => [],
    fields: '',
    fieldWidths: '',
    groupFieldName: 'pcode',
    indentation: false,
    filterFunc: undefined
})

const emit = defineEmits<{
    dropListClose: [data: any]
}>()

const dropListBody = ref<null | HTMLElement>(null)
const ListDatas = ref(props.dropListDatas as any[])
const visable = ref(false)
const selsindex = ref(0)

// 初始化列宽
const colWidths = computed(() => props.fieldWidths.split('|'))

// 计算位置和宽度
const offsetTop = ref(props.dropListPosition.top)
const offsetLeft = ref(props.dropListPosition.left)
const offsetWidth = ref($Uitl.sumArray(colWidths.value))

offsetWidth.value = offsetWidth.value < props.dropListPosition.width ? props.dropListPosition.width : offsetWidth.value
const elWidth = offsetWidth.value
const elHeight = 200

// 调整位置防止超出视口
if ((offsetLeft.value + elWidth) > document.documentElement.clientWidth) {
    offsetLeft.value = offsetLeft.value - (elWidth - props.dropListPosition.width)
}
if (offsetTop.value + elHeight > document.documentElement.clientHeight - 5) {
    offsetTop.value = offsetTop.value - (elHeight + props.dropListPosition.height)
}

const isObject = (listItem: any): boolean => {
    return (typeof listItem == 'object')
}

const scrollList = (_flg: number) => {
    const $dropListBody = dropListBody.value as any
    const $thisItem = $dropListBody.querySelector('.active')
    const $dropListBodyHeight = $dropListBody.clientHeight
    const $thisItemParmars = {
        clientHeight: $thisItem.clientHeight,
        offsetTop: $thisItem.offsetTop
    }
    if (_flg == 1) {
        if ($thisItemParmars.offsetTop + $thisItemParmars.clientHeight > $dropListBodyHeight + $dropListBody.scrollTop) {
            $dropListBody.scrollTop += $thisItemParmars.clientHeight
        }
    } else {
        if ($thisItemParmars.offsetTop <= $dropListBody.scrollTop) {
            $dropListBody.scrollTop -= $thisItemParmars.clientHeight
        }
    }
}

const changeSelsIndex = (_flg: number) => {
    if (_flg == 1) {
        if (selsindex.value < ListDatas.value.length - 1) {
            selsindex.value++
        }
    } else {
        if (selsindex.value > 0) {
            selsindex.value--
        }
    }
    setTimeout(() => {
        scrollList(_flg)
    }, 50)
}

const handleClose = (index: number) => {
    emit('dropListClose', ListDatas.value[index])
}

const handleSearchKeyDown = (e: KeyboardEvent) => {
    const $dropList = dropListBody.value as any
    switch (e.key) {
        case 'ArrowDown':
            e.preventDefault()
            changeSelsIndex(1)
            break
        case 'ArrowUp':
            e.preventDefault()
            changeSelsIndex(-1)
            break
        case 'Enter': {
            e.stopPropagation()
            const InputEl = (e.target as HTMLInputElement)
            const InputValue = InputEl.value
            if (props.filterFunc) {
                const _dropList = props.dropListDatas
                ListDatas.value = props.filterFunc(InputValue, _dropList)
                InputEl.value = ''
                return
            }
            if (InputValue != '') {
                const arr = props.dropListDatas.filter((item: any) => {
                    return item.name.indexOf(InputValue) != -1
                })
                ListDatas.value = arr
                InputEl.value = ''
            } else {
                if (ListDatas.value.length != 0) {
                    fireMoseEvent($dropList.querySelector('.active'), 'mousedown')
                    return
                }
                ListDatas.value = props.dropListDatas
            }
            break
        }
    }
}

defineExpose({
    dropListBody,
    ListDatas,
    visable,
    selsindex,
    changeSelsIndex,
    colWidths,
    offsetTop,
    offsetLeft,
    offsetWidth,
    isObject,
    handleClose,
    handleSearchKeyDown
})
</script>

<style lang="scss" scoped>
	.dropList{
		position: absolute;
         display: flex;
         flex-direction: column;
		height:200px;
		z-index:999999999;
		border:1px solid #DCDCDC;
		background: #FFFFFF;
        font-size: $font-size;
        .filter-input{
            width: 98%;
            outline: 0;
            padding: 5px 0;
        }
        .droplist-body{
            flex: 1;
            position: relative;
            overflow-y:auto;
            .dropList-item{
                display: flex;
                cursor: default;
                flex-direction: row;
                padding: 5px 10px; 
                .dropList-item-cell{
                    display: inline-block;
                    white-space: nowrap;
                    overflow: hidden ;
                    text-overflow:ellipsis;
                }
                .dropList-item-cell:last-child{
                    flex:1
                }
                &:hover{
                    background-color: #85b0fe;
                }
            }
            .active{
                background-color: #CCEEFF;
            }
        }
		
	}
    .indentation{
        padding-left: 20px;
    }
</style>
