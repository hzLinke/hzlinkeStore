<template>
    <div class="grid-container">
        <LkxGrid ref='lkxGrid' class="grid" 
            :columns="gridAction.Columns" 
            :dataSource="dataSource" 
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
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, getCurrentInstance, onMounted, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { StockInfBoxOptions, StockInfBoxInstanceRefs } from './types'

defineOptions({
    name: 'WinStockInfBox'
})

const props = withDefaults(defineProps<StockInfBoxOptions>(), {
    width: 800,
    height: 400
})

const lkxGrid = ref<null | HTMLElement>(null)
const ApiPath = '/masterApi/disApi/stocks/stock/'

const instanceRefs = markRaw<StockInfBoxInstanceRefs>({

})

const dataSource = reactive(
    new TDataSource({
        ApiPath: ApiPath,
        KeyFieldName: 'ProductCode',
        NotAllowOperationList: [],
        getParmars: {
            pageSize: 20,
            condition: `productcode=${props.productCode} AND qualityGrade=${props.qualityGrade}`
        }
    })
)

const gridAction = reactive(new TAction(dataSource, instanceRefs))

const parentInstance = getCurrentInstance()?.parent

onMounted(() => {
    gridAction.open()
})
</script>

<style lang="scss" scoped>
.grid-container {
    position: relative;
    margin: 2px;
}
</style>
