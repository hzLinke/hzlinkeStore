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
    >
        <template #headerPanel>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar">
                <ToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "gridDetailAction.ToolsBarItemClick($event)"/>
                <input name="ElSearch" class="search" placeholder="请输入品名查找" @keypress="handleNameSearch"/>
            </div>
        </template>
    </LkxGrid>
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, getCurrentInstance, onUpdated, watch, markRaw } from 'vue'
import { EditModalConfigParamType } from '@v4x/ui';
import { LkxGrid } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { LkxToolsBar as ToolsBar } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TListGridAction, TDetailGridAction } from "./action"
import { TWinForm } from "@/usehook/win"
import { useAppStore } from '@/stores'
import type { ShipperInstanceRefs } from './types'

const appStore = useAppStore()
defineOptions({
    name: 'shipper'
})
const lkxGrid = ref<null | HTMLElement>(null)
const lkxDetailGrid = ref<null | HTMLElement>(null)
const detailVisabled = ref(false)
const isExtend = appStore.isExtend
const headerData = ref<Record<string, any>>({})

const listDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/shipper/shipperList/',
            KeyFieldName: 'idcode',
            NotAllowOperationList: ['0', '90001'],
            getParmars: {}
        }
    )
)
const detailDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/shipper/shipperDetail/',
            KeyFieldName: 'IdKey',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)

const instanceRefs = markRaw<ShipperInstanceRefs>({
    detailVisabled,
    headerData,
    isExtend,
    detailDataSource: null
})

const Win = reactive(new TWinForm<ShipperInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
gridAction.dataSource.getParams.mustCondition = isExtend ? '' : 'Status=0'
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))

const headerConfig = ref<HeaderConfigType>({
    items: [
        [
            {
                fieldName: 'name',
                span: 5,
                config: {
                    caption: '货商', 
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
                    dropListDatas: useAppStore().commonDatas.SettlementTypeDatas
                }
            },
            {
                fieldName: 'accountday',
                span: 1,
                config: {
                    captionAlign: 'right',
                    align: 'left',
                    disabled: true,
                    inputType: 'text',
                }
            },
            {
                fieldName: 'person',
                span: 2,
                config: {
                    caption: '联系', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'text',
                }
            },
            {
                fieldName: 'tel',
                span: 3,
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
                span: 4,
                config: {
                    caption: '', 
                    captionAlign: 'right',
                    align: 'left',
                    disabled: true,
                    inputType: 'text',
                }
            }
        ],
        [
            {
                fieldName: 'note',
                span: 18,
                config: {
                    caption: '备注', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'text',
                }
            }
        ]
    ]
})

const copyConfig = reactive({
    title: '选择复制来源',
    width: '400px',
    open: false,
    handleClose: (data: any) => {
        copyConfig.open = false
        if (data.type == 'mrOk' && data.datas != 0) {
            gridDetailAction.QuotedPriceCopy(data.datas)
        }
    }
} as EditModalConfigParamType)

const cateConfig = reactive({
    title: '选择调入来源',
    width: '550px',
    open: false,
    handleClose: (data: any) => {
        cateConfig.open = false
        if (data.type == 'mrOk' && data.datas != 0) {
            gridDetailAction.QuotedPriceLoad(data.datas)
        }
    }
} as EditModalConfigParamType)

const importConfig = reactive({
    title: '报价上传',
    width: '800px',
    open: false,
    handleClose: (data: any) => {
        importConfig.open = false
        if (data.type == 'mrOk' && data.datas != 0) {
        }
    }
} as EditModalConfigParamType)

const handleNameSearch = (Event: KeyboardEvent) => {
    if (Event.key != 'Enter') return
    const _InputEl = Event.target as HTMLInputElement
    detailDataSource.getParams.condition = _InputEl.value ? `AliasName like '%${_InputEl.value}%'` : ''
    gridDetailAction.open()
    _InputEl.value = ''
}

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})

onUpdated(() => {
    Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
})

watch(detailVisabled, (n) => {
    if (n) {
        detailDataSource.getParams.sortFields = 'cateSerialNum'
        gridDetailAction.PagerConfig.curPage = 1
        gridDetailAction.dataSource.getParams.condition = ''
        gridDetailAction.open()
        gridDetailAction.toolsBarItems = gridDetailAction.BasicBarItems
    } else {
        detailDataSource.close()
    }
})
</script>

<style lang="scss" scoped>
    .grid{
        position: absolute;
        left: 0;
        right: 0;
    }
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
</style>
