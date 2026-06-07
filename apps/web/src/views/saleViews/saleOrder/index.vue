<template>
    <LkxGrid 
        v-show="!detailVisabled" 
        ref="lkxGrid" 
        class="grid" 
        :columns="gridAction.Columns" 
        :dataSource="listDataSource" 
        :gridAction="gridAction"
        :methods="gridAction.Methods" 
        :events="gridAction.Events"
        :tableConfig="gridAction.TableConfig"
        :serachBoxConfig="gridAction.SerachBoxConfig"
        :pagerConfig="gridAction.PagerConfig"
        :power="gridAction.PowerList"
        :loading="gridAction.Loading"
        :loadText="gridAction.LoadText"
    />
    <LkxGrid 
        v-if="detailVisabled" 
        ref="lkxDetailGrid" 
        class="grid" 
        :columns="gridDetailAction.Columns" 
        :dataSource="detailDataSource" 
        :gridAction="gridDetailAction"
        :methods="gridDetailAction.Methods" 
        :events="gridDetailAction.Events"
        :tableConfig="gridDetailAction.TableConfig"
        :serachBoxConfig="gridDetailAction.SerachBoxConfig"
        :pagerConfig="gridDetailAction.PagerConfig"
        :power="gridDetailAction.PowerList"
        :loading="gridDetailAction.Loading"
        :loadText="gridDetailAction.LoadText"
        :printConfig="gridDetailAction.PrintConfig"
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel">
                <header-panel :rowData="headerData" :config="headerConfig" />
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <LkxToolsBar 
                    class="toolsBar" 
                    :toolsBarItems="gridDetailAction.toolsBarItems" 
                    :showIcon="false" 
                    @itemClick="gridDetailAction.ToolsBarItemClick($event)"
                />
                <input 
                    name="ElSaleOrderSearch" 
                    class="search" 
                    placeholder="请输入品名查找" 
                    @keypress="handleNameSearch"
                />
                <lkx-input
                    class="printStyle-input"
                    name="ElPrintStyle"
                    :config="gridDetailAction.PrintStyleState.config"
                    :dropConfig="gridDetailAction.PrintStyleState.dropConfig"
                    v-model="gridDetailAction.SelectPrintStyleCode"
                />
            </div>
        </template>
        <template #expand="row">
            <div class="expand-body">
                <template v-if="row?.row?.detailnote">
                <div v-for="value in row?.row?.detailnote.split(';')" :key="value">
                        {{ value }}
                    </div>
                </template>
            </div>
        </template>
    </LkxGrid>
    <img 
        v-if="detailVisabled && headerData.examineusercode != 0" 
        class="updatePng" 
        src="../../../assets/fh.png" 
    />
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, watch, useTemplateRef, markRaw } from 'vue'
import { LkxGrid, LkxInput, LkxToolsBar } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction } from "./action"
import type { SaleOrderInstanceRefs } from './types'
import useAppStore from '@/stores'

defineOptions({ name: 'saleOrder' })

const appStore = useAppStore()   
const lkxGrid = useTemplateRef('lkxGrid')
const lkxDetailGrid = useTemplateRef('lkxDetailGrid')

const { idcode: userCode, lookselforder: lookSelfOrder } = appStore.loginDatas

const detailVisabled = ref(false)
const headerDisabled = ref(false)
const headerData = ref<Record<string, any>>({})

const listDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/saleOrder/BillList/',
    KeyFieldName: 'billNumber',
    NotAllowOperationList: [],
    getParmars: {
        mustCondition: +lookSelfOrder === 0 ? '' : `(MakingUserCode=${userCode} or MakingUserCode=1 or MakingUserCode=-1)`,
        totalFieldSql: 'count(billnumber) as count,sum(saleMoney) as saleMoney'
    }
}))

const detailDataSource = reactive(new TDataSource({
    ApiPath: '/masterApi/disApi/sales/saleOrder/BillDetail/',
    KeyFieldName: 'IdKey',
    NotAllowOperationList: [],
    getParmars: { sortFields: 'IdKey', pageSize: 0 }
}))

const instanceRefs = markRaw<SaleOrderInstanceRefs>({
    headerData,
    detailVisabled,
    headerDisabled,
    userCode: userCode,
    detailDataSource: detailDataSource
})

const Win = reactive(new TWinForm<SaleOrderInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))

gridAction.TableConfig.title = '客户订货单列表'
gridDetailAction.instanceRefs.headerGridAction = gridAction

Win.getPrintStyle().then(res => {
    gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res
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
                    disabled: () => headerDisabled.value,
                    align: 'left',
                    inputType: 'drop',
                    onChange: (data: any) => {
                        console.log(data)
                        gridAction.dataSource.setFieldValue('customercode', data.idcode)
                        gridAction.dataSource.setFieldValue('dr', data.dr)
                        gridAction.dataSource.setFieldValue('decimalbit', data.decimalbit)
                        gridAction.dataSource.setFieldValue('salefromquoteprice', data.salefromquoteprice)
                        gridAction.dataSource.setFieldValue('qualitygrade', data.qualitygrade)
                    }
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: true,
                    dropListPosition: {},
                    resultFieldName: 'idcode',
                    displayFieldName: 'name',
                    displayFields: 'idcode|shortname|name',
                    displayFieldWidths: '50|80|400',
                    dropListDatas: gridAction.commonDatas.CustomerDatas,
                    onFilter: (filterValue: string, dropListDatas: any[]) => {
                        return dropListDatas.filter(item => 
                            item.shortname.includes(filterValue) || item.name.includes(filterValue)
                        )
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
                    dropListPosition: {},
                    resultFieldName: 'idcode',
                    displayFieldName: 'name',
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
                span: 5,
                config: {
                    caption: '备注', 
                    captionAlign: 'right',
                    align: 'left',
                    disabled: () => headerDisabled.value,
                    inputType: 'text',
                    onChange: (data: any) => gridAction.dataSource.setFieldValue('note', data)
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
                    onChange: (data: any) => gridAction.dataSource.setFieldValue('CustomerOrderId', data)
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
                    disabled: () => headerDisabled.value,
                    inputType: 'datetime',
                    onChange: (data: any) => gridAction.dataSource.setFieldValue('deliveryat', data)
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

const handleNameSearch = (event: KeyboardEvent): void => {
    if (event.key !== 'Enter') return
    
    const inputEl = event.target as HTMLInputElement
    gridDetailAction.dataSource.dataSet = gridDetailAction.dataSource.CurDataSet.filter(
        item => item.name.includes(inputEl.value)
    )
    inputEl.value = ''
}

const initDetailGrid = () => {
    detailDataSource.getParams.sortFields = 'idkey'
    headerDisabled.value = parseInt(headerData.value.examineusercode) !== 0
    gridDetailAction.PagerConfig.curPage = 1
    gridDetailAction.TableConfig.readOnly = headerDisabled.value
    gridDetailAction.dataSource.getParams.condition = ''
    gridDetailAction.dataSource.getParams.mustCondition = `billNumber='${headerData.value.billnumber}'`
    gridDetailAction.open()
    
    const printStyleList = gridDetailAction.PrintStyleState.dropConfig?.dropListDatas || []
    if (printStyleList.length > 0) {
        gridDetailAction.SelectPrintStyleCode = printStyleList[0]['xh']
        gridDetailAction.PrintConfig = JSON.parse(printStyleList[0]['style'])
    }
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
        initDetailGrid()
    } else {
        detailDataSource.close()
    }
})
</script>

<style lang="scss" scoped>
.search {
    outline-color: blue;
}

.funcToolsBar {
    display: flex;
    flex-direction: row;
    border-bottom: 1px solid #eeee;
    align-items: center;
    height: 40px;
    
    .toolsBar {
        padding-left: 10px;
        background-color: white;
        width: 680px;
    }
    .printStyle-input {
        width: 300px;
    }
}
.expand-body{
    padding-left: 50px;
}
</style>
