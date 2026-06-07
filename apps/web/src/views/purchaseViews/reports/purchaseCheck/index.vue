<template>
    <div class="win" ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
        <div class="win-hearder">
            <lkx-input class="Input-At-Start"
                name="startat"
                :config="startDeliveryState.config"
                v-model="startDeliveryAt"
            />
            <lkx-input class="Input-At-End"
                name="endat"
                :config="endDeliveryState.config"
                v-model="endDeliveryAt"
            />
            <lkx-input class="shipper-input"
                name="ElShipper"
                :config="shipperState.config"
                :dropConfig="shipperState.dropConfig"
                v-model="shipperCode"
            />
            <span >共{{gridAction.dataSource.dataSet.length}}单</span >
            <button @click="handleApplay">应用</button>
            <button @click="handleExport">导出</button>
        </div> 
        <div  class="win-body" media="print">
            <table  ref="printDom"  >
                <tbody>
                    <table v-for="(Pitem,Pindex) in gridAction.dataSource.dataSet" :key="Pindex"  cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <td :colspan="3" class="nobarder" style="height:0"></td>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td :colspan="3" class="nobarder" style="padding-left:20px">货商：{{Pitem.shippername}}</td>
                                <td :colspan="3" class="nobarder">联系：{{Pitem.person}}/{{Pitem.tel}}</td>
                                <td :colspan="3" class="nobarder">单号：{{Pitem.billnumber}}</td>
                            </tr>
                            <tr>
                                <td :colspan="3" class="nobarder" style="padding-left:20px">备注：{{Pitem.note}}</td>
                                <td :colspan="3" class="nobarder">日期：{{Pitem.deliveryat}}</td>
                                <td :colspan="3" class="nobarder" >金额：{{moneyForm(Pitem.costmoney)}}</td>
                            </tr>
                            <tr >  
                                <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </td>
                            </tr>
                        </tbody>
                        <tbody >
                            <tr class="lkx-table-body-row" v-for="(rowItem,rowIndex) in Pitem.detail" :key="rowIndex" :class="{active:Pindex==billIndex&&rowIndex==billdetailindex}" @click="handleRowClick(Pindex,+rowIndex)">
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :key="cellIndex"  
                                    :name="cellItem.fieldName" 
                                    :style="{'textAlign':cellItem.align}"
                                >
                                    <div v-if="cellItem.fieldName=='sep'">{{+rowIndex+1}}</div>
                                    <div v-else>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td :colspan="3" style="text-align:center">合计</td>
                                <td :colspan="4" style="text-align:right">{{convertMoney(Pitem.costmoney)}}</td>
                                <td  style="text-align:right">{{moneyForm(Pitem.costmoney)}}</td>
                                <td  style="text-align:right"></td>
                            </tr>
                             <tr style="height: 20px"></tr>
                        </tbody>
                        <tfoot>
                            <tr style="height:5px"></tr>
                        </tfoot>
                </table>
                </tbody>
            </table>
       </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, watch, nextTick } from 'vue'

import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput, TableColumnsType, TableRowDataType } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import { ExportTableToExcel } from '@v4x/utils'
import {useAppStore} from '@/stores'
const appStore = useAppStore()
const userCode = appStore.loginDatas.idcode

defineOptions({
    name: 'reports/purchaseCheck'
})

const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)

const billIndex = ref(-1)
const billdetailindex = ref(-1)
const Win = reactive(new TWinForm({}))
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/purchase/reports/purchaseCheck/',
        KeyFieldName: 'DeliveryAt',
        NotAllowOperationList: [],
        getParmars: {}
    })
)
const gridAction = reactive(new TListGridAction(dataSource, {detailDataSource: null}))
const startDeliveryAt = ref($Utils.getMonthFirst())
const endDeliveryAt = ref($Utils.getMonthLast())
const shipperCode = ref(0)
const startDeliveryState = ref<InputOptionsType>({
    config: {
        caption: '送货日期 从', 
        captionWidth: 120,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
        }
    }
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
    }
})

const shipperState = ref<InputOptionsType>({
    config: {
        caption: '供货商', 
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|shortname|name',
        displayFieldWidths: '50|80|300',
        dropListDatas: gridAction.commonDatas.ShipperDatas,
        onFilter: (filterValue: string) => {
            const arr = gridAction.commonDatas.ShipperDatas.filter((item: any) => {
                return item.shortname.indexOf(filterValue) != -1 || item.name.indexOf(filterValue) != -1
            })
            return arr
        }
    }
})

const moneyForm = (val: string) => {
    return $Utils.numberFormat($Utils.clearDecimal(val), '0.00')
}

const convertMoney = (val: string) => {
    return $Utils.convertMoneyToChinese(val)
}

const handleApplay = (e: Event) => {
    dataSource.getParams.defaultCondition = ''
    dataSource.getParams.condition = `deliveryAt between '${startDeliveryAt.value}' and '${endDeliveryAt.value}' and shipperCode=${shipperCode.value}`
    gridAction.open()
}

const handleExport = (e: Event) => {
    ExportTableToExcel(printDom.value as HTMLElement)
}

const handleTest = (e: Event) => {
    window.print()
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
    .Input-DeliveryAt {
        margin-left: 10px ;
        outline-color: blue;
    }
    .Input-At-Start {
        margin-left: 10px ;
        width: 300px;
    }
    .Input-At-End {
        width: 200px;
    }
    .shipper-input {
        width: 250px;
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
    td, th {
        padding: 5px;
        border: 1px solid black;
    }
}
.nobarder {
    border: 0;
}
.center {
    text-align: center;
}

.active {
    background: rgb(0, 174, 255);
    color: white;
}
</style>
