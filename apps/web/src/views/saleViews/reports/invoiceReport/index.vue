<template>
    <div class="win" ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
        <div class="win-hearder">
            <lkx-input class="Input-At-Start"
                name="startat"
                :config="startDeliveryState.config"
                :dropConfig="startDeliveryState.dropConfig"
                v-model="startDeliveryAt"
            />
            <lkx-input class="Input-At-End"
                name="endat"
                :config="endDeliveryState.config"
                :dropConfig="endDeliveryState.dropConfig"
                v-model="endDeliveryAt"
            />
            <lkx-input class="shipper-input"
                name="customerCode"
                :config="customerState.config"
                :dropConfig="customerState.dropConfig"
                v-model="customerCode"
            />
            <lkx-input class="note-input"
                :config="OrderNoteState.config"
                v-model="OrderNote"
            />
            <label style="width: 100px;"><input name="ElCheckList" type="checkbox" v-model="checkListEx"/>外帐</label>
            <button @click="handleApplay">应用</button>
            <button @click="handleExport">导出</button>
        </div> 
        <div class="win-body" media="print">
            <table ref="printDom">
                <tbody>
                    <table cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                           <tr>
                                <td :colspan="1" class="nobarder" style="padding-left:20px"></td>
                                <td :colspan="3" class="nobarder" style="padding-left:20px">客户：{{customerName}}</td>
                                <td :colspan="4" class="nobarder">日期：{{startDeliveryAt}}到{{endDeliveryAt}}</td>
                            </tr>
                            <tr >  
                                <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </td>
                            </tr>
                        </thead>
                        <tbody v-for="(ProwItem,prowIndex) in gridAction.dataSource.dataSet" :key="prowIndex" :class="{active:prowIndex==billdetailindex}">
                            <tr class="lkx-table-body-row">
                                <td :colspan="4">{{ ProwItem.catename }}</td>
                                <td ></td>
                                <td ></td>
                                <td ></td>
                                <td ></td>
                            </tr>
                            <tr v-for="(rowItem,rowIndex) in ProwItem.children" :key="rowIndex" 
                                @dblclick="handleToDelete($event,ProwItem.children,+rowIndex,ProwItem,prowIndex)">
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                                    :style="{textAlign:cellItem.align}">
                                    <div v-if="cellItem.fieldName=='sep'">{{+rowIndex+1}}</div>
                                    <div v-else>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                            <tr>
                                <td :colspan="4" style="text-align: center;">{{ProwItem.catename+'小计'}}</td>
                                <td style="text-align: right;">{{ calcSubNum(ProwItem.children) }}</td>
                                <td ></td>
                                <td ></td>
                                <td style="text-align: right;">{{ calcSubMoney(ProwItem.children) }}</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td :colspan="4" style="text-align: center;">总计</td>
                                <td style="text-align: right;">{{ calcTotalNum(gridAction.dataSource.dataSet) }}</td>
                                <td ></td>
                                <td ></td>
                                <td style="text-align: right;">{{ calcTotalMoney(gridAction.dataSource.dataSet) }}</td>
                            </tr>
                        </tfoot>
                    </table>
                </tbody>
            </table>
       </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, watch, nextTick } from 'vue'
import { WinModal, type ModalResultValue } from '@v4x/ui'
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput, ModalResultEnum } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import { TableColumnsType, TableRowDataType } from '@v4x/ui'
import $api from '@/request/api'
import WinChangeProductComponent from './InputWin/InputWin.vue'
import { MessageBox } from '@v4x/ui'
import { ExportTableToExcel } from '@v4x/utils'
import { WinProductSelect } from '@/components'

defineOptions({
    name: 'reports/invoiceReport'
})

const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)
const billIndex = ref(-1)
const billdetailindex = ref(-1)
const Win = reactive(new TWinForm({}))
const checkListEx = ref(false)
const customerName = ref('')
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/reports/InvoiceReport/',
        KeyFieldName: 'ProductCode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)
const gridAction = reactive(new TListGridAction(dataSource, {}))
const startDeliveryAt = ref($Utils.getMonthFirst())
const endDeliveryAt = ref($Utils.getMonthLast())
const customerCode = ref(0)
const OrderNote = ref('')

const startDeliveryState = ref<InputOptionsType>({
    config: {
        caption: '送货日期 从', 
        captionWidth: 100,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
    },
})

const endDeliveryState = ref<InputOptionsType>({
    config: {
        caption: '到', 
        captionWidth: 20,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
        }
    },
})

const customerState = ref<InputOptionsType>({
    config: {
        caption: '客户', 
        captionWidth: 40,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
            customerName.value = data.name
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|shortname|name',
        displayFieldWidths: '50|100|300',
        dropListDatas: gridAction.commonDatas.CustomerDatas,
        onFilter: (filterValue: string, dropListDatas: TableRowDataType[]) => {
            return dropListDatas.filter((item: TableRowDataType) => {
                return item.shortname.indexOf(filterValue) != -1 || item.name.indexOf(filterValue) != -1
            })
        }
    }
})

const OrderNoteState = ref<InputOptionsType>({
    config: {
        caption: '单据备注', 
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'text',
    }
})

const moneyForm = (val: string) => {
    return $Utils.numberFormat($Utils.clearDecimal(val), '0.00')
}

const convertMoney = (val: string) => {
    return $Utils.convertMoneyToChinese(val)
}

const handleApplay = async (e: Event) => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/sales/reports/InvoiceReport/', 'buildReport', {
        StartAt: startDeliveryAt.value,
        EndAt: endDeliveryAt.value,
        CustomerCode: customerCode.value,
        OrderNote: OrderNote.value,
        IsExtend: checkListEx.value ? 1 : 0
    })
    if (res.errCode == 0) {
        gridAction.open()
    }
    MessageBox.closeAllLoading()
}

const handleExport = (e: Event) => {
    ExportTableToExcel(printDom.value as HTMLElement)
}



const handleToDelete = async (e: MouseEvent, data: any[], index: number, ProwItem: any, prowIndex: number) => {
    if (!checkListEx.value) return
    const res = await MessageBox.question({
        title: '确认',
        content: '是否要删除或换货当前行?',
        showAbort: true,
        showCancel: true,
        abortText: '换货',
        confirmText: '删除',
    })
    if (res.action === ModalResultEnum.mrConfirm) {
        MessageBox.loading({
            moreText: '正删除...',
            mask: true
        })
        const submitRes = await $api.comonRequest('/masterApi/disApi/sales/saleChange/Lists/', 'BatchDelete', {
            CustomerCode: customerCode.value,
            StartAt: startDeliveryAt.value,
            EndAt: endDeliveryAt.value,
            ProductCode: data[index].productcode
        })
        setTimeout(() => { MessageBox.closeAllLoading() }, 50)
        if (submitRes) {
            data.splice(index, 1)
            if (data.length === 0) {
                gridAction.dataSource.dataSet.splice(prowIndex, 1)
            }
        }
    }
    if (res.action === ModalResultEnum.mrAbort) {
        const SelectRes = await WinProductSelect.show({
            title: '换货产品选择',
            defaultDatas:[],
            customerCode: customerCode.value,
            billType: 3,
        })
        if (SelectRes.action !== ModalResultEnum.mrConfirm) return
        const result = await WinModal.open({
            title: '输入数量单价',
            width:  400,
            height: 230,
            position: 'center',
            content: WinChangeProductComponent,
            qty:+data[index].numex,
            price:+data[index].saleprice
        })
        if (result.action !== ModalResultEnum.mrConfirm) return
        change(data[index].productcode,SelectRes.data.idcode,result.data.inputNum,result.data.inputPrice)
    }
}

const change = async (curProductCode: string,newProductCode: string,qty: number,price: number)=>{
    const submitRes = await $api.comonRequest('/masterApi/disApi/sales/saleChange/Lists/','BatchChange',{
            CustomerCode : customerCode.value,
            StartAt: startDeliveryAt.value,
            EndAt: endDeliveryAt.value,
            curProductCode: curProductCode,
            newProductCode: newProductCode,
            qty: qty,
            price: price
        })   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        if (submitRes){
            handleApplay(null as unknown as Event)
        }
}
const format = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string) => {
    if (cellItem.customFormater) {
        if (typeof cellItem.customFormater == 'function') {
            return cellItem.customFormater(rowItem[fieldName], rowItem)
        }
    } else {
        return rowItem[fieldName]
    }
}

const calcSubMoney = (datas: any): number => {
    if (datas) {
        return $Utils.toFixedFun($Utils.sumArray(datas, 'salemoney').toString(), 2)
    }
    return 0
}

const calcSubNum = (datas: any): number => {
    if (datas) {
        return $Utils.toFixedFun($Utils.sumArray(datas, 'numex'), 2)
    }
    return 0
}

const calcTotalMoney = (datas: any) => {
    let totalMoeny = 0
    if (datas) {
        datas.forEach((item: any) => {
            totalMoeny += Number(calcSubMoney(item.children))
        })
    }
    return $Utils.toFixedFun(totalMoeny, 2)
}

const calcTotalNum = (datas: any) => {
    let totalMoeny = 0
    if (datas) {
        datas.forEach((item: any) => {
            totalMoeny += Number(calcSubNum(item.children))
        })
    }
    return $Utils.toFixedFun(totalMoeny, 2)
}

const handleRowClick = (pindex: number, rowIndex: number) => {
    billIndex.value = pindex
    billdetailindex.value = rowIndex
}

const handleKeyDown = (e: KeyboardEvent) => {
    if (e.key == 'Escape') {
        Win.closeWin()
    }
}

nextTick(() => {
    (WinBox.value as HTMLDivElement).focus()
    Win.printDom = printDom.value
})

watch(
    () => checkListEx.value,
    (n, ol) => handleApplay(null as unknown as Event)
)
</script>

<style lang="scss" scoped>
@media print {
    .win-body {
        display: block !important;
    } 
}
.win {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
}
.win-hearder {
    height: 40px;
    border-bottom: 1px solid red ;
    display: flex;
    align-items: center;
    .Input-At-Start {
        width: 260px;
    }
    .Input-At-End {
        width: 170px;
    }
    .shipper-input {
        width: 400px;
    }
    .note-input {
        width: 200px;
    }
    button {
        margin-left: 10px ;
        width: 100px;
        height: 30px;
    }
}
.win-body {
    position: absolute;
    top: 43px;
    left: 10px;
    right: 0;
    bottom: 0;
    overflow: auto;
}
table {
    word-break: break-all;
    font-size: 14px;
    font-family: '宋体';
    border-collapse: collapse;  
    th, td {
        padding: 5px;
    }
}
.nobarder {
    border: 0;
}
.center {
    text-align: center;
}
td, th {
    border: 1px solid black;
}
.active {
    background: rgb(0, 174, 255);
    color: white;
}
</style>
