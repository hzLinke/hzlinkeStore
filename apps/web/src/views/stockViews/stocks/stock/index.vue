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
        <template #expand>
            <div class="expand-body">
                <div class="expand-body-waitin">
                    <LkxGrid ref='lkxWaitInGrid' class="grid" 
                        :columns= "gridWaitInAction.Columns" 
                        :dataSource= "waitInDataSource" 
                        :gridAction= "gridWaitInAction"
                        :methods= "gridWaitInAction.Methods" 
                        :events= "gridWaitInAction.Events"
                        :tableConfig= "gridWaitInAction.TableConfig"
                        :serachBoxConfig= "gridWaitInAction.SerachBoxConfig"
                        :pagerConfig= "gridWaitInAction.PagerConfig"
                        :power= "gridWaitInAction.PowerList"
                        :loading = "gridWaitInAction.Loading"
                        :loadText = "gridWaitInAction.LoadText"
                    />
                </div>
                <div class="expand-body-waitout">
                    <LkxGrid ref='lkxWaitOutGrid' class="grid" 
                        :columns= "gridWaitOutAction.Columns" 
                        :dataSource= "waitOutDataSource" 
                        :gridAction= "gridWaitOutAction"
                        :methods= "gridWaitOutAction.Methods" 
                        :events= "gridWaitOutAction.Events"
                        :tableConfig= "gridWaitOutAction.TableConfig"
                        :serachBoxConfig= "gridWaitOutAction.SerachBoxConfig"
                        :pagerConfig= "gridWaitOutAction.PagerConfig"
                        :power= "gridWaitOutAction.PowerList"
                        :loading = "gridWaitOutAction.Loading"
                        :loadText = "gridWaitOutAction.LoadText"
                    />
                </div>
            </div>
        </template>
    </LkxGrid>  
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TStockGridAction, TWaitInkGridAction, TWaitOutkGridAction } from "./action"
import { useRouter } from "vue-router"
import type { StockInstanceRefs } from './types'

defineOptions({
    name: 'stocks/stock'
})

const lkxGrid = ref<null | HTMLElement>(null)
const router = useRouter()

const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/stock/',
            KeyFieldName: 'productcode',
            NotAllowOperationList: [],
            getParmars: {
                totalFieldSql: 'count(ProductCode) as count,sum(Num) as Num,sum(RuningNum) as RuningNum,sum(WaitInNum) as WaitInNum,sum(WaitOutNum) as WaitOutNum,sum(Num+WaitInNum-WaitOutNum) as AllowedNum,sum(SumMoney) as SumMoney'
            }
        }
    )
)
const waitOutDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/stockWaitOut/',
            KeyFieldName: 'productcode',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)
const waitInDataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/stockWaitIn/',
            KeyFieldName: 'productcode',
            NotAllowOperationList: [],
            getParmars: {}
        }
    )
)

const instanceRefs = markRaw<StockInstanceRefs>({
    router: router,
    detailDataSource: dataSource,
    userCode: 0
})

const Win = reactive(new TWinForm<StockInstanceRefs>(instanceRefs))
const gridAction = reactive(new TStockGridAction(dataSource, instanceRefs))
const gridWaitInAction = reactive(new TWaitInkGridAction(waitInDataSource, instanceRefs))
const gridWaitOutAction = reactive(new TWaitOutkGridAction(waitOutDataSource, instanceRefs))
gridAction.instanceRefs.gridWaitInAction = gridWaitInAction
gridAction.instanceRefs.gridWaitOutAction = gridWaitOutAction

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
