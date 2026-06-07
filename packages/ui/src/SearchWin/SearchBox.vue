<template>
    <div class="searchbox-container">
        <div class="searchbox-body">
            <div class="fields">
                <li v-for="(item,index) in displayFields" :key="index" @mousedown="handleFieldClick(item,index,$event)" :class="{'active':index == selectIndex}">{{item.caption}}</li>
            </div>
            <div class="val">
                <div class="butbox">
                    <label  class="modal-check"><input name="ElSearchBoxNot" type="checkbox" v-model="isNot"/>非</label>
                    <button type="submit" class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
                    <button class="modal-button modal-button-cancel" @click="handleCancel">取消</button>
                </div>
                <div class="valbox">
                    <textarea ref="listEl" v-if="filterType=='fsStrList'||filterType=='fsNumList'" class="list-input" v-model="listVal"></textarea>
                    <div  v-if="filterType=='fsLike'||filterType=='fsEqual'" class="str-input">
                        <label>请输入内容</label>
                        <input ref="likeEl" @keypress="handleEndKeyPress" v-model="likeVal"/>
                    </div>
                    <div  v-if="filterType=='fsNone'" class="a2b-input">
                        <input ref="endEl" @keypress="handleEndKeyPress" v-model="endVal"/>
                        <label>到</label>
                        <input ref="startEl" @keypress="handleStartKeyPress" v-model="startVal"/>
                        <label>从</label>
                    </div>
                    <div  v-if="filterType=='fsDate'" class="a2b-input">
                        <input ref="endEl"  type="date" @keypress="handleEndKeyPress" v-model="endVal"/>
                        <label>到</label>
                        <input ref="startEl" type="date" @keypress="handleStartKeyPress" v-model="startVal"/>
                        <label>从</label>
                    </div>
                    <div  v-if="filterType=='fsMonth'" class="a2b-input">
                        <input ref="endEl"  type="month" @keypress="handleEndKeyPress" v-model="endVal"/>
                        <label>到</label>
                        <input ref="startEl" type="month" @keypress="handleStartKeyPress" v-model="startVal"/>             
                        <label>从</label>  
                    </div>
                    <div v-if="filterType=='fsIn'" class="inBox">
                        <in-box @inChange='handelInChange' 
                            :ListDatas="ListDatas" 
                            :KeyFieldName="KeyFieldName"
                            :DisplayFieldName="DisplayFieldName"
                            :DisplayFields="DisplayFields"
                        ></in-box>
                    </div>
                </div>
            </div>
        </div>
        <div class="searchbox-footer">
            <textarea name="ElSearchBoxFilterText" class="filterText" :rows="3"  disabled v-model="filterCaption"></textarea>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, toRefs, computed, getCurrentInstance } from "vue"
import InBox from "./InBox.vue"
import { SearchBoxConfigType, SearchBoxFieldItem } from './types'
import lkxUtil from '@v4x/utils/lkxUtil'
import { modalActionCancel, modalActionConfirm } from '@v4x/utils'
import { ModalResultEnum } from "@v4x/ui"

defineOptions({
    name: 'SearchBox'
})

interface SearchBoxProps {
    rowData?: any
    config?: SearchBoxConfigType
    fields?: SearchBoxFieldItem[]
    title?: string
    width?: number
    height?: number
}

const props = withDefaults(defineProps<SearchBoxProps>(), {
    rowData: () => ({}),
    config: () => ({}),
    fields: () => [],
    title: '万能查询器',
    width: 600,
    height: 400
})

const emit = defineEmits<{
    close: [data: { type: string; filter: string; filterCaption: string }]
}>()

const listEl = ref<null | HTMLElement>(null)
const likeEl = ref<null | HTMLElement>(null)
const startEl = ref<null | HTMLElement>(null)
const endEl = ref<null | HTMLElement>(null)
const inVal = ref<string[]>([])
const selectIndex = ref(-1)
const filterType = ref('')
const fieldName = ref('')
const fieldCaption = ref('')
const ListDatas = ref<any[]>([])
const KeyFieldName = ref('')
const DisplayFieldName = ref('')
const DisplayFields = ref('')
const isNot = ref(false)

const filterState = reactive({
    likeVal: '',
    listVal: '',
    startVal: '',
    endVal: '',
    inVal: ''
})

const filterText = ref('')
const filterCaption = ref('')

const { likeVal, listVal, startVal, endVal } = toRefs(filterState)

const displayFields = computed(() => {
    return props.fields || props.config.fields || []
})

const initFilterState = () => {
    filterState.likeVal = ''
    filterState.listVal = ''
    filterState.startVal = ''
    filterState.endVal = ''
    filterState.inVal = ''
    inVal.value = []
}

const initFocus = () => {
    const targetEl = filterType.value === 'fsLike' || filterType.value === 'fsEqual' ? likeEl.value
        : (filterType.value === 'fsNone' || filterType.value === 'fsDate') ? startEl.value
        : listEl.value
    
    if (targetEl) {
        (targetEl as HTMLInputElement).select()
    }
}

const buildFilter = () => {
    let _filter = '', _caption = ''
    
    switch (filterType.value) {
        case 'fsIn':
            if (filterState.inVal) {
                _filter = `${fieldName.value} in (${filterState.inVal})`
                _caption = `${fieldCaption.value} in (${filterState.inVal})`
            }
            break
        case 'fsLike':
            if (filterState.likeVal) {
                _filter = `${fieldName.value} like '%${filterState.likeVal}%'`
                _caption = `${fieldCaption.value} like '%${filterState.likeVal}%'`
            }
            break
        case 'fsEqual':
            if (filterState.likeVal) {
                _filter = `${fieldName.value} = '${filterState.likeVal}'`
                _caption = `${fieldCaption.value} = '${filterState.likeVal}'`
            }
            break
        case 'fsNone':
            if (filterState.startVal && filterState.endVal) {
                _filter = `${fieldName.value} between '${filterState.startVal}' and '${filterState.endVal}'`
                _caption = `${fieldCaption.value} between '${filterState.startVal}' and '${filterState.endVal}'`
            } else if (filterState.startVal) {
                _filter = `${fieldName.value} = '${filterState.startVal}'`
                _caption = `${fieldCaption.value} = '${filterState.startVal}'`
            }
            break
        case 'fsDate':
            if (filterState.startVal && filterState.endVal) {
                _filter = `convert(char(10),${fieldName.value},120) between '${filterState.startVal}' and '${filterState.endVal}'`
                _caption = `convert(char(10),${fieldCaption.value},120) between '${filterState.startVal}' and '${filterState.endVal}'`
            } else if (filterState.startVal) {
                _filter = `convert(char(10),${fieldName.value},120) = '${filterState.startVal}'`
                _caption = `convert(char(10),${fieldCaption.value},120) = '${filterState.startVal}'`
            }
            break
        case 'fsMonth':
            if (filterState.startVal && filterState.endVal) {
                _filter = `Left(${fieldName.value},7) between '${filterState.startVal}' and '${filterState.endVal}'`
                _caption = `Left(${fieldCaption.value},7) between '${filterState.startVal}' and '${filterState.endVal}'`
            } else if (filterState.startVal) {
                _filter = `Left(${fieldName.value},7) = '${filterState.startVal}'`
                _caption = `Left(${fieldCaption.value},7) = '${filterState.startVal}'`
            }
            break
        case 'fsStrList':
            if (filterState.listVal) {
                const _val = filterState.listVal.split('\n').filter((item: string) => item.trim() !== '')
                const _valarr = _val.map((item: string) => `'${item}'`)
                const _v = _valarr.join(',')
                _filter = `${fieldName.value} in (${_v})`
                _caption = `${fieldCaption.value} in (${_v})`
            }
            break
        case 'fsNumList':
            if (filterState.listVal) {
                const _val = filterState.listVal.split('\n').filter((item: string) => item.trim() !== '')
                const _v = _val.join(',')
                _filter = `${fieldName.value} in (${_v})`
                _caption = `${fieldCaption.value} in (${_v})`
            }
            break
    }
    
    const notText = isNot.value ? 'not ' : ''
    filterText.value += filterText.value && _filter ? ` and ${notText}${_filter}` : `${notText}${_filter}`
    filterCaption.value += filterCaption.value && _caption ? ` and ${_caption}` : _caption
}

const handleFieldClick = (item: any, index: number, event: MouseEvent) => {
    if (selectIndex.value === index) {
        event.preventDefault()
        return
    }
    
    buildFilter()
    initFilterState()
    
    if (item.filterType === 'fsDate') {
        startVal.value = lkxUtil.getDate()
        endVal.value = lkxUtil.getDate()
    } else if (item.filterType === 'fsMonth') {
        startVal.value = lkxUtil.getDate('none', 0, 'yyyy-MM')
        endVal.value = lkxUtil.getDate('none', 0, 'yyyy-MM')
    }
    
    filterType.value = 'fsHide'
    
    setTimeout(() => {
        filterType.value = item.filterType
        fieldName.value = item.fieldName
        fieldCaption.value = item.caption
        selectIndex.value = index
        ListDatas.value = item.inList || []
        KeyFieldName.value = item.keyFieldName || ''
        DisplayFieldName.value = item.displayFieldName || ''
        DisplayFields.value = item.displayFields || ''
    }, 0)
    
    setTimeout(() => {
        initFocus()
    }, 5)
}

const handleStartKeyPress = (e: KeyboardEvent) => {
    if (e.key === 'Enter' && endEl.value) {
        (endEl.value as HTMLInputElement).select()
    }
}

const handleEndKeyPress = (e: KeyboardEvent) => {
    if (e.key === 'Enter') {
        handleConfirm()
    }
}

const handelInChange = (val: any) => {
    inVal.value.push(`'${val}'`)
    filterState.inVal = inVal.value.join(',')
}

const parentInstance = getCurrentInstance()?.parent

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}

const handleConfirm = () => {
    buildFilter()
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: { filter: filterText.value, filterCaption: filterCaption.value } })
}
</script>
<style lang="scss" scoped>
    .active {
        background: blue;
        color: white;
    }
    input,textarea{
        resize: none;
        outline-color: blue;
    }
    .footer{
        textarea{
            width: 100%;
        }
    }
    .searchbox-container{
        display: flex;
        flex-direction: column;
        height: 100%;
        width: 100%;
        box-sizing: border-box;
        .searchbox-body{
            flex: 1;
            display: flex;
            flex-direction: row;
            box-sizing: border-box;
            overflow: hidden;
            min-width: 0;
            .fields{
                width: 140px;
                border: 1px solid #eeee;
                overflow-y: auto;
                overflow-x: hidden;
                flex-shrink: 0;
                li{
                    list-style:none;
                    padding: 3px 8px;
                    margin: 2px 0px;
                    &:hover{
                        background: rgb(163, 163, 209);
                        color: white;
                    }
                }
            }
            .val{
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            min-width: 0;
            .butbox{
                display: flex;
                align-items: center;
                justify-content: flex-end;
                margin-left:10px;
                height: 40px;
                border-bottom: 1px solid #eee;
                .modal-check{
                    margin-right: 30px ;
                }
                .modal-button{
                    font-size: 14px;
                    margin: 0 5px;
                    margin-right: 10px;
                    height: 26px;
                    width: 60px;
                    border: 1px solid #dcdfe6;
                    outline: none;
                    display: inline-block;
                    border-radius: 4px;
                    cursor: pointer;
                    background-color: #fff;
                    transition: 0.1s;
                    &:hover {
                        color: #409eff;
                        border-color: #c6e2ff;
                        background-color: #ecf5ff;
                    }
                    & + & {
                        margin-left: 10px;
                    }

                    &-primary {
                        background-color: #2d8cf0;
                        border-color: #2d8cf0;
                        color: white;
                        &:hover {
                            background: #66b1ff;
                            border-color: #66b1ff;
                            color: #fff;
                        }
                    }
                }
            }
            .valbox{
                padding: 0 10px;
                flex:1;
                min-height: 0;
                overflow: hidden;
                position: relative;
                .list-input{
                    margin-top: 5px;
                    box-sizing: border-box;
                    width: 100%;
                    height: 95%;
                }
                .str-input{
                    margin-top:160px;
                    box-sizing: border-box;
                    input{
                        width: 98%;
                        height: 22px;
                        line-height: 22px;
                        margin-top: 5px;
                    }
                }
                .a2b-input{
                    display: flex;
                    flex-direction: column-reverse;
                    height: 100%;
                    input{
                        width: 98%;
                        height: 22px;
                        line-height: 22px;
                        margin-top: 5px;
                        margin-bottom: 5px;
                    }
                }
                .inBox{
                    position: absolute;
                    top: 5px;
                    left: 10px;
                    right: 10px;
                    bottom: 0;
                    box-sizing: border-box;
                }
            }
            
        }     
    }  
        .searchbox-footer{
            height: 60px;
            textarea{
                width: 100%;
                box-sizing: border-box;
            }
        } 
       
    }
</style>
