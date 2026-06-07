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
    />
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
        <template #expand>
            <div class="expand-body">
                <LkxGrid ref='lkxWaitOutGrid' class="grid" 
                    :columns= "formAction.Columns" 
                    :dataSource= "formDataSource" 
                    :gridAction= "formAction"
                    :methods= "formAction.Methods" 
                    :events= "formAction.Events"
                    :tableConfig= "formAction.TableConfig"
                    :serachBoxConfig= "formAction.SerachBoxConfig"
                    :pagerConfig= "formAction.PagerConfig"
                    :power= "formAction.PowerList"
                    :loading = "formAction.Loading"
                    :loadText = "formAction.LoadText"
                />
            </div>
        </template>
    </LkxGrid>
</template>
<script setup lang="ts">
import { reactive, ref, computed, onMounted, onUpdated, watch, useTemplateRef, markRaw, inject } from 'vue'
import { LkxGrid, LkxInput, LkxToolsBar } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction ,TFormGridAction} from "./action"
import type { SaleInstanceRefs } from './types'
import { useRoute } from "vue-router"

defineOptions({ name: 'sale' })

const route = useRoute(); 
const funCode = route.query.idcode as unknown as number
const commonDatas = inject<Record<string, any>>('commonDatas', ref({}))

const lkxGrid = useTemplateRef('lkxGrid')
const lkxDetailGrid = useTemplateRef('lkxDetailGrid')


const detailVisabled = ref(false)
const headerDisabled = ref(false)
const headerData = ref<Record<string, any>>({})

const listDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/sale/BillList/',
    KeyFieldName: 'billNumber',
    NotAllowOperationList: [],
    getParmars: { 
        sortFields: 'DeliveryAt', 
        totalFieldSql: 'count(billnumber) as count,sum(costMoney) as costMoney,sum(round(saleMoney,2)) as saleMoney,sum(profit) as profitMoney'
    }
}))

const detailDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/sale/BillDetail/',
    KeyFieldName: 'IdKey',
    NotAllowOperationList: [],
    getParmars: { sortFields: 'IdKey', pageSize: 0 }
}))

const formDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/sale/batchNumberFrom/',
    KeyFieldName: 'BatchNumber',
    NotAllowOperationList: [],
    getParmars: { sortFields: 'BatchNumber', pageSize: 0 }
}))

const instanceRefs = markRaw<SaleInstanceRefs>({
    headerData,
    detailVisabled,
    headerDisabled,
    userCode: 0,
    detailDataSource: detailDataSource
})

const Win = reactive(new TWinForm(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))
const formAction = reactive(new TFormGridAction(formDataSource, instanceRefs))
gridDetailAction.instanceRefs.headerGridAction = gridAction
gridDetailAction.instanceRefs.fromGridAction = formAction

const headerConfig = computed<HeaderConfigType>(() => ({
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
                        gridAction.dataSource.setFieldValue('dr', data.dr);
                        gridAction.dataSource.setFieldValue('decimalbit', data.decimalbit);
                        gridAction.dataSource.setFieldValue('salefromquoteprice', data.salefromquoteprice);
                        gridAction.dataSource.setFieldValue('qualitygrade', data.qualitygrade)
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
                    dropListDatas: commonDatas.value?.CustomerDatas || [],
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
                    dropListDatas: commonDatas.value?.UserDatas || [],
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
                span: 5,
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
                fieldName: 'customerorderid',
                span: 3,
                config: {
                    caption: '', 
                    captionAlign: 'right',
                    align: 'left',
                    placeholder: '请输入客户单号',
                    disabled: () => headerDisabled.value,
                    inputType: 'text',
                    onChange: (data: any) => {
                        gridAction.dataSource.setFieldValue('CustomerOrderId', data)
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
}))

gridDetailAction.PrintStyleState.config!.buttons = [{
    iconType: 'more',
    onClick: async (data: any) => {
       
    }
}]


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
.expand-body{
    display: flex;
    margin-top: 2px;
    height: 200px; 
    border-top: 1px solid $table-line-color ;
    border-left: 1px solid $table-line-color ;
}


</style>