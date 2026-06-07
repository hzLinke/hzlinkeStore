<template>
    <LkxGrid ref='lkxGrid' class="grid" 
        :columns= "gridAction.Columns" 
        :dataSource= "dataSource" 
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
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TstockAreaSwapReoprtGridAction } from "./action"
import type { StockAreaSwapReportInstanceRefs } from './types'

defineOptions({
    name: 'reports/stockAreaSwapReport'
})
const lkxGrid = ref<null | HTMLElement>(null)
const instanceRefs = markRaw<StockAreaSwapReportInstanceRefs>({detailDataSource: null})
const Win = reactive(new TWinForm<StockAreaSwapReportInstanceRefs>(instanceRefs))
const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/Reports/stockAreaSwapReport/',
            KeyFieldName: 'deliveryAt',
            NotAllowOperationList: [],
            getParmars: { totalFieldSql: 'count(productcode) as count,sum(num) as num,sum(SumMoney) as SumMoney' }
        }
    )
)
const gridAction = reactive(new TstockAreaSwapReoprtGridAction(dataSource, instanceRefs))

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})
</script>

<style lang="scss" scoped>
 .grid{
        position: absolute;
            left: 0;
            right: 0;
        }
</style>
