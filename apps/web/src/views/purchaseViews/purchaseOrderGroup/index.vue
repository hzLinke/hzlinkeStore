<template>
    <div class="win" ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
       <div class="win-hearder">
            <lkx-input 
                class="Input-DeliveryAt"
                name="ElInputDeliveryAt"
                :config="deliveryAtState.config"
                v-model="deliveryAt"
            />
            <label style="margin-left:20px"><input name="ElShowFinish" type="checkbox" v-model="showFinish"/>只显示未采购完</label>
            <button style="margin-left:250px" @click="handleApplay">应用</button>
        </div> 
       <div class="win-body">
            <table  :border="0" cellspacing="0" cellpadding="0">
                <colgroup>
                    <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                </colgroup>
                <thead>
                    <tr>
                        <th :colspan=6>{{deliveryAt}}客户订货汇总</th>
                    </tr>
                    <tr>  
                        <th v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                            {{item.title}}
                        </th>
                    </tr>
                </thead>
                <tbody v-for="(cateItem,cateIndex) in dataSource.dataSet" :key="cateIndex">
                    <tr class="cateStyle">
                        <td :colspan="4">{{cateItem.catename}}</td>
                        <td :colspan="2" class="no-print merge-action">
                            <label><input type="checkbox" style=" height: 15px;width:15px;" v-model="cateItem.checked" @click="handelMergeChecked($event,cateItem)" >全选</label>
                            <lkx-input class="shipper-input"
                                name="shipperState"
                                :config="shipperState.config"
                                :dropConfig="shipperState.dropConfig"
                                v-model="shipperCode"
                            />
                            <button class="no-print opt-button-plus" @click="handleMergeAccept(cateItem,cateIndex)">合并下单</button>
                            <label><input type="checkbox" style=" height: 15px;width:15px;" v-model="cateItem.hideDetail">隐藏明细</label>
                        </td>
                    </tr>
                    <tr  class="lkx-table-body-row" v-for="(productItem,productIndex) in cateItem.children" :key="productIndex">
                        <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                            :style="{textAlign:getAlign(cellItem.align)}"
                        >
                            <div v-if="cellItem.fieldName=='sep'" class="lkx-sep-cell lkx-ellipsis">
                                <span class="lkx-sep-cell-serial">{{+productIndex+1}} </span>
                            </div>
                            <div v-if="(typeof productItem[cellItem.fieldName.toLocaleLowerCase()]!='object')">{{format(productItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                            <div v-else>
                                <table v-if="!cateItem.hideDetail"  :border="1" cellspacing="0" cellpadding="0">
                                    <colgroup>
                                        <col v-for="(item,index) in gridAction.ChildrenColumns" :key="index" :width="item.width+'px'"/>
                                    </colgroup>
                                    <tbody>
                                        <tr class="lkx-table-body-row" 
                                            v-for="(packItem,packIndex) in productItem[cellItem.fieldName.toLocaleLowerCase()]" :key="packIndex"
                                            @click="thisPackIndex=+packIndex;thisProductIndex=+productIndex"
                                        >
                                            <td v-for="(colItem,colIndex) in gridAction.ChildrenColumns" :key="colIndex"  
                                                :style="{textAlign :getAlign(cellItem.align)}" :class="{'no-print':colItem.fieldName=='opt','over': packItem.owenum<=0} ">
                                                <div class="SubCheckBox" v-if="colItem.fieldName=='chk'">
                                                    <input type="checkbox" class="no-print" v-model="packItem.checked"  :disabled="packItem.owenum<=0" @click="handelItemChecked(cateItem,productItem,packItem)"/>
                                                </div>
                                                <div v-if="colItem.fieldName=='opt'&&packItem.owenum>0" >
                                                    <button class="opt-button-plus" @click="handleChangeNum(packItem,cateIndex,+productIndex,+packIndex)">修改订量</button>
                                                </div>
                                                <div v-else>{{format(packItem,colItem,colItem.fieldName.toLocaleLowerCase())}}</div>
                                            </td>
                                        </tr>
                                        <tr class="lkx-table-body-row">
                                             <td :colspan="3" class="no-print">
                                                <div style="display: flex;">
                                                    <label style="width:50% ">可用量：{{clearDecimal(productItem.stock)}}</label>
                                                    <label style="width:50% ">采购量：{{clearDecimal(productItem.pruchasenum)}}</label>
                                                </div>
                                            </td>
                                            <td :colspan="6" class="no-print opt-box">
                                                <label><input type="checkbox" :disabled="productItem.owenum==0"  @click="handleCheckedAll($event,cateItem,productItem)" v-model="productItem.checked">全选</label>
                                                <button class="opt-button" :disabled="productItem.owenum==0" @click="handleAccept(productItem,cateIndex,+productIndex)">下单</button>
                                                <button class="opt-button" :disabled="productItem.owenum==0" @click="handleChange(productItem,cateIndex,+productIndex)">换货</button>
                                                <button class="opt-button" :disabled="productItem.owenum==0" @click="handleCancel(productItem,cateIndex,+productIndex)">取消</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                     
                                </table>
                                <table v-else  :border="1" cellspacing="0" cellpadding="0">
                                    <colgroup>
                                        <col v-for="(item,index) in gridAction.ChildrenColumns" :key="index" :width="item.width+'px'"/>
                                    </colgroup>
                                    <tbody>
                                        <tr class="lkx-table-body-row" :class="{'over': productItem.owenum<=0} ">
                                            <td :colspan="1" class="no-print opt-box">
                                                <label><input type="checkbox" :disabled="productItem.owenum<=0"  @click="handleCheckedAll($event,cateItem,productItem)" v-model="productItem.checked">全选</label>
                                            </td>
                                             <td :colspan="8" class="no-print">
                                                <div style="display: flex;">
                                                    <label style="width:50% ">可用量：{{clearDecimal(productItem.stock)}}</label>
                                                    <label style="width:50% ">采购量：{{clearDecimal(productItem.pruchasenum)}}</label>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                     
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="printDiv">
                <table ref="printDom"  border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                        <col v-for="(item,index) in printAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                    </colgroup>
                    <thead style="display:table-header-group">
                        <tr class="nobarder">
                            <th :colspan="getColspan()">{{deliveryAt}}客户订货汇总</th>
                        </tr>
                        <tr >  
                            <th class="center" v-for="(item,index) in printAction.Columns" :name="item.fieldName" :key="index">
                                {{item.title}}
                            </th>
                        </tr>
                    </thead>
                    <tbody v-for="(item,index) in gridAction.printData.value" :key="index">
                        <tr><td :colspan="getColspan()" style="text-align: center;">{{item.catename}}</td></tr>
                        <tr class="lkx-table-body-row" v-for="(rowItem,rowIndex) in item.children" :key="rowIndex">
                            <td v-for="(cellItem,cellIndex) in printAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                            :style="{textAlign: getAlign(cellItem.align)}">
                                <div>{{format(rowItem,cellItem,cellItem.fieldName.toLocaleLowerCase())}}</div>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr class="nobarder" style="height: 5px;" >
                        </tr>
                    </tfoot>
                </table>
            </div>
       </div>
    </div>

</template>
<script setup lang="ts">
import { reactive, ref, onMounted, onUnmounted, nextTick, markRaw } from 'vue'
import $Utils, { clearDecimal } from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxInput, ModalResultEnum,WinModal,  WinSearch } from '@v4x/ui'
import AcceptWin from './acceptWin/index.vue'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction } from "./action"
import { TPrintAction } from "./printAction"
import type { PurchaseOrderGroupInstanceRefs } from './types'
import type { TableRowDataType } from '@v4x/ui'
import {useAppStore} from '@/stores'
import { WinChangeQts } from '@/components/index.ts'
const appStore = useAppStore()

defineOptions({
    name: 'purchaseOrderGroup'
})



const printDom = ref<null | HTMLElement>(null)
const WinBox = ref<null | HTMLElement>(null)
const thisProductIndex = ref(-1)
const thisPackIndex = ref(-1)
const deliveryAt = ref($Utils.getDate('d', 0))
const showFinish = ref(true)
const shipperCode = ref(0)
const SumNum = ref(0)
const isCheckedAll = ref(false)
const show = ref(false)
const userCode = appStore.loginDatas.idcode
const isMounted = ref(true)

const AcceptData = reactive({} as any)

const ChangeWinState = reactive({
    datas: {},
    config: {
        open: false,
        groupIndex: -1,
        subIndex: -1,
        packIndex: -1,
        defaultShipperCode: 1,
        title: '换货参数',
        width: '600px',
        handleClose: async (data: any) => {
            ChangeWinState.config.open = false
            if (data.type == 'mrOk') {
            }
        }
    }
})

const instanceRefs = markRaw<PurchaseOrderGroupInstanceRefs>({
   detailDataSource: null,
})

const Win = reactive(new TWinForm<PurchaseOrderGroupInstanceRefs>(instanceRefs))
const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/PurchaseOrderGroup/',
            KeyFieldName: 'ProductCode',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)
const printDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/purchasePrint/',
            KeyFieldName: 'ProductCode',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)
const gridAction = reactive(new TListGridAction(dataSource, instanceRefs))
const printAction = reactive(new TPrintAction(printDataSource,instanceRefs))

const thisH = $Utils.getDatePart('h')
if (gridAction.commonDatas.SysParamDatas[0].exceedtimetoday < thisH) {
    deliveryAt.value = $Utils.getDate('d', 1)
}
dataSource.getParams.extraData = 'showFinish'
dataSource.getParams.condition = `deliveryAt='${deliveryAt.value}'`
gridAction.open()

const deliveryAtState = ref<InputOptionsType>({
    config: {
        caption: '请选择送货日期', 
        captionWidth: 120,
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


const getColspan = () => {
    const _r = gridAction.commonDatas.SysParamDatas[0].purchasegridprintcol
    return _r * 7
}

const format = (rowItem: TableRowDataType, cellItem: any, fieldName: string) => {
    if (cellItem.customFormater) {
        if (typeof cellItem.customFormater == 'function') {
            return cellItem.customFormater(rowItem[fieldName], rowItem)
        }
    } else {
        return rowItem[fieldName]
    }
}

const handelMergeChecked = (event: MouseEvent, cateRowItem: any) => {
    setTimeout(() => {
        if (!isMounted.value) return
        cateRowItem['children'].forEach((item: any) => {
            item.checked = cateRowItem.checked
            const _detail = item['detail']
            if (_detail) {
                _detail.forEach((subItem: any) => {
                    if (subItem.owenum > 0) {
                        subItem.checked = cateRowItem.checked
                    }
                })
            }
            const _num = gridAction._CaclTotal(item)
            item.pruchasenum = _num
        })
        const isCateCheckedAll = gridAction._IsCheckedAll(cateRowItem)
        cateRowItem.checked = isCateCheckedAll
    }, 100)
}

const handelItemChecked = (cateRowItem: any, ProductRowItem: any, CustomerRowItem: any) => {
    setTimeout(() => {
        if (!isMounted.value) return
        const _num = gridAction._CaclTotal(ProductRowItem)
        ProductRowItem.pruchasenum = _num
        const isCheckedAll = gridAction._IsCheckedAll(ProductRowItem)
        ProductRowItem.checked = isCheckedAll
        const isCateCheckedAll = gridAction._IsCheckedAll(cateRowItem)
        cateRowItem.checked = isCateCheckedAll
    }, 100)
}

const handleCheckedAll = (event: MouseEvent, cateRowItem: any, ProductRowItem: any) => {
    setTimeout(() => {
        if (!isMounted.value) return
        const _detail = ProductRowItem['detail']
        if (_detail) {
            _detail.forEach((item: any) => {
                if (item.owenum > 0) {
                    item.checked = ProductRowItem.checked
                }
            })
        }
        const _num = gridAction._CaclTotal(ProductRowItem)
        ProductRowItem.pruchasenum = _num
        const isCheckedAll = gridAction._IsCheckedAll(ProductRowItem)
        ProductRowItem.checked = isCheckedAll
        const isCateCheckedAll = gridAction._IsCheckedAll(cateRowItem)
        cateRowItem.checked = isCateCheckedAll
    }, 100)
}

const handleChangeNum = async (item: TableRowDataType, groupIndex: number, subIndex: number, packIndex: number) => {
    /*const res = await InputBox.show({
        title:'修改订单数量',
        description:'请输入新数量',
        note:'要代打数量用以“/"号分隔，如10/5代表订量10代打5',
        inputType:'number',
        defaultValue:$Utils.clearDecimal(item.owenum)
    })*/
    console.log(item)
    const res = await WinChangeQts.show({
        title:'修改订单数据',
        inputNum: $Utils.clearDecimal(item.owenum),
        inputRNum: $Utils.clearDecimal(item.replacenumex),
        inputNote: item.note
    })
    if (res.action == ModalResultEnum.mrConfirm) {
        gridAction.changeProductNumber(item,groupIndex, subIndex, packIndex, res.data)
    }
}   

const handleApplay = async () => {
    const searchFields = gridAction.Columns.filter((item: any) => {
        return item.fieldName !== 'sep' && item.fieldName !== 'detail' && item.fieldName !== 'opt'
    }).map((item: any) => {
        return {
            caption: item.title,
            fieldName: item.fieldName,
            filterType: item.dataType === 'number' ? 'fsNone' : 'fsLike'
        }
    })

    const result = await WinSearch.show({
        fields: searchFields
    })

    if (result.action === ModalResultEnum.mrConfirm && result.data) {
        dataSource.getParams.condition = `deliveryAt='${deliveryAt.value}'`
        dataSource.getParams.extraData = ''
        if (showFinish.value) {
            dataSource.getParams.extraData = 'showFinish'
        }
        gridAction.open()
    }
}

const handleMergeAccept = (cateItem: any, cateIndex: number) => {
    gridAction.acceptMergeProduct(cateItem, cateIndex, shipperCode.value, userCode)
    shipperCode.value = 0
}

const handleAccept = async (productData: TableRowDataType, cateIndex: number, productIndex: number) => {
    const _childrenDatas = productData['detail']
    const _checkedDatas = _childrenDatas.filter((item: any) => {
        return item.checked == true
    })
    
    if (_checkedDatas.length === 0) {
        return
    }
    
    const _ownNum = $Utils.sumArray(_checkedDatas, 'owenum')
    const _ownNumEx = $Utils.sumArray(_checkedDatas, 'owenumex')
    const orderList = [] as any
    _checkedDatas.forEach((item: any) => {
        if (item.checked == true) {
            orderList.push(item.billnumber)
        }
    })
    
    AcceptData.deliveryat = productData.deliveryat
    AcceptData.idcode = productData.idcode
    AcceptData.name = productData.name
    AcceptData.spec = productData.spec
    AcceptData.note = productData.note
    AcceptData.downunit = productData.downunit
    AcceptData.unit = productData.unit
    AcceptData.downwg = productData.downwg
    AcceptData.costprice = $Utils.clearDecimal(productData.costprice)
    AcceptData.saletype = productData.saletype
    AcceptData.stock = productData.stock
    AcceptData.inputnum = $Utils.clearDecimal(_ownNum)
    AcceptData.num = $Utils.clearDecimal(_ownNum)
    AcceptData.numex = $Utils.clearDecimal(_ownNumEx)
    AcceptData.orderlist = orderList.join(',')
    AcceptData.picsrc = productData.picsrc
    AcceptData.detail = productData.detail
    AcceptData.idkey = productData.detail[0].idkey
      //    console.log(productData)
    const res = await WinModal.open({
        title:'确认接单',
        width:'600px',
        height:'420px',
        content:AcceptWin,
        datas:AcceptData,
        shipperDatas:gridAction.commonDatas.ShipperDatas,
        defaultShipperCode: productData.detail[0].defaultshippercode
    })
    if (res.action == ModalResultEnum.mrConfirm) {
        gridAction.acceptProduct(res.data, res.data.shipperCode,res.data.free,userCode,cateIndex, productIndex)
    }
    return
}

const handleChange = (productData: TableRowDataType, groupIndex: number,subIndex: number) => {
    gridAction.changeProduct(groupIndex,subIndex)
}

const handleCancel = (productData: TableRowDataType, groupIndex: number,subIndex: number) => {
    gridAction.cancelProduct(groupIndex,subIndex)
}

const handleKeyDown = (e: KeyboardEvent) => {
    if (e.key == 'Escape') {
        Win.closeWin()
    }
}

const getAlign = (FAlign: any) => {
    return FAlign ? FAlign : 'left'
}

nextTick(() => {
    (WinBox.value as HTMLDivElement).focus()
    Win.printDom = printDom.value
})

onUnmounted(() => {
    isMounted.value = false
})
</script>

<style lang="scss" scoped>
 @use "@/assets/css/printStyle.scss" as *;

.win{
   position: absolute;
    top: 0;
    left: 0;
    right:0;
    bottom: 0;
    outline: 0;
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
        width: 200px;
    }
    .txt-input{
        width: 200px;
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
    padding-left: 20px ;
    padding-top: 5px ;
    padding-bottom: 5px;
    overflow: auto;
}
table{
    word-break:break-all;
    font-size: 14px;
    font-family: '宋体';
    border-collapse:collapse; 
    table-layout:fixed;
    tr{
        height: 26px;
    }
    td,th{
        padding: 3px;
        border: 1px solid black;
    }
}
.nobarder{
    border: 0;
}
.opt-button{
    height: 24px;
    width: 50px;
    margin-left: 5px ;
}   
.opt-button-plus{
    height: 24px;
    width: 100px;
}
.opt-box{
    text-align: right;
    label{
        margin-right: 10px;
    }
    input{
        height: 15px;
        width:15px;
    }
    button{
        margin-left: 5px ;
        width: 60px;
    }
}
.SubCheckBox{
    input{
        height: 15px;
        width:15px;
    }
}
.merge-action{
   
    border: 0;
    //text-align: right;
    // padding-right: 30px;
    *{
        margin-right: 10px;
    }
    .shipper-input{
        width: 280px;
    }
}
.cateStyle{
    background: rgb(148, 215, 241);
}
/**采购完成 */
.over{
    background: burlywood;
}
.row-selected{
    background: rgb(0, 174, 255)
}

.printDiv{
    height: 0;
    overflow: hidden;
}


</style>
