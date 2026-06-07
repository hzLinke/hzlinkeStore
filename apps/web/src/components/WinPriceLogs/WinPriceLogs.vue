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
import { PriceLogsOptions, PriceLogsInstanceRefs } from './types'

defineOptions({
    name: 'WinPriceLogs'
})

const props = withDefaults(defineProps<PriceLogsOptions>(), {
    width: 800,
    height: 400,
    customerCode: 0,
    productCode: '',
    saleType: 0
})

const lkxGrid = ref<null | HTMLElement>(null)

const instanceRefs = markRaw<PriceLogsInstanceRefs>({
})

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/PublicApi/',
        KeyFieldName: 'productCode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const gridAction = reactive(new TAction(dataSource, instanceRefs))
gridAction.getParams = {
    procName: 'Sp_GetPriceLogs',
    procParmars: {
        customerCode: props.customerCode,
        productCode: props.productCode,
        saleType: props.saleType
    }
}

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
