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
        <template #headerPanel>
            <div class="hearderPanel">
                <lkx-input class="Input-At"
                    name="startat"
                    :config="startDateState.config"
                    :dropConfig="startDateState.dropConfig"
                    v-model="StartDateCode"
                />
                <lkx-input class="Input-At"
                    name="endat"
                    :config="endDateState.config"
                    :dropConfig="endDateState.dropConfig"
                    v-model="EndDateCode"
                />
                <LkxButton class="opbut" type="default" radius=6 height="30" width="80" caption="应用" IconCls="iconfont iconSearch" @click="handleApplay"></LkxButton>
            </div>
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, useTemplateRef } from 'vue'
import { LkxGrid, LkxButton, LkxInput, MessageBox, InputOptionsType } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TTotalSaleReport } from "./action"
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'

defineOptions({
    name: 'saleReports/TotalSaleReport'
})

const lkxGrid = useTemplateRef('lkxGrid')
const Win = reactive(new TWinForm({}))
const StartDateCode = ref($Util.getMonthFirst())
const EndDateCode = ref($Util.getMonthLast())

const startDateState = ref<InputOptionsType>({
    config: {
        caption: '日期 从',
        captionWidth: 60,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
        }
    }
})

const endDateState = ref<InputOptionsType>({
    config: {
        caption: '到',
        captionWidth: 20,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
        }
    }
})

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/reports/SaleReports/TotalSaleReport/',
        KeyFieldName: 'at',
        NotAllowOperationList: [],
        getParmars: {
            totalFieldSql: `count(at) as count,
                                sum(Num) as Num,sum(CostMoney) as CostMoney,
                                sum(SaleMoney) as SaleMoney,sum(ProFit) as ProFit`
        }
    })
)

const gridAction = reactive(new TTotalSaleReport(dataSource, Win))

const handleApplay = async () => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/reports/SaleReports/TotalSaleReport/', 'buildReport', {
        StartAt: StartDateCode.value,
        EndAt: EndDateCode.value,
        IsExtend: 0
    })
    if (res.errCode == 0) {
        gridAction.openSerarchWin()
    }
    MessageBox.closeAllLoading()
}

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
})
</script>

<style lang="scss" scoped>
.hearderPanel {
    display: flex;
    align-items: center;
    height: 40px;
    padding: 3px 20px;
    margin-bottom: 1px;
    border-bottom: 1px solid #bcbcc7;

    .Input-At {
        width: 200px;
    }

    input {
        outline-color: blue;
    }

    .opbut {
        margin-left: 20px;
    }
}
</style>
