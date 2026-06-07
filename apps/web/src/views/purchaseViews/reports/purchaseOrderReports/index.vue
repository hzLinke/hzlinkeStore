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
import { reactive, ref, onMounted } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TUserGridAction } from "./action"

defineOptions({
    name: 'reports/purchaseOrderReports'
})

const lkxGrid = ref<null | HTMLElement>(null)
const Win = reactive(new TWinForm({}))
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/purchase/reports/purchaseOrderReports/',
        KeyFieldName: 'deliveryAt',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: 'count(productcode) as count,sum(numEx) as Num,sum(sumMoney) as sumMoney' }
    })
)
const gridAction = reactive(new TUserGridAction(dataSource, {detailDataSource: null}))

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
