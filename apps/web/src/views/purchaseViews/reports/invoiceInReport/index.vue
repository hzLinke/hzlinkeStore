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
                :config="shipperState.config"
                :dropConfig="shipperState.dropConfig"
                v-model="shipperCode"
            />
            <span v-if="!checkList">共{{gridAction.dataSource.dataSet.length}}单</span>
            <button @click="handleApplay">应用</button>
            <button @click="handleExport">导出</button>
        </div> 
        <div class="win-body" media="print">
            <table  ref="printDom"  >
                <tbody>
                    <table cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                           <tr>
                                <td :colspan="1" class="nobarder" style="padding-left:20px"></td>
                                <td :colspan="3" class="nobarder">供货商：{{shipperName}}</td>
                                <td :colspan="4" class="nobarder">日期：{{startDeliveryAt}}到{{endDeliveryAt}}</td>
                            </tr>
                            <tr >  
                                <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </td>
                            </tr>
                        </thead>
                        <tbody v-for="(ProwItem,rowIndex) in gridAction.dataSource.dataSet" :key="rowIndex" :class="{active:rowIndex==billdetailindex}">
                            <tr class="lkx-table-body-row">
                                <td :colspan="8">{{ ProwItem.catename }}</td>

                            </tr>
                            <tr  v-for="(rowItem,rowIndex) in ProwItem.children" :key="rowIndex" >
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                                    :style="{textAlign:cellItem.align}"
                                >
                                    <div v-if="cellItem.fieldName=='sep'">{{+rowIndex+1}}</div>
                                    <div v-else>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                            <tr>
                                <td :colspan="4" style="text-align: center;">{{ProwItem.catename+'小计'}}</td>
                                <td style="text-align: right;">{{ calcSubNum(ProwItem.children) }}</td>
                                <td ></td>
                                <td style="text-align: right;">{{ calcSubMoney(ProwItem.children) }}</td>
                                <td ></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td :colspan="4" style="text-align: center;">总计</td>
                                <td style="text-align: right;">{{ calcTotalNum(gridAction.dataSource.dataSet) }}</td>
                                <td ></td>
                                <td style="text-align: right;">{{ calcTotalMoney(gridAction.dataSource.dataSet) }}</td>
                                <td ></td>
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
import $Utils from '@v4x/utils/lkxUtil'
import { LkxInput, MessageBox, type ModalResultValue, type CommondDatasParamType, InputOptionsType, TableRowDataType, TableColumnsType } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import $api from '@/request/api'
import { ExportTableToExcel } from '@v4x/utils'
import {useAppStore} from '@/stores'
const appStore = useAppStore()
const userCode = appStore.loginDatas.idcode

defineOptions({
    name: 'reports/invoiceInReport'
})

const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)

const billIndex = ref(-1)
const billdetailindex = ref(-1)
const Win = reactive(new TWinForm({}))
const checkList = ref(true)
const shipperName = ref('')
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/reports/InvoiceReport/',
        KeyFieldName: 'ProductCode',
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
        captionWidth: 60,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
            shipperName.value = data.name
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

const handleApplay = async (e: Event) => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/Purchase/reports/InvoiceReport/', 'buildReport', {
        StartAt: startDeliveryAt.value,
        EndAt: endDeliveryAt.value,
        ShipperCode: shipperCode.value,
        IsExtend: 0
    })  
    if (res.errCode == 0) {
        gridAction.open()
    }
    MessageBox.closeAllLoading()
}

const handleExport = (e: Event) => {
    ExportTableToExcel(printDom.value as HTMLElement)
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
        return +$Utils.toFixedFun($Utils.sumArray(datas, 'costmoney'), 2)
    }
    return 0
}

const calcSubNum = (datas: any): number => {
    if (datas) {
        return +$Utils.toFixedFun($Utils.sumArray(datas, 'numex'), 2)
    }
    return 0
}

const calcTotalMoney = (datas: any) => {

    let totalMoeny = 0
    if (datas) {
        datas.forEach((item: any) => {
            totalMoeny += calcSubMoney(item.children)
        })
    }

    return $Utils.toFixedFun(totalMoeny, 2)
}

const calcTotalNum = (datas: any) => {
    let totalMoeny = 0
    if (datas) {
        datas.forEach((item: any) => {
            totalMoeny += calcSubNum(item.children)
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


onMounted(() => {
 
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
