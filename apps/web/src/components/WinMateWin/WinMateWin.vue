<template>
    <div style="height: 100%">
        <div class="form">
            <div class="form-left">
                <div class="actionBody">
                    <LkxButton caption="匹配" width="100" type='default' @click="handleMateClick"></LkxButton>
                    <span>格式如：上肉10斤切片</span>
                </div>
                <div class="textarea-wrapper">
                    <div class="line-number" ref="lineNumberEl">
                        <li class="line-number-text" v-for="(item,index) in inputArr">{{ +index +1 }}</li>
                    </div>
                    <textarea id="InputTextarea" class="form-input" v-model="inputTxt" :cols="30" placeholder="请输入肉容或用Ctrl+V粘贴" @scroll="handleInputScroll"></textarea>
                </div>
            </div>
            <div class="form-center">
                <div class="form-grid">
                    <LkxGrid ref='lkxGrid' class="grid" 
                        :columns="gridAction.Columns" 
                        :dataSource="dataSource" 
                        :gridAction="gridAction"
                        :methods="gridAction.Methods" 
                        :events="gridAction.Events"
                        :tableConfig="gridAction.TableConfig"
                        :serachBoxConfig="gridAction.SerachBoxConfig"
                        :pagerConfig="gridAction.PagerConfig"
                        :power="gridAction.PowerList"
                        :loading="gridAction.Loading"
                        :loadText="gridAction.LoadText"
                    >
                        <template #optbut>
                            <div class="delete-but" @click="handleOptButClick">删除</div>
                        </template>
                    </LkxGrid>
                </div>
                <div class="form-action">
                    <span class="indent">提示：智能匹配中第一次没有匹配的商品会自动学习，下次会根据客户商品叫法自动匹配</span>
                    <LkxButton caption="取消" type='default' @click="handleCancel"></LkxButton>
                    <LkxButton caption="确定" type='default' @click="handleConfirm"></LkxButton>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, watch, getCurrentInstance } from "vue"
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { LkxGrid, LkxInput, LkxButton, ModalResultEnum, MessageBox, InputOptionsType } from '@v4x/ui'
import { insertCharAt } from "./util"
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import useAppStore from "@/stores"
import { MateWinInstanceRefs, MateWinOptions } from './types'

defineOptions({
    name: 'WinMateWin'
})

const props = withDefaults(defineProps<MateWinOptions>(), {
    type: 'order',
    billnumber: '',
    customercode: ''
})

const lineNumberEl = ref<null | HTMLElement>(null)
const inputTxt = ref('')
const showMateList = ref(false)
const mateRate = ref(0.5)
const inputArr = ref<any>([])
const UserCode = useAppStore().loginDatas.idcode


const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/saleOrder/aiMate/',
        KeyFieldName: 'seq',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'ismate,seq', pageSize: 0, condition: `userCode=${UserCode}` }
    })
)

const parentInstance = getCurrentInstance()?.parent

const instanceRefs = {
    showMateList: showMateList,
    customercode: props.customercode
} as MateWinInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs, props.type))

const rateDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/PublicApi/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: { condition: `userCode=${UserCode}` }
    })
)

const handleInputScroll = (E: any) => {
    const scrollTop = E.target.scrollTop
    ;(lineNumberEl.value as unknown as HTMLDivElement).scrollTop = scrollTop
}

const handleOptButClick = (Event: MouseEvent) => {
    gridAction.delete()
}

const handleMateClick = (Event: MouseEvent) => {
    const unitList = ['克', '钱', '两', '斤', '公斤', '毫升', '升', '公升', '吨', '件', '瓶', '袋', '箱', '包', '支', '个', '桶', '罐', '组', '篮', '把', '捆', '扎', '束', 'kG', 'G', 'OL', 'ML', 'L']
    let str = inputTxt.value.replace(/\t/g, '')
    const convertStr = str.split('\n')
    for (let i = 0; i < convertStr.length; i++) {
        const thisRowStr = convertStr[i].trim()
        if (thisRowStr.indexOf('|') == -1) {
            convertStr[i] = insertCharAt(thisRowStr, '|', unitList)
        }
    }
    inputTxt.value = convertStr.join('\n')
    for (let i = 0; i < convertStr.length; i++) {
        const _temp = convertStr[i].split('|')
        if (_temp.length != 4) {
            MessageBox.error({
                title: '错误',
                content: `第${i + 1}行,数据"${convertStr[i]}"错误，不匹配数据格式`,
                showCancel: false
            })
            return
        }
        if (!_temp[1] || isNaN(+_temp[1])) {
            MessageBox.error({
                title: '错误',
                content: `第${i + 1}行,数据"${convertStr[i]}"错误，数量出错`,
                showCancel: false
            })
            return
        }
        const _Obj = {
            seq: i + 1,
            name: _temp[0],
            num: _temp[1],
            unit: _temp[2],
            note: _temp[3]
        }
        convertStr[i] = _Obj as any
    }
    gridAction.aiMate(+props.customercode, JSON.stringify(convertStr), UserCode).then(res => {
        gridAction.open()
    })
    return
}


watch(
    () => inputTxt.value,
    (n, o) => {
        inputArr.value = inputTxt.value.split('\n')
    }
)

const handleConfirm = async () => {
    let res
    if (dataSource.dataSet.length > 0) {
        res = await gridAction.update()
        if (!res) {
            return
        }
        res = await gridAction.aIMateToBill(props.billnumber, UserCode)
        if (!res) {
            return
        }
        modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: dataSource.dataSet })
    } else {
        handleCancel()
    }
}

const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form {
    display: flex;
    flex-direction: row;
    height: 100%;
}
.form-left {
    width: 300px;
    border-right: 1px solid black;
    display: flex;
    flex-direction: column;
    .actionBody {
        height: 40px;
        padding-left: 10px;
        display: flex;
        align-items: center;
        gap: 5px;
    }
    .textarea-wrapper {
        flex: 1;
        display: flex;
        flex-direction: row;
        height: 100%;
        margin-bottom: 5px;
        margin-left: 5px;
        border: 1px solid #ccc;
        margin-right: 10px;
        position: relative;
        overflow: hidden;
        .line-number {
            width: 30px;
            padding: 10px 0;
            height: 97%;
            overflow: hidden;
            .line-number-text {
                list-style-type: none;
                text-align: center;
                line-height: 1.5;
                font-size: 20px;
            }
            border-right: 1px solid #ccc;
            overflow: hidden;
        }
        .form-input {
            flex: 1;
            height: 97%;
            line-height: 1.5;
            resize: none;
            font-size: 14px;
            padding: 10px;
            outline: none;
            border: 0;
            font-size: 20px;
        }
    }
}
.form-center {
    flex: 1;
    display: flex;
    flex-direction: column;
    .form-grid {
        flex: 1;
        min-height: 0;
        .grid {
            height: 100%;
        }
    }
    .form-action {
        height: 40px;
        flex-shrink: 0;
        padding: 5px 16px;
        border-top: 1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
        .indent {
            flex: 1;
            text-align: left;
            color: red;
        }
    }
}
.form-right {
    flex: 1;
}
.mateList {
    position: absolute;
    background: #fff;
    z-index: 9999;
    top: 50%;
    left: 80%;
    border: 1px solid #eeee;
    height: 90%;
    width: 650px;
    transform: translate(-50%, -50%)
}
.mateRate {
    width: 50px;
    outline: none;
    text-align: right;
}
.headerPanel {
    background: white;
    border-bottom: 1px solid black;
    padding: 5px;
    button {
        float: right;
        height: 28px;
        width: 80px;
    }
    .Serarch-input {
        height: 28px;
        outline: none;
    }
}
.delete-but {
    width: 100%;
    text-align: center;
    color: red;
    &:hover {
        cursor: pointer;
    }
}
</style>
