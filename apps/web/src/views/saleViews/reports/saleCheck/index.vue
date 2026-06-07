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
                name="customerCode"
                :config="customerState.config"
                :dropConfig="customerState.dropConfig"
                v-model="customerCode"
            />
            <lkx-input class="note-input"
                :config="OrderNoteState.config"
                v-model="OrderNote"
            />
            <!--<label style="width: 100px;"><input name="ElCheckList" type="checkbox" v-model="checkList"/>明细表</label>-->
            <span v-if="!checkList">共{{gridAction.dataSource.dataSet.length}}单</span>
            <label style="width: 100px;" v-if="checkList"><input name="ElCheckList" type="checkbox" v-model="checkListEx"/>外帐</label>
            <button @click="handleApplay">应用</button>
            <button @click="handleExport">导出</button>
        </div> 
        <div class="win-body" media="print">
            <table ref="printDom">
                <tbody v-if="!checkList">
                    <table v-for="(Pitem,Pindex) in gridAction.dataSource.dataSet" :key="Pindex" cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <td :colspan="3" class="nobarder" style="padding-left:20px">客户：{{Pitem.customername}}</td>
                                <td :colspan="3" class="nobarder">联系：{{Pitem.person}}/{{Pitem.tel}}</td>
                                <td :colspan="3" class="nobarder">单号：{{Pitem.billnumber}}</td>
                            </tr>
                            <tr>
                                <td :colspan="3" class="nobarder" style="padding-left:20px">备注：{{Pitem.note}}</td>
                                <td :colspan="3" class="nobarder">日期：{{Pitem.deliveryat}}</td>
                                <td :colspan="2" class="nobarder" >金额：{{moneyForm(Pitem.salemoney)}}</td>
                            </tr>
                            <tr >  
                                <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </td>
                            </tr>
                        </thead>
                        <tbody >
                            <tr class="lkx-table-body-row" v-for="(rowItem,rowIndex) in Pitem.detail" :key="rowIndex" :class="{active:Pindex==billIndex&&rowIndex==billdetailindex}" @click="handleRowClick(Pindex,+rowIndex)">
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" 
                                    :key="cellIndex"  
                                    :style="{'textAlign':cellItem.align}">
                                    <div v-if="cellItem.fieldName=='sep'">{{+rowIndex+1}}</div>
                                    <div v-else>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td :colspan="3" style="text-align:center">合计</td>
                                <td :colspan="4" style="text-align:right">{{convertMoney(Pitem.salemoney)}}</td>
                                <td :colspan="1"  style="text-align:right">{{moneyForm(Pitem.salemoney)}}</td>
                                <td :colspan="1"  style="text-align:right"></td>
                            </tr>
                             <tr style="height: 20px"></tr>
                        </tfoot>
                    </table>
                </tbody>
                <tbody v-if="checkList">
                    <table cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                           <tr>
                                <td :colspan="1" class="nobarder" style="padding-left:20px"></td>
                                <td :colspan="5" class="nobarder" style="padding-left:20px">客户：{{customerName}}{{  OrderNote?`--${OrderNote}`:'' }}</td>
                                <td :colspan="3" class="nobarder">日期：{{startDeliveryAt}}到{{endDeliveryAt}}</td>
                            </tr>
                            <tr >  
                                <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </td>
                            </tr>
                        </thead>
                        <tbody v-for="(ProwItem,arrRowIndex) in gridAction.dataSource.dataSet" :key="arrRowIndex" >
                            <tr class="lkx-table-body-row" :class="{'replaceNum-row':rowItem.replacenumex!=0}" v-for="(rowItem,rowIndex) in ProwItem.children" :key="rowIndex" @click="handleRowClick(+rowIndex,+rowIndex)">
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                                    :style="{'textAlign':cellItem.align}">
                                    <div v-if="cellItem.fieldName=='sep'">{{+rowIndex+1}}</div>
                                    <div v-else>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                            <tr>
                                <td :colspan="6" style="text-align: center;">(第{{arrRowIndex+1}}张)小计</td>
                                <td style="text-align: right;">{{ calcSubNum(ProwItem.children) }}</td>
                                <td ></td>
                                <td style="text-align: right;"></td>
                                <td style="text-align: right;">{{ calcSubMoney(ProwItem.children) }}</td>
                             </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td :colspan="6" style="text-align: center;">({{gridAction.dataSource.dataSet.length}}张)总计</td>
                                <td style="text-align: right;">{{ calcTotalNum(gridAction.dataSource.dataSet) }}</td>
                                <td ></td>
                                <td style="text-align: right;"></td>
                                <td style="text-align: right;">{{ calcTotalMoney(gridAction.dataSource.dataSet) }}</td>
                            </tr>
                        </tfoot>
                    </table>
                </tbody>
            </table>
        </div>
        <div class="ExportDiv">
            <table ref="ExportDom">
                <tbody>
                    <table cellspacing="0" cellpadding="0">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                           <tr>
                                <td :colspan="1" class="nobarder" style="padding-left:20px"></td>
                                <td :colspan="5" class="nobarder" style="padding-left:20px">客户：{{customerName}}</td>
                                <td :colspan="3" class="nobarder">日期：{{startDeliveryAt}}到{{endDeliveryAt}}</td>
                            </tr>
                            <tr >  
                                <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </td>
                            </tr>
                        </thead>
                        <tbody v-for="(ProwItem,arrRowIndex) in gridAction.dataSource.dataSet" :key="arrRowIndex" >
                            <tr class="lkx-table-body-row" v-for="(rowItem,rowIndex) in ProwItem.children" :key="rowIndex" @click="handleRowClick(+rowIndex,+arrRowIndex)">
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                                    :style="{'textAlign':cellItem.align}">
                                    <div v-if="cellItem.fieldName=='sep'">{{+rowIndex+1}}</div>
                                    <div v-else>{{formatExport(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase(),+rowIndex,arrRowIndex)}}</div>
                                </td>
                            </tr>
                            <tr>
                                <td :colspan="6" style="text-align: center;">(第{{arrRowIndex+1}}张)小计</td>
                                <td style="text-align: right;">{{ subFormula('G',arrRowIndex,ProwItem.children) }}</td>
                                <td ></td>
                                <td style="text-align: right;"></td>
                                <td >{{subFormula('I',arrRowIndex,ProwItem.children)}}</td>
                             </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td :colspan="6"  style="text-align: center;">({{gridAction.dataSource.dataSet.length}}张)总计</td>
                                <td style="text-align: right;">{{ exportTotalNum}}</td>
                                <td ></td>
                                <td style="text-align: right;"></td>
                                <td style="text-align: right;">{{ exportTotalMoney}}</td>
                            </tr>
                        </tfoot>
                    </table>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, watch, nextTick, computed } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import { TableColumnsType, TableRowDataType } from '@v4x/ui'
import { ExportTableToExcel } from '@v4x/utils'

defineOptions({
    name: 'reports/saleCheck'
})

const printDom = ref<null | HTMLElement>(null)
const ExportDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)

const billIndex = ref(-1)
const billdetailindex = ref(-1)
const subRowIndexList = ref<any[]>([])
const Win = reactive(new TWinForm({}))
const checkList = ref(true)
const checkListEx = ref(false)
const customerName = ref('')
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/reports/saleCheckList/',
        KeyFieldName: 'DeliveryAt',
        NotAllowOperationList: [],
        getParmars: {}
    })
)
const gridAction = reactive(new TListGridAction(dataSource, {}))

const startDeliveryAt = ref($Utils.getMonthFirst())
const endDeliveryAt = ref($Utils.getMonthLast())
const OrderNote = ref('')
const customerCode = ref(0)

const startDeliveryState = ref<InputOptionsType>({
    config: {
        caption: '送货日期 从', 
        captionWidth: 90,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
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
        onFilter: (filterValue: string, dropListDatas: any[]) => {
            return dropListDatas.filter((item: any) => {
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
        onChange: (data: any) => {
        }
    }
})

const exportTotalNum = computed(() => {
    if (subRowIndexList.value.length == 0) return ''
    const _arr = subRowIndexList.value.map((item: any) => {
        return 'G' + item
    })
    let _formula = '=' + _arr.join('+')
    return _formula
})

const exportTotalMoney = computed(() => {
    if (subRowIndexList.value.length == 0) return ''
    const _arr = subRowIndexList.value.map((item: any) => {
        return 'J' + item
    })
    let _formula = '=' + _arr.join('+')
    return _formula
})

watch(
    () => checkList.value,
    (o, n) => {
        dataSource.close()
    }
)

watch(
    () => checkListEx.value,
    (n, o) => {
        dataSource.close()
        dataSource.getParams.extraData = n ? 'Ex' : ''
        handleApplay(null as unknown as Event)
    }
)

const moneyForm = (val: string) => {
    return $Utils.numberFormat($Utils.clearDecimal(val), '0.00')
}

const convertMoney = (val: string) => {
    return $Utils.convertMoneyToChinese(val)
}

const handleApplay = (e: Event) => {
    subRowIndexList.value = []
    gridAction.isDetail = checkList.value
    if (checkList.value) {
        dataSource.apiPath = '/masterApi/disApi/sales/reports/saleCheckList/'
        gridAction.Columns = gridAction.ListColumns
    } else {
        dataSource.apiPath = '/masterApi/disApi/sales/reports/saleCheck/'
        gridAction.Columns = gridAction.OrderColumns
    }
    dataSource.getParams.defaultCondition = ''
    dataSource.getParams.condition = `deliveryAt between '${startDeliveryAt.value}' and '${endDeliveryAt.value}' and customerCode=${customerCode.value}`
    if (OrderNote.value) {
        dataSource.getParams.condition = dataSource.getParams.condition + ` and mainNote like '%${OrderNote.value}%'`
    }
    gridAction.open()
}

const handleExport = (e: Event) => {
    ExportTableToExcel(ExportDom.value as HTMLElement)
}

const format = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string) => {
    if (cellItem.customFormater) {
        if (typeof cellItem.customFormater == 'function') {
            return cellItem.customFormater(rowItem[fieldName], rowItem)
        }
    }
    if (cellItem.format) {
        return $Utils.numberFormat($Utils.clearDecimal(rowItem[fieldName]), cellItem.format)
    } else {
        return rowItem[fieldName]
    }
}

const formatExport = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string,
    rowIndex: number, arrRowIndex: number) => {
    if (cellItem.excelFormula) {
        let PrvCount = 3
        const SubCount = arrRowIndex
        for (let i = arrRowIndex - 1; i >= 0; i--) {
            PrvCount = PrvCount + gridAction.dataSource.dataSet[i].children.length
        }
        PrvCount = PrvCount + SubCount
        let starRowIndex = PrvCount
        return `=ROUND(G${starRowIndex + rowIndex}*H${starRowIndex + rowIndex},2)`
    }
    if (cellItem.customFormater) {
        if (typeof cellItem.customFormater == 'function') {
            return cellItem.customFormater(rowItem[fieldName], rowItem)
        }
    }
    return rowItem[fieldName]
}

const calcSubMoney = (datas: any): number => {
    if (datas) {
        return $Utils.toFixedFun($Utils.sumArray(datas, 'settlementmoney').toString(), 2)
    }
    return 0
}

const calcSubNum = (datas: any): number => {
    if (datas) {
        return $Utils.toFixedFun($Utils.sumArray(datas, 'settlementnumex'), 2)
    }
    return 0
}

const subFormula = (col: string, rowIndex: number, thisDatas: any): string => {
    if (!thisDatas) return ''
    let PrvCount = 3
    const SubCount = rowIndex
    for (let i = rowIndex - 1; i >= 0; i--) {
        PrvCount = PrvCount + gridAction.dataSource.dataSet[i].children.length
    }
    PrvCount = PrvCount + SubCount
    let starRowIndex = PrvCount, endRowIndex = PrvCount
    endRowIndex = PrvCount + thisDatas.length - 1
    if (subRowIndexList.value.indexOf(endRowIndex + 1) == -1)
        subRowIndexList.value.push(endRowIndex + 1)
    return `=Round(Sum(${col}${starRowIndex}:${col}${endRowIndex}),2)`                
}

const calcTotalMoney = (datas: any) => {
    let totalMoeny = 0
    if (datas) {
        datas.forEach((item: any, index: number) => {
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
        width: 230px;
    }
    .Input-At-End {
        width: 150px;
    }
    .shipper-input {
        width: 350px;
    }
     .note-input {
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
.ExportDiv {
    height: 0;
    overflow: hidden;
}
.replaceNum-row {
    color: red;
}
</style>
