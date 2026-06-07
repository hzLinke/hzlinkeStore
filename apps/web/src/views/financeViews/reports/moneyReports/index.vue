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
import { TListGridAction } from "./action"
import type { MoneyReportsInstanceRefs } from './types'
import useAppStore from '@/stores'

defineOptions({
    name: 'reports/moneyReports'
})

const appStore = useAppStore()
const { idcode: userCode } = appStore.loginDatas

const lkxGrid = ref<null | HTMLElement>(null)
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/finance/reports/MoneyReports/',
        KeyFieldName: 'at',
        NotAllowOperationList: [],
        getParmars: {totalFieldSql:'count(at) as count,sum(inMoney) as inMoney,sum(outMoney) as outMoney,sum(cMoney) as cMoney'}
    })
)

const instanceRefs = markRaw<MoneyReportsInstanceRefs>({
    userCode: userCode
})

const Win = reactive(new TWinForm<MoneyReportsInstanceRefs>(instanceRefs))
const gridAction = reactive(new TListGridAction(dataSource, instanceRefs))

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})
</script>

<style lang="scss" scoped>
.expand-body{
    margin-top: 2px;
    margin-left: 5px;
    height: 200px;
    overflow: hidden;
    position: relative;
    border-top: 1px solid $table-line-color ;
    border-left: 1px solid $table-line-color ;
}
.grid{
    position: absolute;
    left: 0;
    right: 0;
}
</style>
