<template>
   <div class="win"  ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
       <div class="win-hearder">
            <lkx-input class="Input-DeliveryAt"
                name="ElInputDeliveryAt"
                :config="deliveryAtState.config"
                v-model="deliveryAt"
            />
            <label><input name="ElCheckBox" type="checkbox"  v-model="showFinish"/>只显示未发布</label>
            <lkx-input class="shipper-input"
                name="ElShipperInput"
                :config="shipperState.config"
                :dropConfig="shipperState.dropConfig"
                v-model="shipperCode"
            />
            <lkx-input class="shipper-input"
                name="ElCateInput"
                :config="cateState.config"
                :dropConfig="cateState.dropConfig"
                v-model="cateCode"
            />
            <button @click="handleApplay">应用</button>
        </div> 
       <div  class="win-body">
            <div class="win-body-left">

                <table id="printDom"  :border="0" cellspacing="0" cellpadding="0" :style="{fontSize: fontSize}">
                    <colgroup>
                        <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th :colspan="12">{{deliveryAt}}供货商订货汇总</th>
                        </tr>
                        <tr>  
                            <th v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                {{item.title}}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <template v-for="(item,index) in dataSource.dataSet" :key="index">
                            <tr  v-if="item.shippername&&showAll(item)">
                                <td :colspan="9">{{item.shippername}} 开单日期：{{deliveryAt}}</td>
                                <td :colspan="3" v-if="item.shippername != '备用存货'">
                                    <span  class="sendButOk" @click="handleSendClick($event,item)">发布订单</span>
                                    <span class="sendButCancel" @click="handleUnSendClick($event,item)">取消发布</span>
                                    <span class="sendStatus" :style="{color: item.ispublish?'':'red'}">状态:{{item.ispublish||getOrderStatus(item.shippername,item.billnumberlist,item)==1?'已发布':'待发布'}}</span>
                                </td>
                                
                            </tr>
                            <tr v-if="!item.shippername&&showAll(item)" >
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                                    :style="{textAlign: cellItem.align}"
                                    :data-tooltip="cellItem.tooltip"
                                >
                                    <div v-if="cellItem.fieldName=='sep'">
                                        <span >{{index+1}} </span>
                                    </div>
                                    <div @dblclick="handleDbClick(item,cellItem,$event)">{{format(item,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                        </template>
                    </tbody>
                    <tfoot style="display:table-footer-group">
                        <tr ></tr>
                    </tfoot>
                </table>
                                
            </div>
            <div class="win-body-right">
                <div class="all-button"><button @click="listSelectedIndex=-1;shipperCode = 0;openData()">全部</button></div>
                <div class="item-body">
                    <div class="item" :class="{'avtive_shipper':listSelectedIndex==index}" v-for="(item,index) in rightDataList" :key="index" @click="handleListClick(item,+index)">{{ item.name }}</div>
                </div>
            </div>
            <div class="printDiv"  ref="printDom">
                <template v-if="startPrint">
                    <table  v-for="(PageItem,PageIndex) in PrintDatas" :key="PageIndex" :border="0" cellspacing="0" cellpadding="0" :style="{fontSize: fontSize}">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th :colspan=12>{{deliveryAt}}供货商订货汇总</th>
                            </tr>
                            <tr>  
                                <th v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </th>
                            </tr>
                        </thead>
                        <tbody >
                            <template v-for="(item,index) in PageItem" :key="index">
                                <tr v-if="item.shippername"><td :colspan=12>{{item.shippername}}{{deliveryAt}}</td></tr>
                                <tr v-if="!item.shippername" >
                                    <td v-for="(cellItem,cellIndex) in gridAction.Columns" 
                                        :name="cellItem.fieldName" :key="cellIndex"  
                                        :style="{textAlign:cellItem.align}"
                                       
                                    >
                                        <div>{{format(item,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                    </td>
                                </tr>
                            </template>
                        </tbody>
                        <tfoot style="display:table-footer-group " >
                            <tr class="footerStyle">
                                <td :colspan="12" class="nobarder footerStyle">{{ `第${+PageIndex+1}页/共${PrintDatas.length}页`  }}</td></tr>
                        </tfoot> 
                    </table>
                </template>
            </div>
       </div>
    </div>
 </template>
<script setup lang="ts">
import { reactive, ref, onMounted, nextTick, markRaw } from 'vue'
import { InputOptionsType, TableColumnsType, TableRowDataType } from '@v4x/ui';
import $Utils from '@v4x/utils/lkxUtil'
import { LkxInput,WinModal,ModalResultEnum } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import type { DownOrderGroupInstanceRefs } from './types'

import { WinPackDetail,WinTransferShipper } from '@/components';

import {useAppStore} from '@/stores'

defineOptions({
    name: 'downOrderGroup'
})

const appStore = useAppStore()

const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)
const userCode = appStore.loginDatas.idcode;
const deliveryAt = ref($Utils.getDate('d', 0))
const shipperCode = ref(0)
const shipperName = ref('')
const isPublish = ref(false)
const qrCodeData = ref('')
const cateCode = ref(0)
const showFinish = ref(false)
const targetShipperCode = ref(0)
const targetPrice = ref(0)
const targetNum = ref(0)
const targetBillNumberList = ref('')
const targetProductCode = ref('')
const PrintDatas = ref([] as any)
const startPrint = ref(false)
const pagerHeight = ref(210)
const headerDatas = ref<Record<string, any>>({})
const listSelectedIndex = ref(-1)
const rightDataList = ref()

const instanceRefs = markRaw<DownOrderGroupInstanceRefs>({
    startPrint: startPrint,
    userCode,
    detailDataSource: null,
})



const Win = reactive(new TWinForm(instanceRefs))
const cateDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/basic/Cate/',
            KeyFieldName: 'idCode',
            NotAllowOperationList: [],
            getParmars: { pageSize: 0, curPage: 1, total: 1, sortFields: 'serialNum' }
        }
    )
)
const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/downOrderGroup/',
            KeyFieldName: 'ProductCode',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)
const gridAction = reactive(new TListGridAction(dataSource, instanceRefs))

const thisH = $Utils.getDatePart('h')
if (gridAction.commonDatas.SysParamDatas[0].exceedtimetoday < thisH) {
    deliveryAt.value = $Utils.getDate('d', 1)
}
dataSource.getParams.condition = `deliveryAt='${deliveryAt.value}' and status<3`
gridAction.getParams = {
    procName: 'sp_build_DownGroup',
    procParmars: {
        DeliveryAt: deliveryAt.value,
        ShipperCode: shipperCode.value,
        CateCode: cateCode.value
    }
}
const fontSize = ref(gridAction.PrintFontSize + 'px')
gridAction.PowerList.allowedDelete = true

const format = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string) => {
    if (cellItem.customFormater) {
        if (typeof cellItem.customFormater == 'function') {
            return cellItem.customFormater(rowItem[fieldName], rowItem)
        }
    } else {
        return rowItem[fieldName]
    }
}

const openData = () => {
    if (shipperCode.value != 0)
        dataSource.getParams.condition = `deliveryAt='${deliveryAt.value}' and shipperCode=${shipperCode.value}`
    else
        dataSource.getParams.condition = `deliveryAt='${deliveryAt.value}'`
    dataSource.getParams.extraData = ''
    gridAction.getParams = {
        procName: 'sp_build_DownGroup',
        procParmars: {
            DeliveryAt: deliveryAt.value,
            ShipperCode: shipperCode.value,
            CateCode: cateCode.value
        }
    }
    gridAction.open().then((res) => {
        if (shipperCode.value == 0 && cateCode.value == 0)
           rightDataList.value = gridAction.getRigthDatas(gridAction.AllDatas,false)
    })
}

const getOrderStatus = (shipperName: string, billNumberList: string, Item: any) => {
    const arr = gridAction.AllDatas.filter((item: any) => {
        return item.shippername == shipperName && item.billnumberlist == billNumberList && item.examineusercode == 0
    })
    if (arr.length == 0) {
        Item.ispublish = 1
        Item.children.map((item: any) => item.ispublish = 1)
    } else {
        Item.ispublish = 0
        Item.children.map((item: any) => item.ispublish = 0)
    }
    return arr.length == 0 ? 1 : 0
}

const showAll = (item: any) => {
    if (!showFinish.value) return true
    return item.ispublish == 0 || !item.ispublish
}

const handleApplay = (e: Event) => {
    openData()
}

const handleListClick = (item: any, rowIndex: number) => {
    shipperCode.value = item.idcode
    listSelectedIndex.value = rowIndex
    openData()
}

const handleKeyDown = (e: KeyboardEvent) => {
    if (e.key == 'Escape') {
        Win.closeWin()
    }
}

const handleDbClick = async (rowItem: any, cellItem: any, Event: MouseEvent) => {
    console.log(rowItem)
    const _xh = cellItem.fieldName.match(/\d+/g)
    console.log(rowItem[`qualitygrade${_xh[0]}`])
    if (cellItem.title === '明细') {
        const res = await WinPackDetail.show({
            title:'商品去向明细',
            width: '80%',
            height: '80%',
            headerDatas:  {
                name: rowItem[`name${_xh[0]}`],
                spec: rowItem[`spec${_xh[0]}`],
                tempstock: rowItem[`tempstock${_xh[0]}`],
                examineusercode: rowItem[`examineusercode${_xh[0]}`],
            },
            deliveryAt: deliveryAt.value,
            billnumber: rowItem[`billnumberlist${_xh[0]}`],
            productCode: rowItem[`productcode${_xh[0]}`],
            saleType: rowItem[`saletype${_xh[0]}`],
            qualityGrade: rowItem[`qualitygrade${_xh[0]}`],
            billType: 'order',
        })
        if (res.action == ModalResultEnum.mrConfirm){
            gridAction.open()
        }
    } else {
        if (+rowItem[`shippercode${_xh[0]}`] === 0) return
        const res = await WinTransferShipper.show({
            defaultShipperCode:+rowItem[`shippercode${_xh[0]}`] ,
            defaultCostPrice:+rowItem[`costprice${_xh[0]}`],
            defaultNum:rowItem[`totalnum${_xh[0]}`],
            allowChangeNum: false,
        })
        if (res.action == ModalResultEnum.mrConfirm){
            console.log(res.data)
            const targetBillNumberList = rowItem[`billnumberlist${_xh[0]}`];
            const targetProductCode = rowItem[`productcode${_xh[0]}`];
            const sourceShipperCode = rowItem[`shippercode${_xh[0]}`]
            const {targetShipperCode  ,transferPrice } = res.data
            gridAction.transferShipper(targetBillNumberList, targetProductCode,sourceShipperCode,targetShipperCode, transferPrice)
        }
    }
}

const beforePrint = async (): Promise<boolean> => {
    let _arr = dataSource.dataSet
    if (showFinish.value) {
        _arr = dataSource.dataSet.filter(item => item.ispublish == 0)
    }
    PrintDatas.value = $Utils.buildPrintDatas(_arr, 'printDom', pagerHeight.value)
    startPrint.value = true
    return new Promise((resolve, reject) => {
        resolve(true)
    })
}

const handleSendClick = (Event: MouseEvent, Item: any) => {
    shipperName.value = Item.shippername

    gridAction.sendOrder(Item.children[0].shippercode1, deliveryAt.value,Item).then(res => {
        if (res) {
            Item.ispublish = 1
            Item.children.map((item: any) => item.ispublish = 1)
        }
    })
}

const handleUnSendClick = (Event: MouseEvent, Item: any) => {
    shipperName.value = Item.shippername
    gridAction.unSendOrder(Item.children[0].shippercode1, deliveryAt.value).then((res: any) => {
        if (res) {
            Item.ispublish = 0
            Item.children.map((item: any) => item.ispublish = 0)
        }
    })
}

const deliveryAtState = ref<InputOptionsType>({
    config: {
        caption: '请选择送货日期', 
        captionWidth: 120,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
            openData()
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
            openData()
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
        onFilter: (filterValue: string,dropListDatas: TableRowDataType[]) => {
            const arr = dropListDatas.filter((item: TableRowDataType) => {
                return item.shortname.indexOf(filterValue) != -1 || item.name.indexOf(filterValue) != -1
            })
            return arr
        }
    }
})

const cateState = ref<InputOptionsType>({
    config: {
        caption: '分类', 
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
            openData()
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        indentation: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '100|200',
        dropListDatas: gridAction.commonDatas.AllCateDatas,
        onFilter: (filterValue: string,dropListDatas: TableRowDataType[]) => {
            const arr = dropListDatas.filter((item: TableRowDataType) => {
                return item.name.indexOf(filterValue) != -1
            })
            return arr
        },
    }
})

onMounted(() => {
    cateDataSource.open({pageSize: 0, curPage: 1, total: 1});
    (WinBox.value as HTMLDivElement).focus()
})

nextTick(() => {
    openData()
    Win.printDom = printDom.value
    Win.beforePrint = beforePrint
})

</script>

<style lang="scss" scoped>
 @use "@/assets/css/printStyle.scss" as *;
@media print {
    .win-body{
        display:block !important;
    } 
}
.CatePanel{
    position: absolute;
    top: 0;
    left: 0;
    right:0;
    bottom: 0;
    width: 150px;
    border: 1px solid red;
}
.win{
    position: absolute;
    top: 0;
    left: 0;
    right:0;
    bottom: 0;
}
.win-hearder{
    height: 40px;
    border-bottom: 1px solid red ;
    display: flex;
    align-items: center;
    .Input-DeliveryAt{
        margin-left: 10px ;
        outline-color: blue;
        width: 300px;
    }
    .shipper-input{
        width: 300px;
    }
    button{
        margin-left: 10px ;
        width: 100px;
    }
    label{
        display: inline-flex;
        align-items: center;
        margin-left: 10px;
        line-height: 1;
    }
    input[type="checkbox"]{
        height: 20px;
        width: 20px;
        vertical-align: middle;
        margin: 0;
    }
}
.win-body{
    position: absolute;
    top: 40px;
    left: 0;
    right:0;
    bottom: 0;
    overflow: auto;
    padding-left: 5px ;
    padding-top: 5px ;
    display: flex;
    flex-direction: row;
}
.win-body-left{
    flex: 1;
    display: flex;
    flex-direction: column;
    overflow: auto;
}
.win-body-right{
        width: 200px;
       
        border-left: 1px solid red;
        display: flex;
        flex-direction: column;
        .all-button{
            text-align: center;
            button{
                width: 100%;
                height: 35px;
            }
        }
        .item-body{
            flex: 1;
            overflow: auto;
            .item{
                padding: 5px 10px;
                font-size: 22px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                &:hover{
                    background-color: rgba(32, 32, 110, 0.377);
                    color: white;
                    cursor: pointer;
                }
            }
        }
       
    }

table{
   // word-break:break-all;
    width: 0;
   // font-size: 14px;
    font-family: '宋体';
    border-collapse:collapse;  
    table-layout:fixed;
    /*tr{
        height: 26px;
    }*/
    td,th{
        padding: 3px;
        border: 1px solid black;
        white-space: pre-line;
    }
}
.nobarder{
    border: 0;
}
.footerStyle{
    text-align: right;
    padding-top: 10px;
    padding-right: 10px;
}   
.err{
    color: red;
}

td[data-tooltip] {
  position: relative;
}
 
td[data-tooltip]:hover:after {
  content: attr(data-tooltip);
  position: absolute;
  top: 100%;
  left: 0;
  visibility: hidden;
  width: 120px;
  background-color: yellowgreen;
  border: 1px solid black;

  border-radius: 6px;
  padding: 5px;
  z-index: 1000;
  opacity: 0;
  transition: opacity 0.3s;
}
 
td[data-tooltip]:hover:after {
  visibility: visible;
  opacity: 1;
}
.sendButOk{
    margin-left: 10px;
    padding: 0 10px;
    color: white;
    border: 1px solid black;
    background-color: blue;
    font-size: 20px;
    cursor: pointer;
    :hover{
        background-color: rgb(85, 89, 94);
    }
}
.sendButCancel{
    margin-left: 10px;
    padding: 0 10px;
    color: white;
    font-size: 20px;
    border: 1px solid black;
    background-color: red;
    cursor: pointer;
    :hover{
        background-color: rgb(85, 89, 94);
    }
}
.sendStatus{
    margin-left: 30px;
}

.avtive_shipper{ 
    background-color: blue;
    color: white;
}


</style>
