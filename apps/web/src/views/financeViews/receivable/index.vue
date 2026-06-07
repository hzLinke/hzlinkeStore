<template>
    <LkxGrid v-show="!detailVisabled" ref='lkxGrid' class="grid" 
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
    <LkxGrid v-if="detailVisabled&&!detailMonthVisabled" ref='lkxDetailGrid' class="grid" 
        :columns="gridDetailAction.Columns" 
        :dataSource="gridDetailAction.dataSource" 
        :gridAction="gridDetailAction"
        :methods="gridDetailAction.Methods" 
        :events="gridDetailAction.Events"
        :tableConfig="gridDetailAction.TableConfig"
        :modelConfig="gridDetailAction.ModelConfig"
        :serachBoxConfig="gridDetailAction.SerachBoxConfig"
        :pagerConfig="gridDetailAction.PagerConfig"
        :reportDesignConfig="gridDetailAction.ReportDesignConfig"
        :power="gridDetailAction.PowerList"
        :loading="gridDetailAction.Loading"
        :loadText="gridDetailAction.LoadText"
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel">
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <LkxToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick="handleToolsBarClick"/>
                <lkx-input class="printStyle-input"
                    :name="gridDetailAction.PrintStyleState.fieldName"
                    :config="gridDetailAction.PrintStyleState.config"
                    :dropConfig="gridDetailAction.PrintStyleState.dropConfig"
                    v-model:value="gridDetailAction.SelectPrintStyleCode"
                />
            </div>
        </template>
        <template #expand>
            <div class="expand-body">
                <LkxGrid ref='lkxDetailListGrid' class="grid" 
                    :columns="gridDetailListAction.Columns" 
                    :dataSource="detailListDataSource" 
                    :gridAction="gridDetailListAction"
                    :methods="gridDetailListAction.Methods" 
                    :events="gridDetailListAction.Events"
                    :tableConfig="gridDetailListAction.TableConfig"
                    :modelConfig="gridDetailListAction.ModelConfig"
                    :serachBoxConfig="gridDetailListAction.SerachBoxConfig"
                    :pagerConfig="gridDetailListAction.PagerConfig"
                    :reportDesignConfig="gridDetailListAction.ReportDesignConfig"
                    :power="gridDetailListAction.PowerList"
                    :loading="gridDetailListAction.Loading"
                    :loadText="gridDetailListAction.LoadText"
                />
            </div>
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { LkxToolsBar } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction, TDetailListGridAction } from "./action"
import type { ReceivableInstanceRefs } from './types'
import useAppStore from '@/stores'

defineOptions({
    name: 'receivable'
})

const appStore = useAppStore()
const { idcode: userCode } = appStore.loginDatas

const lkxGrid = ref<null | HTMLElement>(null)
const lkxDetailGrid = ref<null | HTMLElement>(null)
const detailVisabled = ref(false)
const detailMonthVisabled = ref(false)
const headerData = ref<Record<string, any>>({})

const listDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/finance/receivable/Lists/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: 'count(IdCode) as Count,sum(oweMoney) as OweMoney' }
    })
)
const detailDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/finance/receivable/DetailOnList/',
        KeyFieldName: 'BillNumber',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: 'count(BillNumber) as count,sum(saleMoney) as saleMoney,sum(alreadymoney) as alreadymoney,sum(oweMoney) as OweMoney' }
    })
)
const detailMonthDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/finance/receivable/DetailOnMonth/',
        KeyFieldName: 'monthtext',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: 'count(monthtext) as count,sum(saleMoney) as saleMoney,sum(alreadymoney) as alreadymoney,sum(oweMoney) as OweMoney' }
    })
)
const detailListDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/purchase/purchase/PackDetail/',
        KeyFieldName: 'IdKey',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'IdKey', pageSize: 0 }
    })
)

const instanceRefs = markRaw<ReceivableInstanceRefs>({
    headerData,
    detailVisabled,
    userCode: userCode,
    detailDataSource,
    detailMonthDataSource
})

const Win = reactive(new TWinForm<ReceivableInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))
const gridDetailListAction = reactive(new TDetailListGridAction(detailListDataSource, instanceRefs))

gridAction.instanceRefs.gridDetailAction = gridDetailAction 
gridAction.instanceRefs.gridDetailListAction = gridDetailListAction
const headerConfig = ref<HeaderConfigType>({
    items: [
        [
            {
                fieldName: 'customername',
                span: 5,
                config: {
                    caption: '客户', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'text',
                }
            },
            {
                fieldName: 'settlementtype',
                span: 3,
                config: {
                    caption: '结算', 
                    captionAlign: 'left',
                    captionWidth: 34,
                    align: 'left',
                    disabled: true,
                    inputType: 'drop'
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: false,
                    dropListPosition: {},
                    resultFieldName: 'idcode',
                    displayFieldName: 'name',
                    displayFields: 'idcode|name',
                    displayFieldWidths: '70|100',
                    dropListDatas: gridAction.commonDatas.SettlementTypeDatas
                }
            },
            {
                fieldName: 'accountday',
                span: 1,
                config: {
                    caption: '', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'center',
                    inputType: 'text',
                }
            },
            {
                fieldName: 'owemoney',
                span: 4,
                config: {
                    caption: '欠款', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'right',
                    inputType: 'text',
                    format: '0.00'
                }
            }
        ],
        [
            {
                fieldName: 'tel',
                span: 5,
                config: {
                    caption: '联系', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'text',
                }
            },
            {
                fieldName: 'person',
                span: 2,
                config: {
                    captionAlign: 'right',
                    captionWidth: 50,
                    align: 'left',
                    disabled: true,
                    inputType: 'text',
                }
            },
            {
                fieldName: 'addr',
                span: 6,
                config: {
                    caption: '', 
                    captionAlign: 'right',
                    align: 'left',
                    disabled: true,
                    inputType: 'text',
                }
            }
        ]
    ]
})

const handleToolsBarClick = (data: any) => {
    if (data.idCode == '_Month') {
        gridDetailAction.Columns = gridDetailAction.MontColumns
        gridDetailAction.TableConfig.expand = false
        gridDetailAction.TableConfig.parger = false
        gridDetailAction.dataSource = detailMonthDataSource
        gridDetailAction.dataSource.activeRowIndex = 0
    } else {
        gridDetailAction.Columns = gridDetailAction.ListColumns
        gridDetailAction.TableConfig.expand = true
        gridDetailAction.TableConfig.parger = true
        gridDetailAction.dataSource = detailDataSource
        gridDetailAction.dataSource.activeRowIndex = 0
    }
}

Win.getPrintStyle().then((res) => {
    gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res
    gridDetailAction.SelectPrintStyleCode = res[0]['xh']
    gridDetailAction.PrintConfig = JSON.parse(res[0]['style'])
})

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})

onUpdated(() => {
    Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
})
</script>

<style lang="scss" scoped>
.expand-body {
    margin-top: 5px;
    margin-left: 20px;
    height: 200px;
    overflow: hidden;
    position: relative;
    border-top: 1px solid $table-line-color ;
    border-left: 1px solid $table-line-color ;
}
.funcToolsBar {
    display: flex;
    flex-direction: row;
    border-bottom:1px solid #eeee;
    align-items: center;
    .toolsBar {
        padding-left: 30px;
        background-color: white;
        width: 550px;
    }
    .printStyle-input {
        width: 300px;
    }
}
</style>
