<template>
    <div class="_input_body" ref="lkxInputBox">  <!--@change="$emit('update:modelValue', $event.target.value)" -->
        <div class="_input_body-input">
            <input name="ElInputIndicator" ref="Input"
                autocomplete="off" 
                :size=1 
                :value="displayValue" 
                @change="handleChange"
                @focus.prevent="handleFocus"
                @keydown="handleKeyDown"
                @keyup.stop
                @mousedown.stop
                @click.stop
            />
        </div>
        <div class="_indicator" v-if="['drop','datetime'].indexOf(inputType)>-1||indicatorButtons.length>0">
            <span class="_indicator-button" v-if="['drop','datetime'].indexOf(inputType)>-1" @click="handleDropDown">
                <Icons type="down"/>
            </span>
            <span class="_indicator-button" v-for="(item,index) in indicatorButtons" 
                :key = "index" 
                :data-itemKey = "index"
                @click.prevent="handleButMouseDown(item.iconType,index)"
            >
                <Icons :type="item.iconType"/>
             </span>
        </div>
        <teleport to='body'>
            <drop-list v-if="dropVisable" ref="dropList"
                :allowFilter="dropConfig.allowFilter"
                :dropListPosition="dropListPosition"
                :dropListDatas="dropDatas"
                :fields="dropConfig.displayFields"
                :fieldWidths="dropConfig.displayFieldWidths"
                :filterFunc="dropListConfig.onFilter"
                @dropListClose="hanleDropListClose"
            ></drop-list>
            <date-time-drop-list v-if="dateTimeDropVisable" ref="dateTimeDropList"
                :dropListPosition="dateTimePosition"
                :date="displayValue"
                @dropListClose="hanleDateTimeDropListClose"
            ></date-time-drop-list>
        </teleport>
    </div>
</template>

<script setup lang="ts">
import { watch, ref, nextTick, reactive, computed } from 'vue'
import { InputDropConfigType, IndicatorButtonsType, DataSourceType } from '@v4x/ui'
import { fireMoseEvent } from '../usehook/fireEvents'
import lkxUitl from '@v4x/utils/lkxUtil'
import userClickOutside from './UserClickOutside'
import Icons from '../LkxIcons/Icons.vue'
import DropList from '../DropList/index.vue'
import DateTimeDropList from '../DateTimeDropList/index.vue'
import type { InputIndicatorProps, InputIndicatorGridAction } from './types'

// 定义组件名
defineOptions({
    name: 'InputIndicator'
})

const props = withDefaults(defineProps<InputIndicatorProps>(), {
    modelValue: '',
    inputType: '',
    inputFormat: '',
    dataType: '',
    indicatorButtons: () => [],
    allowInputString: false,
    numberFlg: 'note',
    rowData: () => ({}),
    fieldName: '',
    dataSource: () => ({} as any),
    gridAction: () => ({}),
    dropListConfig: () => ({
        allowFilter: true
    })
})

const emit = defineEmits<{
    'update:modelValue': [value: any]
    indicatorButtonClick: [data: { type: string; index: number; rowItem: any }]
}>()

const lkxInputBox = ref<null | HTMLElement>(null)
const Input = ref<null | HTMLInputElement>(null)
const dropList = ref<null | HTMLInputElement>(null)
const dateTimeDropList = ref<null | HTMLInputElement>(null)
const dropVisable = ref(false)
const dateTimeDropVisable = ref(false)
const saveActiveRowIndex = ref(-1)
const KeyboardEventParmars = ref({} as any)
const dropConfig: InputDropConfigType = reactive({
    isDrop: false,
    clickDrop: false,
    allowInput: true,
    allowFilter: false,
    allowException: false,
    indentation: false,
    dropListPosition: {
        top: 0,
        left: 0,
        width: 200,
        height: 0
    },
    dropListDatasName: undefined,
    resultFieldName: 'idcode',
    displayFieldName: 'name',
    displayFields: 'idcode|name',
    displayFieldWidths: '100|200',
    dropListDatas: [],
    onFilter: undefined,
    ...props.dropListConfig
} as InputDropConfigType)

const dropDatas = computed(() => {
    return dropConfig?.dropListDatasName && props.gridAction?.commonDatas
        ? props.gridAction.commonDatas[dropConfig?.dropListDatasName] || []
        : dropConfig?.dropListDatas || []
})

// 为 DropList 组件提供正确的 dropListPosition
const dropListPosition = computed(() => ({
    top: dropConfig.dropListPosition?.top ?? 0,
    left: dropConfig.dropListPosition?.left ?? 0,
    width: dropConfig.dropListPosition?.width ?? 200,
    height: dropConfig.dropListPosition?.height ?? 0
}))

// 为 DateTimeDropList 组件提供正确的 dropListPosition
const dateTimePosition = computed(() => ({
    top: dropConfig.dropListPosition?.top ?? 0,
    left: dropConfig.dropListPosition?.left ?? 0,
    width: dropConfig.dropListPosition?.width ?? 200,
    height: dropConfig.dropListPosition?.height ?? 0
}))

const displayValue = computed((): string => {
    const formater = (data: string | number): string => {
        let res = data
        switch (props.dataType?.toLocaleLowerCase()) {
            case 'number':
                if (props.inputFormat)
                    res = lkxUitl.numberFormat(data, props.inputFormat || '')
                break
            case 'datetime':
                res = lkxUitl.dateFormat(data, props.inputFormat || 'yyyy-MM-dd HH:mm:ss')
                break
            default:
                res = data
                break
        }
        return res as string
    }
    const getDisplayValue = (dropDatas: any[], keyFieldName: string, keyValue: any, resultFieldName: string) => {
        const res = dropDatas.filter((item: any) => {
            return item[keyFieldName] == keyValue
        })
        if (res.length === 0) {
            return keyValue
        } else {
            return res[0][resultFieldName]
        }
    }
    let res: string | number = ''
    
    switch (props.inputType) {
        case 'drop':
            res = getDisplayValue(
                dropDatas.value || [],
                dropConfig.resultFieldName?.toLocaleLowerCase() || 'idcode',
                props.rowData?.[props.fieldName?.toLocaleLowerCase() || ''] ,
                dropConfig.displayFieldName?.toLocaleLowerCase() || 'name')
            break
        default:
           
            res = props.rowData?.[props.fieldName?.toLocaleLowerCase() || ''] 
            break
    }
    return formater(res)
})

const active = () => {
    setTimeout(() => {
        (Input.value as HTMLInputElement)?.select()
    }, 20)
}

const handleFocus = (event: FocusEvent) => {
   // setTimeout(() => {
        (event.target as HTMLInputElement).select()
   // }, 20)
}

const InputValid = (InputText: string): any => {
    const res = { allowInput: true, value: InputText }
    if (props.dataType?.toLocaleLowerCase() == 'number') {
        if (props.numberFlg == '+')
            res.value = Math.abs(parseFloat(res.value)).toString()
        else if (props.numberFlg == '-')
            res.value = (Math.abs(parseFloat(res.value)) * -1).toString()
    }
    if (props.inputType == 'drop') {
        const resultFieldName = props.dropListConfig?.resultFieldName || 'idcode'
        const displayFieldName = props.dropListConfig?.displayFieldName || 'name'
        if (lkxUitl.isNumber(InputText)) {
            const fd = (dropDatas.value || []).filter((item: any) => {
                return item[resultFieldName] == InputText
            })
            res.allowInput = fd.length == 1
        } else {
            const fd = (dropDatas.value || []).filter((item: any) => {
                return item[displayFieldName]?.indexOf(InputText) != -1
            })
            res.allowInput = fd.length == 1
            if (res.allowInput) {
                res.value = fd[0][resultFieldName]
            }
        }
    } else {
        switch (props.dataType?.toLocaleLowerCase()) {
            case 'number': {
                res.allowInput = props.allowInputString || lkxUitl.isNumber(InputText)
                break
            }
            case 'date':
            case 'datetime':
                res.allowInput = lkxUitl.checkDateTime(InputText)
                break
            default:
                res.allowInput = true
                break
        }
    }
    return res
}

const dataIsChange = (_Iv: string) => {
    let res = true
    switch (props.dataType) {
        case 'number': {
            if (props.allowInputString) {
                res = _Iv != (props.modelValue || '')
            } else {
                res = parseFloat(_Iv).toString() != parseFloat((props.modelValue) as string).toString()
            }
            break
        }
        default:
            res = _Iv != (props.modelValue || '')
            break
    }
    return res
}

const changeValue = async (value: any) => {
    let _InputText = value
    const checkData = InputValid(_InputText)
    if (!checkData.allowInput) {
        return false
    }
    _InputText = checkData.value
    if (!dataIsChange(_InputText)) {
        return false
    }
    if (props.gridAction?.beforedEdit) {
        const res = await props.gridAction?.beforedEdit(props.rowData, props.fieldName)
        if (!res) {
            return false
        }
    }
    
    const data = { dropDatas: dropDatas.value, fieldName: props.fieldName, fieldValue: _InputText, editRowIndex: saveActiveRowIndex.value }
    const res = await props.dataSource?.onSetFieldValue(data, props.rowData)
    if (res) {
        props.dataSource?.changeFieldValue(data.fieldName.toLocaleLowerCase(), data.fieldValue, saveActiveRowIndex.value)
        emit('update:modelValue', data.fieldValue)
        props.gridAction?.afterEdit && props.gridAction?.afterEdit(props.dataSource.dataSet[saveActiveRowIndex.value])
    }
    return res
}

const handleChange = async (event: any) => {
    const _InputText = event.target.value
    changeValue(_InputText)
}

const handleKeyDown = (event: KeyboardEvent) => {
    const dropListKeyDown = (event: KeyboardEvent) => {
        const $dropList = dropList.value as any
        switch (event.key) {
            case 'ArrowDown':
                event.preventDefault()
                $dropList.changeSelsIndex(1)
                break
            case 'ArrowUp':
                event.preventDefault()
                $dropList.changeSelsIndex(-1)
                break
            case 'Enter':
                event.stopPropagation()
                fireMoseEvent($dropList.$el.querySelector('.active'), 'mousedown')
                break
            case 'Escape':
                dropVisable.value = false
                break
        }
    }
    const isTextAllSelected = (inputElement: HTMLInputElement) => {
        return inputElement.value.length > 0 && inputElement.selectionStart === 0 && inputElement.selectionEnd === inputElement.value.length
    }
    const gridKeyDown = async (event: KeyboardEvent) => {
        const thisEl = (event.target as HTMLInputElement)
        const selectionStart = thisEl.selectionStart || 0
        const selectionEnd = thisEl.selectionEnd || 0
        KeyboardEventParmars.value = event
        if (['Enter', 'Tab', 'Escape', 'ArrowDown', 'ArrowUp', 'ArrowLeft', 'ArrowRight'].indexOf(event.key) === -1) {
            event.stopPropagation()
        }
        switch (event.key) {
            case 'Escape':
                if (dataIsChange(thisEl.value)) {
                    event.stopPropagation()
                    thisEl.value = (props.modelValue || '') as string
                    thisEl.select()
                }
                break
            case 'ArrowLeft':
                if (isTextAllSelected(thisEl) || selectionStart != 0) {
                    event.stopPropagation()
                }
                break
            case 'ArrowRight':
                if (isTextAllSelected(thisEl) || (selectionEnd != thisEl.value.length)) {
                    event.stopPropagation()
                }
                break
            default:
                if (props.dataType?.toLocaleLowerCase() == 'number' &&
                    !props.allowInputString &&
                    ['-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', 'Backspace', 'Delete'].indexOf(event.key) == -1) {
                    console.log('ent')
                    event.preventDefault()
                }
                break
        }
    }
    if (dropVisable.value) {
        dropListKeyDown(event)
        event.stopPropagation()
    } else {
        gridKeyDown(event)
    }
}

const handleDropDown = (_event: MouseEvent) => {
    const $lkxInput = lkxInputBox.value as HTMLDivElement
    const position = ($lkxInput.parentNode as HTMLDivElement).getBoundingClientRect()
    dropConfig.dropListPosition.top = position.y + position.height
    dropConfig.dropListPosition.left = position.x
    dropConfig.dropListPosition.width = position.width
    dropConfig.dropListPosition.height = position.height
    switch (props.inputType) {
        case 'datetime':
            if (!dateTimeDropVisable.value) {
                dateTimeDropVisable.value = true
            }
            break
        default:
            if (!dropVisable.value) {
                dropVisable.value = true
            }
            break
    }
}

const handleButMouseDown = (type: string, index: number) => {
    emit('indicatorButtonClick', { type, index, rowItem: props.rowData })
}

const hanleDropListClose = (Item: any) => {
    dropVisable.value = false
    let _InputText = ''
    if (typeof (Item) as string != 'object') {
        _InputText = Item
    } else {
        _InputText = Item[dropConfig.resultFieldName || '']
    }
    console.log('_InputText', _InputText)
    changeValue(_InputText)
    setTimeout(() => { (Input.value as HTMLInputElement).select() }, 10)
}

const hanleDateTimeDropListClose = (data: any) => {
    dateTimeDropVisable.value = false
    if (data.action == 'mrOk') {
        const v = lkxUitl.dateFormat(data.datetime, props.inputFormat || 'yyyy-MM-dd HH:mm:ss')
        const _data = { fieldName: props.fieldName, fieldValue: v, editRowIndex: saveActiveRowIndex.value }
        props.dataSource?.onSetFieldValue(_data, props.rowData).then((res) => {
            if (res) {
                props.dataSource?.changeFieldValue(_data.fieldName.toLocaleLowerCase(), _data.fieldValue, saveActiveRowIndex.value)
                emit('update:modelValue', _data.fieldValue)
            }
        })
    }
    setTimeout(() => { (Input.value as HTMLInputElement).select() }, 10)
}

const isClickOutside = userClickOutside(lkxInputBox, props.inputType || 'text')
watch(
    isClickOutside,
    () => {
        if (dropVisable.value && isClickOutside.value) {
            dropVisable.value = false
        }
        if (dateTimeDropVisable.value && isClickOutside.value) {
            dateTimeDropVisable.value = false
        }
    }
)

nextTick(() => {
    saveActiveRowIndex.value = props.dataSource.activeRowIndex
    Input.value?.select()
})

defineExpose({
    dropDatas, dropVisable, dateTimeDropVisable, dropConfig, dropList, dateTimeDropList, lkxInputBox,
    Input, displayValue, active,
    handleFocus, handleDropDown, handleChange, handleKeyDown, handleButMouseDown, hanleDropListClose,
    hanleDateTimeDropListClose
})
</script>

<style lang="scss" scoped>
    ._input_body{
        display: flex;
    }
    ._input_body-input{
        flex: 1;
    }
    input{
        box-sizing: border-box;//解决input右边超出你元素
        outline: 0;
        border: 0;
        width: 100%;
        height: 100%;
        font-family: inherit;
        font-size: inherit;
    }
    ._indicator{
        border-left: 1px solid $table-line-color;
        background: $table-fixed-basic-color;
    }
    ._indicator-button{
        padding: 0 2px;
        border-radius: 5px;
        &:hover{
            //border: 1px solid $table-line-color;
            color: red;
        }
        &:active{
            background: $active-bg-color;
        }
    }
</style>
