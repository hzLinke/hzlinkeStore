<template>
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
    >
        <template #expand>
            <div class="expand-body">
                <LkxGrid ref='lkxPackGrid' class="grid" 
                    :columns="gridDetailAction.Columns" 
                    :dataSource="gridDetailAction.dataSource" 
                    :gridAction="gridDetailAction"
                    :methods="gridDetailAction.Methods" 
                    :events="gridDetailAction.Events"
                    :tableConfig="gridDetailAction.TableConfig"
                    :modelConfig="gridDetailAction.ModelConfig"
                    :serachBoxConfig="gridDetailAction.SerachBoxConfig"
                    :pagerConfig="gridDetailAction.PagerConfig"
                    :reportDesignConfig="gridDetailAction.ReportDesignConfig"
                    :power="gridDetailAction.PowerList"
                    :loading="gridDetailAction.Loading"
                    :loadText="gridDetailAction.LoadText"
                />
            </div>
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, markRaw } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TListGridAction, TDetailGridAction } from "./action"
import type { PayReportsInstanceRefs } from './types'
import useAppStore from '@/stores'

defineOptions({
    name: 'reports/payReports'
})

const appStore = useAppStore()
const { idcode: userCode } = appStore.loginDatas

const lkxGrid = ref<null | HTMLElement>(null)
const lkxPackGrid = ref<null | HTMLElement>(null)

const instanceRefs = markRaw<PayReportsInstanceRefs>({
    userCode: userCode
})

const Win = reactive(new TWinForm<PayReportsInstanceRefs>(instanceRefs))

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/finance/reports/payReports/',
        KeyFieldName: 'billNumber',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: 'count(billNumber) as count,sum(Money) as Money' }
    })
)

const detailDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/finance/reports/payReports/',
        KeyFieldName: 'IdKey',
        NotAllowOperationList: [],
        getParmars: { sortFields: 'IdKey', pageSize: 0 }
    })
)

const gridAction = reactive(new TListGridAction(dataSource, instanceRefs))
const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs))

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})
</script>

<style lang="scss" scoped>
.expand-body {
    margin-top: 2px;
    margin-left: 5px;
    height: 200px;
    overflow: hidden;
    position: relative;
    border-top: 1px solid $table-line-color;
    border-left: 1px solid $table-line-color;
}

.grid {
    position: absolute;
    left: 0;
    right: 0;
}
</style>
