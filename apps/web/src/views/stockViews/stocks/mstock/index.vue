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
    >
    </LkxGrid>  
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TStockGridAction } from "./action"
import type { MStockInstanceRefs } from './types'

defineOptions({
    name: 'stocks/mstock'
})

const lkxGrid = ref<null | HTMLElement>(null)
const instanceRefs = markRaw<MStockInstanceRefs>({
    detailDataSource: null
})

const Win = reactive(new TWinForm<MStockInstanceRefs>(instanceRefs))
const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/mstock/',
            KeyFieldName: 'productcode',
            NotAllowOperationList: [],
            getParmars: {
                totalFieldSql: 'count(ProductCode) as count'
            }
        }
    )
)
const gridAction = reactive(new TStockGridAction(dataSource, instanceRefs))

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})
</script>

<style lang="scss" scoped>
.expand-body{
    display: flex;
    margin-top: 2px;
    height: 200px; 
    border-top: 1px solid $table-line-color ;
    border-left: 1px solid $table-line-color ;
    .expand-body-waitin{
        overflow: hidden;
        position: relative;
        width:50%;
        height:100%;
    }
    .expand-body-waitout{
        overflow: hidden;
        position: relative;
        width:50%;
        height:100%;
    }
}
 .grid{
    position: absolute;
    left: 0;
    right: 0;
}
</style>
