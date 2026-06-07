<template>
    <div class="win">
       <div  class="win-body">
            <table ref="printDom"  :border="0" cellspacing="0" cellpadding="0">
                <colgroup>
                    <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                </colgroup>
                <thead style="display:table-header-group">
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
                        <td :colspan="6" class="nobarder">客户：{{getCustomerName}}</td>
                        <td :colspan="6" class="nobarder">报价时段：{{getStartAt}}~{{getEndAt}}</td>
                    </tr>
                    <tr >  
                        <td class="center" v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                            {{item.title}}
                        </td>
                    </tr>
                </thead>
                <tbody v-for="(item,index) in DataSet" :key="index">
                    <tr><td :colspan="12">{{item.catename}}</td></tr>
                    <tr class="lkx-table-body-row" v-for="(rowItem,rowIndex) in item.children" :key="rowIndex">
                        <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                            :style="[{'text-align':cellItem.align,'color':getColor(rowItem,cellItem.fieldName)}]"
                        >
                            <div>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                        </td>
                    </tr>
                </tbody>
                <tfoot style="display:table-header-group">
                    <tr style="height:20px">
                    </tr>
                </tfoot>
          </table>
       </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, computed } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { TableColumnsType, TableRowDataType } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import vueQr from 'vue-qr'

defineOptions({
    name: 'SalePricePrint'
})

interface Props {
    HearderData?: any
    DataSet?: any[]
}

const props = withDefaults(defineProps<Props>(), {
    HearderData: () => ({}),
    DataSet: () => []
})

const printDom = ref<null | HTMLElement>(null)
const Win = reactive(new TWinForm({}))
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/purchase/downOrderGroup/',
        KeyFieldName: 'ProductCode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)
const gridAction = reactive(new TListGridAction(dataSource, {}))

const getLtdInfo = computed(() => {
    const relationcode = $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas, 'idcode', 'relationcode', props.HearderData.customercode)
    const inx = $Utils.getIndexFromArray(gridAction.commonDatas.LtdDatas, 'idcode', relationcode || 0)
    return {
        name: gridAction.commonDatas.LtdDatas[inx].name,
        addr: gridAction.commonDatas.LtdDatas[inx].addr,
        tel: gridAction.commonDatas.LtdDatas[inx].tel,
        person: gridAction.commonDatas.LtdDatas[inx].person,
    }
})

const getCustomerName = computed(() => {
    if (props.HearderData.name) return props.HearderData.name
    return $Utils.getValueFromArray(gridAction.commonDatas.CustomerDatas, 'idcode', 'name', props.HearderData.customercode)
})

const getStartAt = computed(() => {
    return $Utils.dateFormat(props.HearderData.startat, 'yyyy-MM-dd')
})

const getEndAt = computed(() => {
    return $Utils.dateFormat(props.HearderData.endat, 'yyyy-MM-dd')
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

const getColor = (rowItem: TableRowDataType, fieldName: string) => {
    let _color = ''
    switch (fieldName[fieldName.length - 1]) {
        case '1':
            _color = rowItem['color1']
            break
        case '2':
            _color = rowItem['color2']
            break
        case '3':
            _color = rowItem['color3']
            break
    }
    return _color
}

defineExpose({
    printDom
})
</script>

<style lang="scss" scoped>
body{
    counter-reset:page;
}

.changePrice{
    color: red;
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
   // display:none;
}
table{
   // word-break:break-all;
    width: 0;
    font-size: 14px;
    font-family: '宋体';
    border-collapse: collapse;  
    table-layout: fixed;
    td, th{
        padding: 3px;
        border: 1px solid black;
        //box-sizing: border-box;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
}
.nobarder{
    border: 0;
}
.center{
    text-align: center;
}
.headerTitle{
    font-size: 20px;
    padding-left: 80px ;
}
    
.qrCode{
    height: 120px;
    width: 120px;
    padding: 2px;
}
</style>
