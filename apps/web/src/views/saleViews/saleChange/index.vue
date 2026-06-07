<template>
    <LkxGrid v-show="!detailVisabled" ref='lkxGrid' class="grid" 
        :columns= "gridAction.Columns" 
        :dataSource= "listDataSource" 
        :gridAction= "gridAction"
        :methods= "gridAction.Methods" 
        :events= "gridAction.Events"
        :tableConfig= "gridAction.TableConfig"
        
        :serachBoxConfig= "gridAction.SerachBoxConfig"
        :pagerConfig= "gridAction.PagerConfig"

        :power= "gridAction.PowerList"
        :loading = "gridAction.Loading"
        :loadText = "gridAction.LoadText"
    >
    <template #headerPanel>
            <div class="win-hearder">
            <!--<label style="padding-left:20px">送货日期 从<input class="Input-DeliveryAt" type="date" v-model="startDeliveryAt" />  到<input class="Input-DeliveryAt" type="date" v-model="endDeliveryAt" /></label>-->
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
                :config="shipperState.config"
                :dropConfig="shipperState.dropConfig"
                v-model="customerCode"
            />
           
            <button @click="handleApplay">应用</button>
            <button @click="handleCopyBill">调入单据</button>
            <button @click="handleBatchMerge">批量合并</button>
            <button @click="handleBatchDelete">批量删除</button>
            <button @click="handleBatchClear">清除数据</button>
        </div> 
        </template>
    </LkxGrid>
    <LkxGrid v-if="detailVisabled" ref='lkxDetailGrid' class="grid" 
        :columns= "gridDetailAction.Columns" 
        :dataSource= "detailDataSource" 
        :gridAction= "gridDetailAction"
        :methods= "gridDetailAction.Methods" 
        :events= "gridDetailAction.Events"
        :tableConfig= "gridDetailAction.TableConfig"
        :serachBoxConfig= "gridDetailAction.SerachBoxConfig"
        :pagerConfig= "gridDetailAction.PagerConfig"
        :power= "gridDetailAction.PowerList"
        :loading = "gridDetailAction.Loading"
        :loadText = "gridDetailAction.LoadText"
        :headerData= "headerData"
    >
        <template #headerPanel>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <LkxToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "handleToolsBarItemClick"/>
                <input name="ElSearch" class="search" placeholder="请输入品名查找" @keypress="handleNameSearch"/>
                <lkx-input class="printStyle-input"
                    name="ElPrintStyleInput"
                    :config="gridDetailAction.PrintStyleState.config"
                    :dropConfig="gridDetailAction.PrintStyleState.dropConfig"
                    v-model="gridDetailAction.SelectPrintStyleCode"
                />
            </div>
        </template>
        <template v-slot:expand="row">
            <div class="expand-body">
                {{getDetailNote(row)}}
            </div>
        </template>
    </LkxGrid>
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, watch, useTemplateRef, markRaw } from 'vue'
import { InputBox, InputOptionsType, LkxGrid, LkxInput, LkxToolsBar, ModalResultEnum, TableRowDataType, WinModal } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { WinPrintStyleSet } from '@/components'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction } from "./action"
import type { SaleChangeInstanceRefs } from './types'
import DeleteProduct from './deleteProduct/deleteproduct.vue';
import $Utils from '@v4x/utils/lkxUtil'
import useAppStore from '@/stores'

defineOptions({ name: 'saleChange' })

const funCode = 306;//route.query.idcode as unknown as number

const appStore = useAppStore()
const lkxGrid = useTemplateRef('lkxGrid')
const lkxDetailGrid = useTemplateRef('lkxDetailGrid')

const { idcode: userCode } = appStore.loginDatas

const isBatchMerge = ref(false)
const detailVisabled = ref(false)
const headerDisabled = ref(false)
const headerData = ref<Record<string, any>>({})
const targetCustomerCode = ref(0)
const listDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/saleChange/Lists/',
    KeyFieldName: 'billNumber',
    NotAllowOperationList: [],
    getParmars: { 
        sortFields: 'DeliveryAt', 
        totalFieldSql: 'count(billnumber) as count,sum(costMoney) as costMoney,sum(saleMoney) as saleMoney,sum(profit) as profitMoney'
    }
}))

const detailDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/saleChange/Detail/',
    KeyFieldName: 'IdKey',
    NotAllowOperationList: [],
    getParmars: { sortFields: 'IdKey', pageSize: 0 }
}))

const instanceRefs = markRaw<SaleChangeInstanceRefs>({
    headerData,
    detailVisabled,
    headerDisabled,
    userCode: userCode,
    detailDataSource: detailDataSource,
    isBatchMerge: isBatchMerge,
    targetCustomerCode: targetCustomerCode,
})

const Win = reactive(new TWinForm<SaleChangeInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))
gridDetailAction.instanceRefs.headerGridAction = gridAction



const startDeliveryAt = ref($Utils.getMonthFirst());
const endDeliveryAt = ref($Utils.getMonthLast());

const customerCode = ref(0); 

const startDeliveryState = ref<InputOptionsType>({
    config:{
        caption: '送货日期 从', 
        captionWidth: 80,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
    }
}) 
const endDeliveryState = ref<InputOptionsType>({
    config:{
        caption: '到', 
        captionWidth: 20,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
    }
})
const shipperState = ref<InputOptionsType>({
    config:{
        caption: '客户', 
        captionWidth: 50,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
    },
    dropConfig:{
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},/**下拉组件位置 */
        resultFieldName: 'idcode',/**下拉返回字段 */
        displayFieldName: 'name',/**下拉显示字段 */
        displayFields: 'idcode|shortname|name',
        displayFieldWidths: '50|100|300',
        dropListDatas: gridAction.commonDatas.CustomerDatas,
        onFilter: (filterValue: string, dropListDatas: TableRowDataType[]) => {
            return dropListDatas.filter((item: TableRowDataType) => {
                return item.shortname.includes(filterValue) || item.name.includes(filterValue)
            })
        }
    }
})

const headerConfig = ref<HeaderConfigType>({
    disabled: false,
    items: [
        [
            {
                fieldName: 'customercode',
                span: 5,
                config: {
                    caption: '客户', 
                    captionAlign: 'right',
                    disabled: () => headerDisabled.value || headerData.value.orderbillnumber != '',
                    align: 'left',
                    inputType: 'drop',
                    onChange: (data: any) => {
                        headerData.value.relationcode = data.relationcode;
                        gridAction.dataSource.setFieldValue('customercode', data.idcode);
                        Win.getPrintStyle(headerData.value.relationcode, funCode).then((res) => {
                            gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res;
                            const PrintStyleList = gridDetailAction.PrintStyleState.dropConfig?.dropListDatas || []
                            if (PrintStyleList.length != 0) {
                                gridDetailAction.SelectPrintStyleCode = PrintStyleList[0]['xh']
                                gridDetailAction.PrintConfig = JSON.parse(PrintStyleList[0]['style']);
                            }
                        })
                    }
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: true,
                    dropListPosition: {},/**下拉组件位置 */
                    resultFieldName: 'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields: 'idcode|shortname|name',
                    displayFieldWidths: '50|80|400',
                    dropListDatas: gridAction.commonDatas.CustomerDatas,
                    onFilter: (filterValue: string, dropListDatas: any[]) => {
                        return dropListDatas.filter((item: any) => {
                            return item.shortname.includes(filterValue) || item.name.includes(filterValue)
                        })
                    }
                }
            },
            {
                fieldName: 'examineusercode',
                span: 3,
                config: {
                    caption: '审核', 
                    captionAlign: 'left',
                    align: 'left',
                    disabled: true,
                    inputType: 'drop',
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: true,
                    dropListPosition: {},/**下拉组件位置 */
                    resultFieldName: 'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields: 'idcode|name',
                    displayFieldWidths: '70|300',
                    dropListDatas: gridAction.commonDatas.UserDatas,
                }
            },
            {
                fieldName: 'examineat',
                span: 4,
                config: {
                    caption: '审核日', 
                    captionWidth: 55,
                    captionAlign: 'right',
                    align: 'left',
                    disabled: true,
                }
            },
            {
                fieldName: 'billnumber',
                span: 4,
                config: {
                    caption: '单号', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'text',
                }
            }
        ],
        [
            {
                fieldName: 'note',
                span: 8,
                config: {
                    caption: '备注', 
                    captionAlign: 'right',
                    align: 'left',
                    disabled: () => headerDisabled.value,
                    inputType: 'text',
                    onChange: (data: any) => {
                        gridAction.dataSource.setFieldValue('note', data)
                    }
                }
            },
            {
                fieldName: 'deliveryat',
                span: 4,
                config: {
                    caption: '送货日',
                    captionAlign: 'right',
                    captionWidth: 55,
                    align: 'left',
                    disabled: () => headerDisabled.value || headerData.value.orderbillnumber != '',
                    inputType: 'datetime',
                    onChange: (data: any) => {
                        gridAction.dataSource.setFieldValue('deliveryat', data)
                    }
                }
            },
            {
                fieldName: 'salemoney',
                span: 4,
                config: {
                    caption: '金额', 
                    captionAlign: 'right',
                    disabled: true,
                    format: '0.00',
                    align: 'right',
                    inputType: 'text',
                }
            }
        ]
    ]
})

gridDetailAction.PrintStyleState.config!.buttons = [{
    iconType: 'more',
    onClick: async () => {
        await WinPrintStyleSet.show({
            title: '打印格式关联',
            type: 'order'
        })
    }
}]

const getDetailNote = (row: any) => {
    return row?.row?.detailnote
}

const handleToolsBarItemClick = (data: any) => {
    gridDetailAction.ToolsBarItemClick(data)
}

const handleNameSearch = (event: KeyboardEvent) => {
    if (event.key !== 'Enter') return
    const inputEl = event.target as HTMLInputElement
    gridDetailAction.dataSource.dataSet = gridDetailAction.dataSource.CurDataSet.filter(
        (item: any) => item.name.includes(inputEl.value)
    )
    inputEl.value = ''
}

const handleApplay = () => {
    gridAction.dataSource.getParams.condition = `deliveryAt between '${startDeliveryAt.value}' and '${endDeliveryAt.value}' and customerCode=${customerCode.value}`;
    gridAction.open()
}

const handleCopyBill = () => {
    gridAction.copyBillToEx(customerCode.value, startDeliveryAt.value, endDeliveryAt.value)
}

const handleBatchMerge = async ()=> {
    const res = await InputBox.show({
        title: '批量合并',
        description: '请选择合并客户',
        defaultValue: 0,
        inputType: 'drop',
        dropDataList: gridAction.commonDatas.CustomerDatas,
    })
    if (res.action !== ModalResultEnum.mrConfirm) return
    isBatchMerge.value = true;
    targetCustomerCode.value = res.data;
   if (!isBatchMerge.value) {
        gridAction.singleMerge(targetCustomerCode.value)
    } else {
        gridAction.batchMerge(customerCode.value, targetCustomerCode.value, startDeliveryAt.value, endDeliveryAt.value)
    }
}

const handleBatchDelete = () => {
    WinModal.open({
        title: '删除商品',
        content: DeleteProduct,
        width: '1000px',
        height: '600px',
        customerCode: customerCode.value,
        startAt: startDeliveryAt.value,
        endAt: endDeliveryAt.value,
    })
}

const handleBatchClear = () => {
    gridAction.batchClear(customerCode.value, startDeliveryAt.value, endDeliveryAt.value)
}

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})

onUpdated(() => {
    Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
})

watch(detailVisabled, (visible) => {
    if (visible) {
        detailDataSource.getParams.sortFields = 'idkey'
        headerDisabled.value = parseInt(headerData.value.examineusercode) !== 0
        gridDetailAction.PagerConfig.curPage = 1
        gridDetailAction.TableConfig.readOnly = headerDisabled.value
        gridDetailAction.dataSource.getParams.condition = ''
        gridDetailAction.dataSource.getParams.mustCondition = `billNumber='${headerData.value.billnumber}'`
        gridDetailAction.open()
        Win.getPrintStyle(headerData.value.relationcode, funCode).then((res) => {
            gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res;
            const PrintStyleList = gridDetailAction.PrintStyleState.dropConfig?.dropListDatas || []
            if (PrintStyleList.length != 0) {
                gridDetailAction.SelectPrintStyleCode = PrintStyleList[0]['xh']
                gridDetailAction.PrintConfig = JSON.parse(PrintStyleList[0]['style']);
            }
        })
    } else {
        detailDataSource.close()
    }
})
</script>

<style lang="scss" scoped>
    @use "@/assets/css/printStyle.scss" as *;
    .search{
    outline-color: blue;
}

.win-hearder{
    height: 40px;
    display: flex;
    align-items: center;
    .Input-At-Start{
        margin-left: 2px ;
        width: 230px;
    }
    .Input-At-End{
        width: 130px;
    }
    .shipper-input{
        width: 250px;
    }
    button{
        margin-left: 5px ;
        width: 100px;
        height: 30px;
    }
}
    .funcToolsBar{   
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid #eeee;
        align-items: center;
        height: 40px;
        .toolsBar{
            padding-left: 30px;
            background-color: white;
            width: 550px;
        }
        .printStyle-input{
            width: 350px;
        }
    }


</style>