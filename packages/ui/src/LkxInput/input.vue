<template>
<div class="lkx-input" ref="lkxInputBox">
    <span v-if="config.caption" class="lkx-input-title" :style="{width:config.captionWidth+'px'}"
        :class="[{'required':config.required},{'center':config.captionAlign=='center','right':config.captionAlign=='right'}]"
    >
        {{config.caption}}
    </span>
    <div class="lkx-input-content" :class="[config.border?isFocus?'active':'blur':'']" @click="handleContrntClick">
        <!--input 这个一定要加size="xxx"，不然在flex布局中宽充没法少于一定宽度-->
        <input ref="lkxInput" 
            :value="displayValue" 
            :checked="displayValue=='1'"
            :data-curval="modelValue"
            :name='props.fieldName'
            :type="config.inputType" 
            :size="1"
            :class="['lkx-input-inner-'+config.inputType,{'center':config.align=='center','right':config.align=='right'}]"
            autocomplete="off"
            :title="config.errmsg"
            :pattern="setPattern()"
            :placeholder="config.placeholder||placeholder"
            :disabled="typeof config.disabled == 'function'?config.disabled():config.disabled"
            :readonly="config.readonly||!dropConfig.allowInput"
            @click="handleClick"
            @focus="handleFocus"
            @input="handleInput"
            @change="handleChange" 
            @blur="handleBlur"
            @keydown="handleKeyDown"
        />
        <!--checkbox|raido 的后缀-->
        <label v-if="config.inputType=='checkbox'||config.inputType=='radio'">{{config.checkboxCaption}}</label>
        <!--后缀按钮-->
        <div v-if="showSuffix" class="lkx-input-butgroup"
            :class="[(typeof config.disabled == 'function'?config.disabled():config.disabled)!=true?'':'lkx-input-disabled']" 
        >
            <Icons v-if="['drop','datetime','linkage'].indexOf(config.inputType||'')>-1" 
                type="down"
                class="lkx-input-but"
                :class="[(typeof config.disabled == 'function'?config.disabled():config.disabled)!=true?'lkx-input-but-enabled':'lkx-input-but-disabled']" 
                @butClick.prevent="handleDropDown"
            />
            <Icons v-for="(item,index) in config.buttons" 
                :key = "index"
                :data-itemKey = "index"
                :type="item.iconType"
                class="lkx-input-but"
                :class="[(typeof config.disabled == 'function'?config.disabled():config.disabled)!=true?'lkx-input-but-enabled':'lkx-input-but-disabled']" 
                @butClick.prevent="handleButMouseDown(item)"
            />
        </div>
    </div>
    <teleport to='body'>
        <drop-list v-if="dropVisable" ref="dropList"
            :allowFilter="dropConfig.allowFilter"
            :dropListPosition="dropListPosition"
            :dropListDatas="dropConfig.dropListDatas"
            :fields="dropConfig.displayFields"
            :fieldWidths="dropConfig.displayFieldWidths"
            :indentation = "dropConfig.indentation"
            :filterFunc="dropConfig.onFilter"
            @dropListClose="hanleDropListClose"
        ></drop-list>
        <date-time-drop-list v-if="dateTimeDropVisable" ref="dateTimeDropList"
            :dropListPosition="dateTimePosition"
            :date = "String(modelValue)"
            @dropListClose="hanleDateTimeDropListClose"
        ></date-time-drop-list>
        <linkage-drop-list v-if="linkageDropVisable" ref="LinkageDropListRef"
            :keyValue="getLinkageValue()[0]"
            :dropListPosition="dropListPosition"
            :dropListDatas="dropConfig.dropListDatas"
            @dropListClose="hanleLinkageDropListClose"
        ></linkage-drop-list>
    </teleport>
</div>
    
</template>
 
<script setup lang="ts">
import { reactive, ref, watch, computed ,useTemplateRef} from 'vue'
import { InputConfigType, InputDropConfigType, DataSourceType } from '@v4x/ui'
import Icons from "../LkxIcons/Icons.vue"
import DropList from '../DropList/index.vue'
import DateTimeDropList from '../DateTimeDropList/index.vue'
import LinkageDropList from './linkageDropList/index.vue'
import userClickOutside from '../usehook/UserClickOutside'
import { fireMoseEvent } from '../usehook/fireEvents'
import lkxUitl from '@v4x/utils/lkxUtil'

defineOptions({
    name: 'LkxInput'
})

import type { InputOptionsType } from './types'

const props = withDefaults(defineProps<InputOptionsType>(), {
    fieldName: '',
    placeholder: '',
    modelValue: '',
    dataSource: () => ({}) as any,
    config: () => ({} as InputConfigType),
    dropConfig: () => ({} as InputDropConfigType)
})

const emit = defineEmits<{
    'update:modelValue': [value: string | number]
}>()
        
const config: InputConfigType = reactive(Object.assign({
            align:'left',/**对齐方式 left|center|right */
            caption:'',/**前序标题文字 */
            captionWidth:35,/**前序标题宽度 */
            captionAlign:'left',/**前序标题对齐方式 left|center|rigth */
            placeholder:'',/**占位符文字 */
            disabled:false,/**是否可输入 */
            readonly:false,/**只读 */
            format:'',/**格式化样式字符串 */
            border: true,
            buttons:[] ,/**后序的按钮 */
            inputType:'text',/**输入框类型，text | datetime | number |checkbox */
            checkboxLable:'',/**checkbox|radio后面文字 */
            
        },props.config))
const dropConfig: InputDropConfigType = reactive(Object.assign({
            isDrop:false,/**是否下拉 */
            clickDrop: false,/**焦点打开下拉 */
            allowInput: true,/*下拉框时是否允许输入数据自动查询下拉值 */
            allowFilter: false,
            allowException: false,/*允许例外，下拉没有时可以作为数据输入*/
            indentation: false,/**缩进 */
            dropListPosition:{/**下拉组件位置 */
                top: 0,
                left:0,
                width:200,
                elClientRect:{}
            },
            resultFieldName:'idcode',/**下拉返回字段 */
            displayFieldName:'name',/**下拉显示字段 */
            displayFields:'idcode|name',/**下拉列表列 idcode|name|... */
            displayFieldWidths:'100|200',/**下拉列表列 列宽度 100|200|... */
            dropListDatas: []/**下拉数据列表 */
        },props.dropConfig))
const isFocus = ref(false)
const lkxInput = useTemplateRef('lkxInput')
const dropList = useTemplateRef('dropList')
const dateTimeDropList = useTemplateRef('dateTimeDropList')

const dropVisable = ref(false)
const dateTimeDropVisable = ref(false)
const linkageDropVisable = ref(false)
/**设置验证规则 */
const setPattern=()=>{
    if (config.required&&config.inputType == 'mobilephone'){
        return '^1[3|4|5|7|8|9][0-9]\\d{8}$';
    }
    if (config.required&&!config.pattern){ //不可以为空
        return '\\S';
    }
    return config.pattern
}
    
const showSuffix =computed(()=>{
    return  config.buttons?.length||
            ['datetime','drop','linkage'].indexOf(config.inputType||'')>-1

})

const dropListPosition = computed(() => ({
    top: dropConfig.dropListPosition.top ?? 0,
    left: dropConfig.dropListPosition.left ?? 0,
    width: dropConfig.dropListPosition.width ?? 200,
    height: dropConfig.dropListPosition.height ?? 0
}))

const dateTimePosition = computed(() => ({
    top: dropConfig.dropListPosition.top ?? 0,
    left: dropConfig.dropListPosition.left ?? 0,
    width: dropConfig.dropListPosition.width ?? 200,
    height: dropConfig.dropListPosition.height ?? 0
}))
const getLinkageValue = (): string[]=>{
    const _v = (props.modelValue as string||'').split('|')
    return _v
}
/**
 * 输入是否有效
 */
const _InputValid = (InputText: string): any=>{
    const res = {allowInput: true,value: InputText};
    switch (config.inputType?.toLocaleLowerCase()){
        case 'number':{
            res.allowInput = lkxUitl.isNumber(InputText);
            break;
        }
        case 'date':
        case 'datetime':
            res.allowInput = lkxUitl.checkDateTime(InputText);
            break;
        default:
            res.allowInput = true;
            break;
    }
    return res;
}
const displayValue = computed((): string=>{
    const formater = (data: string|number): string =>{
        let res = data;
            switch (config.inputType){
            case 'number':
            case 'text':
                if (config.format)
                    res = lkxUitl.numberFormat(data,config.format||'')
                break;
            case 'datetime':
                res = lkxUitl.dateFormat(data,config.format||'yyyy-MM-dd')
                break;
            default:
                res = data
                break;
        } 
        return res as string;
    }
    const getDisplayValue = (datas: any,keyFieldName: string,keyValue: any,resultFieldName: string)=>{
        
        const res = datas.filter((item: any)=>{
            return item[keyFieldName.toLocaleLowerCase()] == keyValue
        })
        if (res.length==0) { 
            return keyValue
        } else {
            return res[0][resultFieldName.toLocaleLowerCase()]
        }
    }
    let res: string|number = '';
    switch (config.inputType){
        case 'drop':
            res = getDisplayValue(dropConfig.dropListDatas,dropConfig.resultFieldName||'',props.modelValue,dropConfig.displayFieldName||'')
            break;
        case 'linkage':
            res = getLinkageValue()[1]
            break
        default:
            res = props.modelValue
            break;
    } 
    return formater(res);

})
const handleInput = (e: Event)=>{
    if (config.inputType == 'checkbox'){
        if (!(e.target as any).value||(e.target as any).value=='0'){
            emit('update:modelValue','1')
        } else {
            emit('update:modelValue','0')
        }
    } /*else if (config.inputType!='drop'&&!config.format||dropConfig.allowException){
        emit('update:value',(e.target as any).value)
    }*/
}
const handleChange=(e: any) => {
    
    /**
     * @param datas Array   数据源
     * @param keyFieldName String 主键字段名
     * @param resultFieldName String 返回字段名
     * @param inputValue String|number 输入值
     */
    const getDropValue = (datas: any,keyFieldName: string,resultFieldName: string, inputValue: string|number)=>{
        const keylist = datas.filter((item: any)=>{
            return item[keyFieldName] == inputValue || item[resultFieldName] == inputValue
        })
        if (keylist.length >0){
            return keylist[0][keyFieldName]
        } else {
            return false
        }
    }
    let updateVal = ''
    if (config.inputType!='drop'){
        updateVal = getDropValue(dropConfig.dropListDatas,'idcode','name',e.target.value)
        // console.log('updateVal',updateVal)
        if (updateVal){
            emit('update:modelValue',updateVal)
        } else {
            emit('update:modelValue',e.target.value )
            if (dropConfig.allowException){//允许例外
                emit('update:modelValue',e.target.dataset.curval)
            }
        }
    }
    if (config.format){
        let _val = e.target.value
        if (_val[_val.length-1]=='%'){
            _val = _val.substring(0, _val.length - 1)
        }
        emit('update:modelValue',_val)
    }
    config.onChange&&config.onChange(e.target.value)
}
const handleFocus = (_e: any)=>{
    if (!isFocus.value){
        isFocus.value = true
    }
    (lkxInput.value as any).select()
}
const handleBlur = (_e: any)=>{
    isFocus.value = false
}
/**下拉单击 */
const handleDropDown = (e: MouseEvent)=>{
    if (typeof config.disabled == 'function'?config.disabled():config.disabled){
        return
    } 
    handleFocus(e)
    const $lkxInput = lkxInput.value as any
    const position = $lkxInput.parentNode.getBoundingClientRect()//getOffsetTopByBody(this.$refs.lkinput)
    dropConfig.dropListPosition.top = position.y+position.height
    dropConfig.dropListPosition.left = position.x
    dropConfig.dropListPosition.width = position.width
    dropConfig.dropListPosition.height = position.height
    switch (config.inputType){
        case 'datetime':
            if (!dateTimeDropVisable.value){
                dateTimeDropVisable.value = true
            }
            break;
        case 'linkage':
            if (!linkageDropVisable.value){
                linkageDropVisable.value = true
            }
            break;
        default:
            
            if (!dropVisable.value){ 
                dropVisable.value = true
            } 
            break;
    }
    
}
const handleClick = (_e: MouseEvent)=>{
    if (dropConfig.clickDrop){
        handleDropDown(_e)
    }

}
const handleContrntClick = (e: MouseEvent)=>{
    if ((config.inputType == 'checkbox'|| config.inputType == 'radio')&&config.disabled!=true){
        fireMoseEvent(lkxInput.value as any,'click')
        handleFocus(e)
    }
}
/**自定按钮事件 */
const handleButMouseDown = (item: any)=>{
    handleFocus(null as any)
    item.onClick&&item.onClick(item)
}
/**下拉关闭事件 */
const hanleDropListClose = (Item: any)=>{

    dropVisable.value = false
        if (typeof(Item) as string != 'object'){ //如果dropListDatas不为对象数组时
        emit('update:modelValue', Item||'')
        config.onChange&&config.onChange(Item||'')
    } else {
        // const val = (dropConfig.dropListDatas as any)[index]
        emit('update:modelValue', Item[dropConfig.resultFieldName||''])
        config.onChange&&config.onChange(Item)
    }
    /* let index = 0
    for (let i=0;i<(dropConfig.dropListDatas as any).length;i++){
        if ((dropConfig.dropListDatas as any)[i][dropConfig.resultFieldName||''] == Item[dropConfig.resultFieldName||'']){
            index = i
            break;
        }
    }
    dropVisable.value = false
    thisDropListIndex.value = index;
    const item = (dropConfig.dropListDatas as any)[index];

    if (typeof(item) as string != 'object'){ //如果dropListDatas不为对象数组时
        emit('update:modelValue', item||'')
        config.onChange&&config.onChange(item||'')
    } else {
        const val = (dropConfig.dropListDatas as any)[index]
        emit('update:modelValue', val[dropConfig.resultFieldName||''])
        config.onChange&&config.onChange(val)
    }
    */
}
const hanleLinkageDropListClose=(data: any)=>{
    linkageDropVisable.value = false
    if (data.action == 'mrOk'){
        config.onChange&&config.onChange(data.value)
        emit('update:modelValue', data.value)
    }
}
    /**日期时间关闭事件 */
const hanleDateTimeDropListClose = (data: any)=>{
    dateTimeDropVisable.value = false
    if (data.action == 'mrOk'){
        emit('update:modelValue',lkxUitl.dateFormat(data.datetime,props.config.format||'yyyy-MM-dd HH:mm:ss'))
        config.onChange&&config.onChange(lkxUitl.dateFormat(data.datetime,props.config.format||'yyyy-MM-dd HH:mm:ss'))
    }

}
/**按键事件 */
const handleKeyDown = (e: KeyboardEvent)=>{
    if (!dropVisable.value){
        switch (e.code){
            case 'Escape':
                // (e.target as any).value = (e.target as HTMLElement).dataset.curval||''
                // console.log(e.target)
                break
        }
    }
    
    if (!dropVisable.value) return
    const $dropList = dropList.value as any
    switch (e.code){
        case 'ArrowDown':
            e.preventDefault()
            $dropList.changeSelsIndex(1)
            break
        case 'ArrowUp':
                e.preventDefault()
            $dropList.changeSelsIndex(-1)
            break
        case 'Enter':
            e.stopPropagation()
            fireMoseEvent($dropList.$el.querySelector('.active'),'mousedown')
            break
        case 'Escape':
            dropVisable.value = false
            break
    }
}
const handleKeyPress = (_e: KeyboardEvent)=>{
    console.log('keypress')
    /* switch (_e.code){
        case 'Enter':
            if ((_e.target as any).value != displayValue.value)
                fireHtmlEvent(lkxInput.value as any,'change')
            emit('keypress',_e)
            break;
    }*/
}
const lkxInputBox = ref<null | HTMLElement>(null)

const isClickOutside = userClickOutside(lkxInputBox,config.inputType||'text')//是否点击输入框外，用于关闭下拉
const focus = ()=>{
    (lkxInput.value as HTMLInputElement).focus()
}
defineExpose({
    focus
})
watch(
    isClickOutside, 
    () => {
    if (dropVisable.value&&isClickOutside.value){
        dropVisable.value = false
    }
    if (linkageDropVisable.value&&isClickOutside.value){
        linkageDropVisable.value = false
    }
        if (dateTimeDropVisable.value&&isClickOutside.value){
        dateTimeDropVisable.value = false
    }
    
})
watch(
    ()=>props.dropConfig.dropListDatas,
    (n,_o)=>{
        dropConfig.dropListDatas = n
    }
)
</script>

<style lang="scss" scoped>
	$height: 32px;
    .active{
        border:1px solid #0094ff;
    }
	.blur{
		border:1px solid #E6E1DC;
	}
	.lkx-input{
		display: inline-flex;
        height: $height;
        .lkx-input-title{
            margin-right: 3px;
            line-height: $height;
            display: inline-block;
            
        }
        .required{
            &::after {
                content: "*";
                padding-left: 2px;
                color:red;
                display:inline-block;
                vertical-align:middle;
                height:100%;
            }
        }
        .lkx-input-content{
            display: flex;
            flex: 1;
            border-radius: 2px;
            align-items: center;     /* 垂直居中 */
            .lkx-input-inner-text,.lkx-input-inner-number,
            .lkx-input-inner-drop,.lkx-input-inner-datetime,
            .lkx-input-inner-linkage,.lkx-input-inner-mobilephone{
                flex: 1;
                border:0px;
                border-radius: 2px;
                height: $height - 5 ;
                width: 100%;
                &:focus{
                    border:0;
                    outline:none;
                }
            }
         
            .lkx-input-inner-checkbox{
                cursor: pointer;
                width: 15px;
                height: 15px;
                position: relative;
            }
            .lkx-input-inner-radio{
                 cursor: pointer;
            }
             .lkx-input-disabled{
                background:#f8f8f8; 
            }
            .lkx-input-butgroup{
                display: flex;
                /*justify-content: center;  水平居中 */
                align-items: center;     /* 垂直居中 */
                height: 100%;
                padding-left: 5px;
                border-left: 1px solid #E6E1DC;
                .lkx-input-but{
                    margin-right: 5px;
                }

                .lkx-input-but-enabled{
                    //background-color:white; 
                     &:hover{
                        color: red;
                    }
                    &:active{
                        color: rgb(37, 37, 32);
                    }
                }
                .lkx-input-but-disabled{
                    color:#E6E1DC;
                }
                
            }
			
        }
	}
	.center{
		text-align: center;
	}
	.right{
		text-align: right;
	}
	.left{
		text-align: left;
	}
	
	/* 谷歌 number时，如何去掉右边的 +、-号*/
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
		appearance: none; 
		margin: 0; 
	}
</style>
