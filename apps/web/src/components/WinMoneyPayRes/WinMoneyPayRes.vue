<template>
    <div class="modal-container">
        <div class="headerPanel" v-if="showHeader">
            <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
        </div>
        <div class="modal-footer">
            <button class="modal-footer-button" @click="handleClose(false)">取消</button>
            <button class="modal-footer-button modal-footer-button-primary" @click="handleSubmit">{{type=='pay'?'确定支付':'确定收款'}}</button>
        </div>
        <div class="grid-body">
            <div class="grid-body-left">
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
                />
            </div>
            <div class="grid-body-right">
                <LkxGrid ref='lkxDetailGrid' class="gridList" 
                    :columns="gridMoneyListAction.Columns" 
                    :dataSource="gridMoneyListAction.dataSource" 
                    :gridAction="gridMoneyListAction"
                    :methods="gridMoneyListAction.Methods" 
                    :events="gridMoneyListAction.Events"
                    :tableConfig="gridMoneyListAction.TableConfig"
                    :serachBoxConfig="gridMoneyListAction.SerachBoxConfig"
                    :pagerConfig="gridMoneyListAction.PagerConfig"
                    :power="gridMoneyListAction.PowerList"
                    :loading="gridMoneyListAction.Loading"
                    :loadText="gridMoneyListAction.LoadText"
                >
                    <template #headerPanel>
                        <div class="headerPanelEx">
                            <label>过滤条件<input type="text" class="filter" :placeholder="type=='pay'?'以日期过滤':'以送货日过滤'" @keypress="handleKeypress" /></label>
                            <button @click="handleBatchToList">全部调入</button>
                        </div>
                    </template>
                </LkxGrid>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, getCurrentInstance, onMounted, watch, markRaw } from 'vue'
import { LkxGrid, ModalResultEnum } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { MessageBox, type CommondDatasParamType } from '@v4x/ui'
import $api from '@/request/api'
import { TDataSource } from "@/usehook/dataSource"
import { TAction, TMoneyListAction } from "./action"
import { MoneyPayResOptions, MoneyPayResInstanceRefs } from './types'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import userAppStore from '@/stores'

defineOptions({
    name: 'WinMoneyPayRes'
})

const props = withDefaults(defineProps<MoneyPayResOptions>(), {
    type: 'pay',
    companyCode: 0,
    curBillNumber: '',
    condition: '',
    look: false
})

const lkxGrid = ref<null | HTMLElement>(null)
const lkxDetailGrid = ref<null | HTMLElement>(null)
const ApiPath = props.type == 'pay' ? '/masterApi/DisApi/finance/payMent' : '/masterApi/DisApi/finance/Receivables'
const ApiPathEx = props.type == 'pay' ? '/masterApi/DisApi/finance/Payable' : '/masterApi/DisApi/finance/receivable'
const userCode = userAppStore().loginDatas.idcode
const showHeader = ref(false)
const headerData = ref({})

const instanceRefs = markRaw<MoneyPayResInstanceRefs>({
    headerData: headerData,
    gridAction: null as any,
    gridMoneyListAction: null as any,
    gridDetailListAction: null as any,
    detailListDataSource: null as any
})

const dataSource = reactive(
    new TDataSource({
        ApiPath: ApiPath + '/Detail/',
        KeyFieldName: 'Idkey',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const dataDetailSource = reactive(
    new TDataSource({
        ApiPath: ApiPathEx + '/DetailOnList/',
        KeyFieldName: props.type == 'pay' ? 'BillNumber' : 'DeliveryAt',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const gridAction = reactive(new TAction(dataSource, instanceRefs, props.type))
const gridMoneyListAction = reactive(new TMoneyListAction(dataDetailSource, instanceRefs, props.type))

gridAction.instanceRefs.gridAction = gridAction
gridAction.instanceRefs.gridMoneyListAction = gridMoneyListAction

const headerConfig = ref<HeaderConfigType>({
    items: [
        [{
            fieldName: props.type == 'pay' ? 'shippercode' : 'customercode',
            span: 5,
            config: {
                caption: props.type == 'pay' ? '货商' : '客户',
                captionAlign: 'right',
                disabled: true,
                align: 'left',
                inputType: 'drop',
            },
            dropConfig: {
                allowInput: false,
                allowFilter: false,
                dropListPosition: {},
                resultFieldName: 'idcode',
                displayFieldName: 'name',
                displayFields: 'idcode|name',
                displayFieldWidths: '70|100',
                dropListDatas: props.type == 'pay' ? props.commonDatas.ShipperDatas : props.commonDatas.CustomerDatas
            }
        }, {
            fieldName: 'paytypecode',
            span: 5,
            config: {
                caption: '支付方式',
                captionAlign: 'left',
                captionWidth: 80,
                align: 'left',
                inputType: 'drop',
                onChange: (data: any) => {
                    (headerData.value as any).paytypecode = data.idcode
                }
            },
            dropConfig: {
                allowInput: false,
                allowFilter: false,
                dropListPosition: {},
                resultFieldName: 'idcode',
                displayFieldName: 'name',
                displayFields: 'idcode|name',
                displayFieldWidths: '70|100',
                dropListDatas: props.commonDatas.PayTypeDatas
            }
        }, {
            fieldName: 'examineat',
            span: 4,
            config: {
                caption: '日期',
                captionAlign: 'right',
                disabled: true,
                align: 'left',
                inputType: 'text',
            }
        }, {
            fieldName: 'billnumber',
            span: 5,
            config: {
                caption: '单号',
                captionAlign: 'right',
                disabled: true,
                inputType: 'text',
                format: '0.00'
            }
        }], [{
            fieldName: 'note',
            span: 14,
            config: {
                caption: '摘要',
                captionAlign: 'right',
                align: 'left',
                inputType: 'text',
                onChange: (data: any) => {
                    (headerData.value as any).note = data
                }
            }
        }, {
            fieldName: 'money',
            span: 5,
            config: {
                caption: '金额',
                captionAlign: 'right',
                align: 'right',
                disabled: true,
                inputType: 'text',
                format: '0.00'
            }
        }]
    ]
})



const buildPayMent = async (companyCode: number | string, curBillNumber: string) => {
    MessageBox.loading({
        moreText: '正在加载数据...',
        mask: true
    })
    const submitRes = await $api.comonRequest(ApiPath + '/Lists/', 'buildBill', {
        companyCode: companyCode,
        curBillNumber: curBillNumber
    })
    if (submitRes.errCode == 0) {
        const res = await $api.comonRequest(ApiPath + '/Lists/', 'get', {
            condition: `billNumber='${submitRes.resultValue}'`
        })
        headerData.value = res.datas[0]
        showHeader.value = true
        gridAction.dataSource.getParams.condition = `billNumber='${submitRes.resultValue}'`
        await gridAction.open()
        if (props.type == 'pay')
            gridMoneyListAction.dataSource.getParams.mustCondition = `${props.condition} and billNumber not in (select curbillNumber From L_Bill_PayMents_Tab where billnumber='${submitRes.resultValue}')`
        else
            gridMoneyListAction.dataSource.getParams.mustCondition = `${props.condition} and billNumber not in (select curbillNumber From L_Bill_Receivabless_Tab where billnumber='${submitRes.resultValue}')`
        await gridMoneyListAction.open()
    }
    MessageBox.closeAllLoading()
}

const handleKeypress = (Event: KeyboardEvent) => {
    if (Event.key == 'Enter') {
        const El = Event.target as HTMLInputElement
        gridMoneyListAction.dataSource.dataSet = gridMoneyListAction.dataSource.CurDataSet.filter((item: any) => {
            if (props.type == 'pay')
                return item.examineat.indexOf(El.value) > -1
            return item.deliveryat.indexOf(El.value) > -1
        })
        El.value = ''
    }
}

const handleBatchToList = (Event: MouseEvent) => {
    const _data = gridMoneyListAction.dataSource.dataSet
    gridMoneyListAction.ToListPuls(_data)
}

const parentInstance = getCurrentInstance()?.parent

const handleClose = async (flg: boolean) => {
     if ((headerData.value as any).examineusercode == 0) {
        MessageBox.loading({
            moreText: '正在清除...',
            mask: true
        })
        const res = await $api.comonRequest(ApiPath + '/Lists/', 'delete', {
            keyFieldName: 'billnumber',
            keyFieldValue: (headerData.value as any).billnumber
        })
        MessageBox.closeAllLoading()
    } 
    setTimeout(() => {
        modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
    }, 0)
}

const handleSubmit = async () => {
    const res = await MessageBox.question({
        title: '提问',
        content: `是否确认${props.type == 'pay' ? '付款' : '收款'}？`
    })
    if (res.action == ModalResultEnum.mrCancel) return false
    MessageBox.loading({
        moreText: `正在${props.type == 'pay' ? '支付' : '收款'}...`,
        mask: true
    })
    const _U = await gridAction.update(false)
    if (_U) {
        try {
            const res = await $api.comonRequest(ApiPath + '/Detail/', 'submit', {
                billnumber: (headerData.value as any).billnumber,
                UserCode: userCode,
                updatetype: 1,
                paytypecode: (headerData.value as any).paytypecode,
                note: (headerData.value as any).note
            })
            if (res.errCode == 0) {
                
                MessageBox.toast({ content: props.type == 'pay' ? '付款成功' : '收款成功' })
                setTimeout(() => {
                    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: null })
                }, 100)
            }
        } finally {
           MessageBox.closeAllLoading()
        }
       
    }
   
}

onMounted(() => {
    buildPayMent(props.companyCode, props.curBillNumber)
})
</script>

<style lang="scss" scoped>
.modal-container {
    display: flex;
    flex-direction: column;
    height: 100%;
}

.modal-footer {
    display: flex;
    justify-content: flex-end;
    padding: 4px 26px;
    margin-right: 40px;
    border-bottom: 1px solid #e4e7ed;
    height: 30px;
    flex-shrink: 0;

    &-button {
        line-height: 1em;
        font-size: 14px;
        width: 120px;
        padding: 8px 20px;
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

.grid-body {
    display: flex;
    flex: 1;
    min-height: 0;
}

.grid-body-left {
    flex: 1;
    height: 430px;
}

.grid-body-right {
    width: 500px;
    height: 430px;
    padding-right: 10px;
}

.grid {
    position: relative;
    margin: 2px;
    height: 100%;
    width: 100%;
}

.gridList {
    position: relative;
    margin: 2px;
    height: 100%;
    width: 100%;
}

.headerPanelEx {
    display: flex;
    align-items: center;
    height: 30px;

    * {
        margin-left: 5px;
    }

    .filter {
        outline-color: blue;
        outline-width: 0;
    }
}
</style>
