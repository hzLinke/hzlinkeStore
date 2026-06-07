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
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <ToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "handleToolsBarItemClick"/>
                <lkx-input class="printStyle-input"
                    name="ElPrintStyleInput"
                    :config="gridDetailAction.PrintStyleState.config"
                    :dropConfig="gridDetailAction.PrintStyleState.dropConfig"
                    v-model="gridDetailAction.SelectPrintStyleCode"
                />
            </div>
        </template>
    </LkxGrid>
     <img v-if="detailVisabled&&headerData.mrusercode!=0" class="updatePng" src="../../../assets/fh.png" />
    <img v-if="detailVisabled&&headerData.mrusercode!=0&&headerData.over!=0" class="payPng" src="../../../assets/fk.png" />
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, watch, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { LkxInput } from '@v4x/ui'
import { LkxToolsBar as ToolsBar } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction } from "./action"
import type { PurchaseReturnInstanceRefs } from './types'
import {useAppStore} from '@/stores'
const appStore = useAppStore()

defineOptions({
    name: 'purchaseReturn'
})
const lkxGrid = ref<null | HTMLElement>(null)
const lkxDetailGrid = ref<null | HTMLElement>(null)
const userCode = appStore.loginDatas.idcode
const detailVisabled = ref(false)
const headerDisabled = ref(false)
const headerData = ref<Record<string, any>>({})

const listDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/purchaseReturn/BillList/',
            KeyFieldName: 'billNumber',
            NotAllowOperationList: [],
            getParmars: { totalFieldSql: 'count(billnumber) as count,sum(costMoney) as costMoney' }
        }
    )
)
const detailDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/purchaseReturn/BillDetail/',
            KeyFieldName: 'IdKey',
            NotAllowOperationList: [],
            getParmars: { sortFields: 'IdKey', pageSize: 0 }
        }
    )
)

const instanceRefs = markRaw<PurchaseReturnInstanceRefs>({
    detailVisabled,
    headerData,
    headerDisabled,
    userCode,
    detailDataSource
})

const Win = reactive(new TWinForm<PurchaseReturnInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))
gridDetailAction.instanceRefs.headerGridAction = gridAction

const headerConfig = ref<HeaderConfigType>({
    disabled: false,
    items: [
        [
            {
                fieldName: 'shippercode',
                span: 5,
                config: {
                    caption: '货商', 
                    captionAlign: 'right',
                    disabled: () => headerDisabled.value,
                    align: 'left',
                    inputType: 'drop',
                    onChange: (data: any) => {
                        gridAction.dataSource.setFieldValue('shippercode', data.idcode)
                    }
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: true,
                    dropListPosition: {},
                    resultFieldName: 'idcode',
                    displayFieldName: 'name',
                    displayFields: 'idcode|shortname|name',
                    displayFieldWidths: '50|100|300',
                    dropListDatas: gridAction.commonDatas.ShipperDatas,
                    onFilter: (filterValue: string, dropListDatas: any[]) => {
                        return dropListDatas.filter((item: any) => {
                            return item.shortname.indexOf(filterValue) != -1 || item.name.indexOf(filterValue) != -1
                        })
                    }
                }
            },
            {
                fieldName: 'mrusercode',
                span: 3,
                config: {
                    caption: '退货', 
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
                    caption: '退货日', 
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
                    disabled: () => headerDisabled.value,
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

Win.getPrintStyle().then((res) => {
    gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res
})

const handleToolsBarItemClick = (data: any) => {
    gridDetailAction.ToolsBarItemClick(data)
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
