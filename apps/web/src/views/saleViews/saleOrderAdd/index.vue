<template>
    <LkxGrid ref='lkxDetailGrid' class="grid" 
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
        :printConfig= "gridDetailAction.PrintConfig"
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <LkxToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "gridDetailAction.ToolsBarItemClick($event)"/>
            </div>
        </template>
    </LkxGrid>
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, markRaw,useTemplateRef } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { LkxGrid, LkxToolsBar } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TDetailGridAction } from "./action"
import type { SaleOrderAddInstanceRefs } from './types'
import {useAppStore} from '@/stores'

const appStore = useAppStore()

defineOptions({
    name: 'saleOrderAdd'
})
const lkxDetailGrid = useTemplateRef('lkxDetailGrid')

const userCode = appStore.loginDatas.idcode;

const headerDisabled = ref(false)

const detailDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/sales/saleOrderAdd/',
            KeyFieldName: 'IdKey',
            NotAllowOperationList: [],
            getParmars: { sortFields: 'IdKey', pageSize: 0, mustCondition: `UserCode=${userCode}` }
        })
)

const diff = $Utils.getDatePart('h') >= 12 ? 1 : 0
const headerData = ref({ customercode: 0, deliveryat: $Utils.getDate('d', diff), billtype: 17 } as any)

const instanceRefs = markRaw<SaleOrderAddInstanceRefs>({
    headerData,
    userCode,
    detailDataSource: detailDataSource
})

const Win = reactive(new TWinForm(instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))

const headerConfig = ref<HeaderConfigType>({
    disabled: false,
    items: [
        [
            {
                fieldName: 'customercode',
                span: 6,
                config: {
                    caption: '客户',
                    captionAlign: 'right',
                    disabled: () => { return headerDisabled.value },
                    align: 'left',
                    inputType: 'drop',
                    onChange: (data: any) => {
                        headerData.value.customercode = data.idcode
                        headerData.value.downunittype = data.downunittype
                        headerData.value.dr = data.dr
                        headerData.value.decimalbit = data.decimalbit
                        headerData.value.salefromquoteprice = data.salefromquoteprice
                        headerData.value.qualitygrade = data.qualitygrade
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
                    dropListDatas: gridDetailAction.commonDatas.CustomerDatas,
                    onFilter: (filterValue: string, dropListDatas: any[]) => {
                        return dropListDatas.filter((item: any) => {
                            return item.shortname.indexOf(filterValue) != -1 || item.name.indexOf(filterValue) != -1
                        })
                    }
                }
            },
            {
                fieldName: 'deliveryat',
                span: 5,
                config: {
                    caption: '送货日',
                    captionAlign: 'right',
                    captionWidth: 55,
                    align: 'left',
                    disabled: () => { return headerDisabled.value },
                    inputType: 'datetime',
                    onChange: (data: any) => {
                        headerData.value.deliveryat = data
                    }
                }
            }
        ]
    ]
})

const config = reactive({
    title: '选择复制日期',
    width: '800px',
    height: '350px',
    open: false,
    handleClose: (data: any) => {
        config.open = false
        if (data.type == 'mrOk' && data.datas != 0) {
            gridDetailAction.foodMenuCopy(data.datas.customerCode, data.datas.copyAt)
        }
    }
})

onMounted(() => {
    Win.switchGrid(false, gridDetailAction, lkxDetailGrid as any)
    Win.ActiveGridAction?.open()
})
</script>

<style lang="scss" scoped>
.funcToolsBar {
    display: flex;
    flex-direction: row;
    border-bottom: 1px solid #eeee;
    align-items: center;
    height: 40px;
    .toolsBar {
        padding-left: 30px;
        background-color: white;
        width: 650px;
    }
    .printStyle-input {
        width: 300px;
    }
}
</style>
