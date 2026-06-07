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
                    v-model="StartDateCode"
                />
                <lkx-input class="Input-At"
                    name="endat"
                    :config="endDateState.config"
                    v-model="EndDateCode"
                />
                <lkx-input class="Area-input"
                    :config="AreaState.config"
                    :dropConfig="AreaState.dropConfig"
                    v-model="AreaCode"
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
import { TProductInOutReport } from "./action"
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'

defineOptions({
    name: 'InoutReports/ProductInOutReport'
})

const lkxGrid = useTemplateRef('lkxGrid')
const Win = reactive(new TWinForm({}))
const MaxGroupAt = ref($Util.getDate())
const AreaCode = ref(0)
const StartDateCode = ref($Util.getMonthFirst())
const EndDateCode = ref($Util.getMonthLast())


const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/reports/InOutReports/ProductInOutReport/',
        KeyFieldName: 'productcode',
        NotAllowOperationList: [],
        getParmars: {
            totalFieldSql: `count(productcode) as count,
                                sum(StartNum) as StartNum,sum(StartMoney) as StartMoney,
                                sum(PurchaseNum) as PurchaseNum,sum(PurchaseMoney) as PurchaseMoney,
                                sum(SaleNum) as SaleNum,sum(SaleMoney) as SaleMoney,
                                sum(StockSwapNum) as StockSwapNum,sum(StockSwapMoney) as StockSwapMoney,
                                sum(StockChangeNum) as StockChangeNum,sum(StockChangeMoney) as StockChangeMoney,
                                sum(StockReceiveNum) as StockReceiveNum,sum(StockReceiveMoney) as StockReceiveMoney,
                                sum(DiffNum) as DiffNum,sum(DiffMoney) as DiffMoney,
                                sum(EndNum) as EndNum,sum(EndMoney) as EndMoney`
        }
    })
)

const gridAction = reactive(new TProductInOutReport(dataSource, Win))


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

const AreaState = ref<InputOptionsType>({
    config: {
        caption: '仓位',
        captionWidth: 40,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '50|200',
        dropListDatas: gridAction.commonDatas.AreaDatas
    }
})

const handleApplay = async () => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/reports/InOutReports/ProductInOutReport/', 'buildReport', {
        StartAt: StartDateCode.value,
        EndAt: EndDateCode.value,
        AreaCode: AreaCode.value,
        IsExtend: 0
    })
    if (res.errCode == 0) {
        gridAction.openSerarchWin()
    }
    MessageBox.closeAllLoading()
}

const handleEnDateChange = (e: any) => {
    const _selectAt = (e.target as HTMLInputElement).value
    if (_selectAt > MaxGroupAt.value) {
        EndDateCode.value = MaxGroupAt.value
    }
}

$api.getData('/masterapi/publicApi/', { tableName: 'V_GroupMaxAt', fields: 'At', sortFields: 'At' })
    .then((rs) => {
        if (rs.datas[0].at) {
            MaxGroupAt.value = $Util.getDate('d', -1, 'yyyy-MM-dd', rs.datas[0].at)
            EndDateCode.value = MaxGroupAt.value
            StartDateCode.value = $Util.getMonthFirst(EndDateCode.value)
        }
    })

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
})
</script>

<style lang="scss" scoped>
.grid {
    position: absolute;
    left: 0;
    right: 0;
}

.hearderPanel {
    display: flex;
    align-items: center;
    height: 40px;
    padding: 3px 20px;

    .Input-At {
        width: 200px;
    }

    .Area-input {
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
