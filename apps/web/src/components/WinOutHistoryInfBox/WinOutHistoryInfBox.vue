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
import { ref, reactive, getCurrentInstance, onMounted } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import { OutHistoryInfBoxOptions } from './types'

defineOptions({
    name: 'WinOutHistoryInfBox'
})
const props = withDefaults(defineProps<OutHistoryInfBoxOptions>(), {
    width: 850,
    height: 400
})
const lkxGrid = ref<null | HTMLElement>(null)

const ApiPath = '/masterApi/disApi/sales/reports/saleReports/'

const dataSource = reactive(
    new TDataSource({
        ApiPath: ApiPath ,
        KeyFieldName: 'deliveryAt',
        NotAllowOperationList: [],
        getParmars: { 
            sortFields: 'deliveryAt desc',
            pageSize: 20,
            condition: `productCode = ${props.productCode} AND qualityGrade = ${props.qualityGrade}`
        }
    })
)

const gridAction = reactive(new TAction(dataSource, {}))

onMounted(() => {
    gridAction.open()
})
</script>

<style lang="scss" scoped>
.grid-container {
    height: 100%;
    overflow: hidden;
    
}

.grid {
    padding: 2px;
    height: 100%;
}
</style>
