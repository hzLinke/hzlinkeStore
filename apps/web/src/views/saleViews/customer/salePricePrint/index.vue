<template>
    <div class="win">
       <div  class="win-body">
            <table  id="printDom" border="0" cellspacing="0" cellpadding="0">
                <colgroup>
                    <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                </colgroup>
                <thead style="display:table-header-group">
                    <tr class="nobarder placeholder"></tr>
                    <tr class="nobarder">
                        <td :colspan="10" class="center headerTitle nobarder">{{getLtdInfo.name}}</td>
                        <td :rowspan="4" :colspan="2" class="center nobarder"><vue-qr class="qrCode" text= '后台接口未完成请待完成后扫描有效' :size='150'></vue-qr></td>
                    </tr>
                    <tr class="nobarder">
                        <td :colspan="10" class="center headerTitle nobarder">商品报价单</td>
                        
                    </tr>
                    <tr class="nobarder">
                        <td :colspan="6" class="nobarder">地址：{{getLtdInfo.addr}}</td>
                        <td :colspan="6" class="nobarder">电话：{{getLtdInfo.tel}}</td>
                    </tr>
                    <tr>
                        <td :colspan="6" class="nobarder">客户：{{HearderData.name}}</td>
                        <td :colspan="6" class="nobarder">报价时段：{{getStartAt}}~{{getEndAt}}</td>
                    </tr>
                    <tr >  
                        <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                            {{item.title}}
                        </td>
                    </tr>
                </thead>
                <tbody >
                    <template v-for="(item,index) in DataSet" :key="index">
                        <tr v-if="item.catename"><td :colspan="12">{{item.catename}}</td></tr>
                        <tr v-else >
                            <td v-for="(cellItem,cellIndex) in gridAction.Columns" 
                                :name="cellItem.fieldName" :key="cellIndex"  
                                :style="{'textAlign':cellItem.align}"
                            >
                                <div>{{format(item,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                            </td>
                        </tr>
                    </template>
                </tbody>
                <tfoot style="display:table-footer-group " >
                    <tr class="footerStyle"></tr>
                    <tr class="nobarder placeholder"></tr>
                </tfoot> 
            </table>
            <div v-if="startPrint"  ref="printDom" >
                <table  v-for="(PageItem,PageIndex) in PrintDatas" :key="PageIndex" border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                        <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                    </colgroup>
                    <thead style="display:table-header-group">
                        <tr class="nobarder placeholder"></tr>
                        <tr class="nobarder">
                            <td :colspan="10" class="center headerTitle nobarder">{{getLtdInfo.name}}</td>
                            <td :rowspan="4" :colspan="2" class="center nobarder"><vue-qr class="qrCode" text= '后台接口未完成请待完成后扫描有效' :size='150'></vue-qr></td>
                        </tr>
                        <tr class="nobarder">
                            <td :colspan="10" class="center headerTitle nobarder">商品报价单</td>
                            
                        </tr>
                        <tr class="nobarder">
                            <td :colspan="6" class="nobarder">地址：{{getLtdInfo.addr}}</td>
                            <td :colspan="6" class="nobarder">电话：{{getLtdInfo.tel}}</td>
                        </tr>
                        <tr>
                            <td :colspan="6" class="nobarder">客户：{{HearderData.name}}</td>
                            <td :colspan="6" class="nobarder">报价时段：{{getStartAt}}~{{getEndAt}}</td>
                        </tr>
                        <tr >  
                            <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                                {{item.title}}
                            </td>
                        </tr>
                    </thead>
                    <tbody >
                        <template v-for="(item,index) in PageItem" :key="index">
                            <tr v-if="item.catename"><td :colspan="12">{{item.catename}}</td></tr>
                            <tr v-else >
                                <td v-for="(cellItem,cellIndex) in gridAction.Columns" 
                                    :name="cellItem.fieldName" :key="cellIndex"  
                                    :style="{'textAlign':cellItem.align}"
                                >
                                    <div>{{format(item,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                                </td>
                            </tr>
                        </template>
                    </tbody>
                    <tfoot style="display:table-footer-group " >
                         <tr class="footerStyle">
                            <td :colspan="12" class="nobarder footerStyle">{{ `第${+PageIndex+1}页/共${PrintDatas.length}页`  }}</td>
                        </tr>
                        <tr class="nobarder placeholder"></tr>
                     </tfoot> 
                </table>
            </div>
       </div>
    </div>
    
</template>

<script setup lang="ts">
import { reactive, ref, computed, nextTick } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import QRCode from 'qrcodejs2'
import VueQr from 'vue-qr'
import { TableColumnsType, TableRowDataType } from '@v4x/ui'
import { CustomerInstanceRefs } from '../types'

defineOptions({
    name: 'SalePricePrint'
})

interface Props {
    HearderData?: TableRowDataType
    DataSet?: TableRowDataType
}

const props = withDefaults(defineProps<Props>(), {
    HearderData: () => ({}),
    DataSet: () => []
})

const printDom = ref<null | HTMLElement>(null)
const _loginDatas = JSON.parse(sessionStorage.getItem('loginDatas') || '')
const UserCode = _loginDatas.idcode
const PrintDatas = ref([] as any)
const startPrint = ref(false)
const pagerHeight = ref(297)
const Win = reactive(new TWinForm({}))
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/purchase/downOrderGroup/',
        KeyFieldName: 'ProductCode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const gridAction = reactive(new TListGridAction(dataSource, {} as CustomerInstanceRefs))

const getLtdInfo = computed(() => {
    const inx = $Utils.getIndexFromArray(gridAction.commonDatas.LtdDatas, 'idcode', props.HearderData.relationcode)
    return {
        name: gridAction.commonDatas.LtdDatas[inx].name,
        addr: gridAction.commonDatas.LtdDatas[inx].addr,
        tel: gridAction.commonDatas.LtdDatas[inx].tel,
        person: gridAction.commonDatas.LtdDatas[inx].person,
    }
})

const format = (rowItem: TableRowDataType, cellItem: TableColumnsType, fieldName: string) => {
    if (cellItem.customFormater) {
        if (typeof cellItem.customFormater == 'function') {
            return cellItem.customFormater(rowItem[fieldName], rowItem)
        }
    } else {
        return rowItem[fieldName]
    }
}

const getStartAt = computed(() => {
    return $Utils.dateFormat(props.HearderData.startat, 'yyyy-MM-dd')
})

const getEndAt = computed(() => {
    return $Utils.dateFormat(props.HearderData.endat, 'yyyy-MM-dd')
})

const beforePrint = async (): Promise<boolean> => {
    PrintDatas.value = $Utils.buildPrintDatas(props.DataSet, 'printDom', pagerHeight.value)
    startPrint.value = true
    return new Promise((resolve, reject) => {
        resolve(true)
    })
}

defineExpose({
    beforePrint,
    printDom
})
</script>

<style lang="scss" scoped>
@page { 
    margin: 0 8mm;
}
.win{
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    overflow: auto;
}
.win-hearder{
    height: 40px;
    border-bottom: 1px solid red ;
    display: flex;
    align-items: center;
    .Input-DeliveryAt{
        margin-left: 10px ;
        outline-color: blue;
    }
    .shipper-input{
        width: 300px;
    }
    button{
        margin-left: 10px ;
        width: 100px;
    }
}

.win-body{
    position: absolute;
    top: 0px;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 10px;
    width: 20cm;
}
table{
    width: 0;
    font-size: 14px;
    font-family: '宋体';
    border-collapse: collapse;  
    table-layout: fixed;
    tr{
        height: 26px;
    }
    td, th{
        padding: 3px;
        border: 1px solid black;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
}

.center{
    text-align: center;
}
.headerTitle{
    font-size: 20px;
    padding-left: 80px ;
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
    height: 20px;
}
.qrCode{
    height: 120px;
    width: 120px;
    padding: 2px;
}

.win-body {
  counter-reset: section;
}
</style>
