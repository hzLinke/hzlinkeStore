<template>
    <div class="win"  ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
       <div class="win-hearder">
            <lkx-input class="Input-DeliveryAt"
                name="deliveryAt"
                :config="deliveryAtState.config"
                v-model="deliveryAt"
            />
            <label class="label"><input name="EldisType1" class="radio-action" v-model="disType" type="radio" value="5" >取货单打印</label>
            <label class="label"><input name="EldisType2" class="radio-action" v-model="disType" type="radio" value="0" >按客户</label>
            <label class="label"><input name="EldisType3" class="radio-action" v-model="disType" type="radio" value="1">按分类</label>
            <label class="label"><input name="EldisType4" class="radio-action" v-model="disType" type="radio" value="2">按货商(采购下单生效)</label>
            <label class="label"><input name="EldisType5" class="radio-action" v-model="disType" type="radio" value="3">存货清点表</label>
            <label class="label"><input name="EldisType6" class="radio-action" v-model="disType" type="radio" value="4">标签打印</label>
            
            <button style="margin-left:180px" class="applay-button" @click="handleApplay">应用</button>
            <button v-if="disType==4"  class="applay-button" @click="handlePrint">打印标签</button>
        </div> 
       <div class="win-body">
            <table id="printDom"  :border="0" cellspacing="0" cellpadding="0" :style="{fontSize: fontSize}">
                <colgroup>
                    <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                </colgroup>
                <thead style="display:table-header-group">
                    <tr class="nobarder placeholder"></tr>
                    <tr>
                        <th :colspan="headerColSpan">{{pirntCaption}}</th>
                    </tr>
                    <tr>  
                        <th v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                            {{item.title}}
                        </th>
                    </tr>
                </thead>
                <tbody >
                    <template v-for="(item,index) in dataSource.dataSet" :key="index">
                        <tr  v-if="disType!=4&&(item.catecode||item.customercode||item.shippercode)"><td :colspan="headerColSpan">{{getTitleInf(item)}}</td></tr>
                        <tr  v-else >
                            <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                                :style="{textAlign: cellItem.align}"
                            >
                                <div v-if="cellItem.fieldName=='sep'">
                                    <span >{{index+1}} </span>
                                </div>
                                <div>{{format(item,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                            </td>
                        </tr>
                    </template>
                </tbody>
                <tfoot style="display:table-footer-group">
                    <tr class="nobarder placeholder"></tr>
                </tfoot>
            </table>
            <div ref="printDom" >
                <template v-if="startPrint">
                    <table v-for="(PageItem,PageIndex) in PrintDatas" :key="PageIndex" :border="0" cellspacing="0" cellpadding="0" :style="{fontSize: fontSize}">
                        <colgroup>
                            <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                        </colgroup>
                        <thead style="display:table-header-group">
                            <tr class="nobarder placeholder"></tr>
                            <tr>
                                <th :colspan="headerColSpan">{{pirntCaption}}</th>
                            </tr>
                            <tr>  
                                <th v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                    {{item.title}}
                                </th>
                            </tr>
                        </thead>
                        <tbody >
                            <template v-for="(item,index) in PageItem" :key="index">
                                <tr v-if="item.catecode||item.customercode||item.shippercode"><td :colspan="headerColSpan">{{getTitleInf(item)}}</td></tr>
                                <tr v-else >
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
                                <td :colspan="headerColSpan" class="nobarder footerStyle">{{ `第${+PageIndex+1}页/共${PrintDatas.length}页`  }}</td>
                            </tr>
                            <tr class="nobarder placeholder"></tr>
                        </tfoot> 
                    </table>
                </template>
            </div>
       </div>
    </div>
</template>
<script setup lang="ts">
import { reactive, ref, watch, nextTick, markRaw } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput, ModalResultEnum, TableColumnsType, TableRowDataType, WinSearch } from '@v4x/ui'
import {TDataSource} from "@/usehook/dataSource"
import {TWinForm} from "@/usehook/win"
import {TListGridAction} from "./action"
import api from '@/request/api'
import commonParam from '@/config'
import {MessageBox} from '@v4x/ui'
import type { InstanceRefsBase } from '@/views/types'

defineOptions({
    name:'disPrint'
})

const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)
const deliveryAt = ref($Utils.getDate('d',0))
const disType = ref(2)
const headerColSpan = ref(8)
const pirntCaption = ref('')
const PrintDatas = ref([] as any)
const startPrint = ref(false)
const pagerHeight = ref(210)

const instanceRefs = markRaw<InstanceRefsBase>({
    startPrint: startPrint,
})

const Win = reactive(new TWinForm(instanceRefs))
const dataSource = reactive(
    new TDataSource({
            ApiPath:'/masterApi/disApi/dis/disPrint/',
            KeyFieldName: 'ProductCode',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)
const gridAction = reactive(new TListGridAction(dataSource,instanceRefs))
const fontSize = ref(gridAction.PrintFontSize+'px')
const deliveryAtState = ref<InputOptionsType>({
    config:{
        caption: '送货日期', 
        captionWidth:90,
        align: 'left',
        captionAlign:'right',
        inputType:'datetime',
        format:'yyyy-MM-dd',
        onChange:(data: any)=>{
        }
    }
}) 

const getTitleInf =(item: any)=>{
    let Code = 0
    if (disType.value == 0||disType.value == 5){
        Code = item.customercode
        const _Name = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','shortname',Code)
        const _SelfCode = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','selfcode',Code)
        const _DeliveryAt = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','deliveryat',Code)
        const _LineName = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas,'idcode','linename',Code)
        return '【'+_SelfCode+'】'+ _Name.toString() + '  送货时间：'+_DeliveryAt.toString()+ '  送货路线：'+_LineName.toString()
    } 
    if (disType.value == 1||disType.value == 3){
        Code = item.catecode
        const _Name = $Utils.getValueFromArray(gridAction.commonDatas.CateDatas,'idcode','name',Code)         
        return '【'+Code+'】'+_Name 
    } 
    if (disType.value == 2) {
        Code = item.shippercode;
        if (Code==0){
            return '【'+Code+'】'+ '存货'
        }
        const _Name = $Utils.getValueFromArray(gridAction.commonDatas.ShipperDatas,'idcode','name',Code)
        return '【'+Code+'】'+ _Name.toString()
    }
}


const thisH = $Utils.getDatePart('h')
if (gridAction.commonDatas.SysParamDatas[0].exceedtimetoday<thisH){
    deliveryAt.value = $Utils.getDate('d',1)
}
pirntCaption.value = deliveryAt.value + '配货表(按货商)'
dataSource.getParams.extraData = 'shipper'
dataSource.getParams.sortFields = 'shippercode,productcode'
dataSource.getParams.condition=`deliveryAt='${deliveryAt.value}'`
gridAction.getParams = {
    procName:'sp_build_DisData_FromShipper',
    procParmars:{
        DeliveryAt: deliveryAt.value,
        Condition: ''
    }
}
gridAction.arrGroupFieldName = 'shippercode'
gridAction.open()

const format=(rowItem: TableRowDataType,cellItem: TableColumnsType, fieldName: string)=>{
    if (cellItem.customFormater){
        if(typeof cellItem.customFormater =='function'){
            return cellItem.customFormater(rowItem[fieldName],rowItem)
        }
    } else {
        return  rowItem[fieldName]
    }
}

const handleApplay = async (e: Event)=>{
    let searchFields: ({ fieldName: string; caption: string; filterType: string; inList: TableRowDataType[] } | { fieldName: string; caption: string; filterType: string; inList?: undefined })[] = []
    if (disType.value == 5){
        pirntCaption.value = deliveryAt.value + '司机取货单'
        searchFields = [
            {fieldName: "customerCode",caption: "客户",filterType: "fsIn",inList:gridAction.commonDatas.CustomerDatas},
            {fieldName: "Name",caption: "品名",filterType: "fsLike"},
            {fieldName: "LineName",caption: "路线",filterType: "fsEqual"}
        ]
    }
    if (disType.value == 0){
        pirntCaption.value = deliveryAt.value + '配货表(按客户)'
        searchFields = [
            {fieldName: "customerCode",caption: "客户",filterType: "fsIn",inList:gridAction.commonDatas.CustomerDatas},
            {fieldName: "Name",caption: "品名",filterType: "fsLike"},
            {fieldName: "LineName",caption: "路线",filterType: "fsEqual"}
        ]
    }
    if (disType.value == 1){
        pirntCaption.value = deliveryAt.value + '配货表(按分类)'
        searchFields = [
            {fieldName: "cateCode",caption: "分类",filterType: "fsIn",inList:gridAction.commonDatas.CateDatas},
            {fieldName: "name",caption: "品名",filterType: "fsLike"}
        ]
    }
    if (disType.value == 2){
        pirntCaption.value = deliveryAt.value + '配货表(按货商)'
        searchFields = [
            {fieldName: "ShipperCode",caption: "货商",filterType: "fsIn",inList:gridAction.commonDatas.ShipperDatas},
            {fieldName: "tName",caption: "品名",filterType: "fsLike"}
        ]
    }
    if (disType.value == 3){
        pirntCaption.value = deliveryAt.value + '库存清点表'
        searchFields = [
            {fieldName: "AreaCode",caption: "仓位",filterType: "fsIn",inList:gridAction.commonDatas.AreaDatas},
            {fieldName: "name",caption: "品名",filterType: "fsLike"}
        ]
    }
    if (disType.value == 4){
        pirntCaption.value = deliveryAt.value + '标签打印'
        searchFields = [
            {fieldName: "ShipperCode",caption: "货商",filterType: "fsIn",inList:gridAction.commonDatas.ShipperDatas},
            {fieldName: "customerCode",caption: "客户",filterType: "fsIn",inList:gridAction.commonDatas.CustomerDatas},
            {fieldName: "Name",caption: "品名",filterType: "fsEqual"},
            {fieldName: "LineName",caption: "路线",filterType: "fsEqual"}
        ]
    }
    const result = await WinSearch.show({
        fields: searchFields
    })
    if (result.action === ModalResultEnum.mrConfirm && result.data) {
        if (disType.value == 0||disType.value == 5){
                gridAction.getParams = {
                    procName:'sp_build_DisData_FromCustomer',
                    procParmars:{
                        DeliveryAt: deliveryAt.value,
                        Condition: result.data.filter
                    }
                }
            }
            if (disType.value == 1){
                gridAction.getParams = {
                    procName:'sp_build_DisData_FromCate',
                    procParmars:{
                        DeliveryAt: deliveryAt.value,
                        Condition: result.data.filter
                    }
                }
            }
            if (disType.value == 2){
                gridAction.getParams = {
                    procName:'sp_build_DisData_FromShipper',
                    procParmars:{
                        DeliveryAt: deliveryAt.value,
                        Condition: result.data.filter
                    }
                }
            }
            if (disType.value == 3){
                gridAction.getParams = {
                    procName:'sp_build_DisData_CheckStock',
                    procParmars:{
                        DeliveryAt: deliveryAt.value,
                        Condition: result.data.filter
                    }
                }
            }
            if (disType.value == 4){
                gridAction.getParams = {
                    procName:'sp_build_DisData_LabelPrint',
                    procParmars:{
                        DeliveryAt: deliveryAt.value,
                        Condition: result.data.filter
                    }
                }
            }
        gridAction.open()
    }
}

const handleKeyDown = (e: KeyboardEvent)=>{
    if (e.key=='Escape'){
        Win.closeWin()
    }
}

const handlePrint = async (e: Event)=>{
    const chunkArray=(array: any, size: number)=> {
        let result = []
        for (let i = 0; i < array.length; i += size) {
            result.push(array.slice(i, i + size))
        }
        return result
    }
    const res = await MessageBox.question({
        title:'提问',
        content:  '是否要打印标签'
    })
    if (res.action !== ModalResultEnum.mrConfirm) return false
    gridAction.printDatas.map((item: any)=>{
        item.Url = `https://www.hzlinke.com.cn/linkeDisSystem/checkReports/index.html?linkename=${commonParam.$linkname}&billnumber=${item.billnumber}&catecode=${Math.floor(item.catecode/100)}&proudctcode=${item.productcode}`
    }) 
    const printDatas = chunkArray(gridAction.printDatas,500)
    let delay = 0
    for (let i=0;i<printDatas.length;i++){
        if (i>0){delay = 2000}
        setTimeout(() => {
            const _Datas =JSON.stringify({datas:printDatas[i]})
            const Pramars = {
                Command:'PrintLabel',
                Datas:_Datas,
                DefaultPrintName:'LkGP',
                Preview: '0'
            }
            api.getScaleInfo('',Pramars).then((res)=>{
                if (res&&res.errCode!=0){
                    console.log('服务器无启动')
                    return
                } 
            })
        }, delay)
    }
}

const beforePrint = async (): Promise<boolean>=>{
    if (disType.value==5) {pagerHeight.value=297} else {pagerHeight.value=210}
    PrintDatas.value = $Utils.buildPrintDatas(dataSource.dataSet,'printDom',pagerHeight.value-8)
    startPrint.value = true 
    return new Promise((resolve, reject) => {
        resolve(true)
    })
}

nextTick(()=>{
    (WinBox.value as HTMLDivElement).focus()
     Win.printDom = printDom.value
    Win.beforePrint = beforePrint
})

watch(
    ()=>disType.value,
    (n,o)=>{
        switch (Number(n)){
            case 0:
                headerColSpan.value = 8
                pirntCaption.value = deliveryAt.value + '配货表(按客户)'
                gridAction.Columns = gridAction.PrintColumns==1?gridAction.CustomerColumnsOne:gridAction.CustomerColumns
                gridAction.arrGroupFieldName = 'customercode'
                dataSource.dataSet = []
                break
            case 1:
                headerColSpan.value = 8
                pirntCaption.value = deliveryAt.value + '配货表(按分类)'
                gridAction.Columns = gridAction.PrintColumns==1?gridAction.CateColumnsOne:gridAction.CateColumns
                gridAction.arrGroupFieldName = 'catecode'
                dataSource.dataSet = []
                break
            case 2:
                headerColSpan.value = 8
                pirntCaption.value = deliveryAt.value + '配货表(按货商)'
                gridAction.Columns = gridAction.PrintColumns==1?gridAction.CateColumnsOne:gridAction.CateColumns
                gridAction.arrGroupFieldName = 'shippercode'
                dataSource.dataSet = []
                break
            case 3:
                headerColSpan.value = 12
                pirntCaption.value = deliveryAt.value + '库存清点表'
                gridAction.Columns = gridAction.StockColumns
                gridAction.arrGroupFieldName = 'catecode'
                dataSource.dataSet = []
                break
            case 4:
                headerColSpan.value = 10
                pirntCaption.value = deliveryAt.value + '标签打印'
                gridAction.Columns = gridAction.LabelPrintColumns
                gridAction.arrGroupFieldName = 'none'
                dataSource.dataSet = []
                break
            case 5:
                headerColSpan.value = 10
                pirntCaption.value = deliveryAt.value + '司机取货单'
                gridAction.Columns = gridAction.OrderPrintColumns
                gridAction.arrGroupFieldName = 'customercode'
                dataSource.dataSet = []
                break
        }
    }
)
</script>
<style lang="scss" scoped>
@page { 
    margin:0 8mm;
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
        margin-left: 5px ;
        outline-color: blue;
        width: 210px;
    }
    .shipper-input{
        width: 250px;
    }
    .shipper-Cate{
        width: 200px;
    }
    button{
        margin-left: 10px ;
        width: 100px;
    }
}
.win-body{
    position: absolute;
    top: 40px;
    left: 0;
    right:0;
    bottom: 0;
    overflow: auto;
    padding-left: 20px ;
    padding-top: 5px ;
}
table{
    width: 0;
    font-family: '宋体';
    border-collapse:collapse;  
    table-layout:fixed;
    tr{
        min-height: 26px;
    }
    td,th{
        border: 1px solid black;
        line-height: 1.5;
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
.placeholder{
    height: 10mm;
}
.err{
    color: red;
}
.label{
    display: inline-flex;
    align-items: center;
    padding: 3px;
    margin-right: 5px;
}
.radio-action{
    height: 20px;
    width: 20px;
    padding: 0;
    margin: 0;
    outline: 0;
    margin-right: 5px;
}
.applay-button{
    height: 30px;
}



</style>
