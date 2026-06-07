<template>
    <LkxGrid v-show="!detailVisabled" ref='lkxGrid' class="grid" 
        :columns= "gridAction.Columns" 
        :dataSource= "gridAction.dataSource" 
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
        :dataSource= "gridDetailAction.dataSource" 
        :gridAction= "gridDetailAction"
        :methods= "gridDetailAction.Methods" 
        :events= "gridDetailAction.Events"
        :tableConfig= "gridDetailAction.TableConfig"
        :serachBoxConfig= "gridDetailAction.SerachBoxConfig"
        :pagerConfig= "gridDetailAction.PagerConfig"
        :power= "gridDetailAction.PowerList"
        :loading = "gridDetailAction.Loading"
        :loadText = "gridDetailAction.LoadText"
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <ToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" 
                    @itemClick = "gridDetailAction.ToolsBarItemClick($event)"
                />
                <input name="ElSearch" class="search" placeholder="请输入品名查找" @keypress="handleNameSearch"/>
                <lkx-input class="printStyle-input"
                    name = "ElPrintStyleInput"
                    :config="gridDetailAction.PrintStyleState.config"
                    :dropConfig="gridDetailAction.PrintStyleState.dropConfig"
                    v-model="gridDetailAction.SelectPrintStyleCode"
                />
            </div>
        </template>
    </LkxGrid>
    <img v-if="detailVisabled&&headerData.examineusercode!=0" class="updatePng" src="../../../assets/fh.png" />
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, watch, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { LkxToolsBar as ToolsBar } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction } from "./action"
import type { StockChangeInstanceRefs } from './types'
import {useAppStore} from '@/stores'
const appStore = useAppStore()
defineOptions({
    name: 'stockChange'
})

const lkxGrid = ref<null | HTMLElement>(null)
const lkxDetailGrid = ref<null | HTMLElement>(null)
const userCode = appStore.loginDatas.idcode
const detailVisabled = ref(false)
const headerDisabled = ref(false)
const headerData = ref<Record<string, any>>({})

const listDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/stockChange/BillList/',
            KeyFieldName: 'billNumber',
            NotAllowOperationList: [],
            getParmars: { totalFieldSql: 'count(billnumber) as count,sum(costMoney) as costMoney' }
        }
    )
)
const detailDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/stockChange/BillDetail/',
            KeyFieldName: 'IdKey',
            NotAllowOperationList: [],
            getParmars: { sortFields: 'IdKey', pageSize: 0 }
        }
    )
)

const instanceRefs = markRaw<StockChangeInstanceRefs>({
    detailVisabled,
    headerData,
    headerDisabled,
    userCode,
    detailDataSource
})

const Win = reactive(new TWinForm<StockChangeInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))

gridDetailAction.instanceRefs.headerGridAction = gridAction
const headerConfig = ref<HeaderConfigType>({
    disabled: false,
    items: [
        [
            {
                fieldName: 'areacode',
                span: 5,
                config: {
                    caption: '仓库', 
                    captionAlign: 'right',
                    disabled: () => headerDisabled.value,
                    align: 'left',
                    inputType: 'drop',
                    onChange: (data: any) => {
                        gridAction.dataSource.setFieldValue('areacode', data.idcode)
                    }
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: true,
                    dropListPosition: {},
                    resultFieldName: 'idcode',
                    displayFieldName: 'name',
                    displayFields: 'idcode|name',
                    displayFieldWidths: '70|300',
                    dropListDatas: gridAction.commonDatas.AreaDatas,
                }
            },
            {
                fieldName: 'makingusercode',
                span: 3,
                config: {
                    caption: '制单', 
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
                fieldName: 'changeat',
                span: 4,
                config: {
                    caption: '损溢日', 
                    captionWidth: 55,
                    captionAlign: 'right',
                    align: 'left',
                    disabled: () => headerDisabled.value,
                    inputType: 'datetime',
                    onChange: (data: any) => {
                        gridAction.dataSource.setFieldValue('changeat', data)
                    }
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
                    captionAlign: 'right',
                    captionWidth: 55,
                    align: 'left',
                    disabled: true,
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

const handleNameSearch = (Event: KeyboardEvent) => {
    if (Event.key != 'Enter') return
    const _InputEl = Event.target as HTMLInputElement
    gridDetailAction.dataSource.dataSet = gridDetailAction.dataSource.CurDataSet.filter((item: any) => {
        return item.name.indexOf(_InputEl.value) > -1
    })
    _InputEl.value = ''
}

Win.getPrintStyle().then((res) => {
    gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res
})

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})

onUpdated(() => {
    Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
})

watch(detailVisabled, (n) => {
    if (n) {
        detailDataSource.getParams.sortFields = 'idkey'
        headerDisabled.value = parseInt(headerData.value.examineusercode) != 0
        gridDetailAction.PagerConfig.curPage = 1
        gridDetailAction.TableConfig.readOnly = headerDisabled.value
        gridDetailAction.dataSource.getParams.condition = ''
        gridDetailAction.dataSource.getParams.mustCondition = `billNumber='${headerData.value.billnumber}'`
        gridDetailAction.open()
        const PrintStyleList = gridDetailAction.PrintStyleState.dropConfig?.dropListDatas || []
        if (PrintStyleList.length != 0) {
            gridDetailAction.SelectPrintStyleCode = PrintStyleList[0]['xh']
            gridDetailAction.PrintConfig = JSON.parse(PrintStyleList[0]['style'])
        }
    } else {
        detailDataSource.close()
    }
})
</script>

<style lang="scss" scoped>
.search{
    outline-color: blue;
}
.expand-body{
    margin-top: 5px;
    margin-left: 80px;
    height: 200px;
    overflow: hidden;
    position: relative;
    border-top: 1px solid $table-line-color ;
    border-left: 1px solid $table-line-color ;
}
.funcToolsBar{
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid #eeee;
        align-items: center;
        .toolsBar{
            padding-left: 30px;
            background-color: white;
            width: 550px;
        }
        .printStyle-input{
            width: 300px;
        }
    }
</style>
