<template>
    <LkxGrid ref='lkxGrid' v-show="!detailVisabled" class="grid"
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
                <LkxButton class="opbut" type="default" radius=6 height="30" width="80" caption="应用" IconCls="iconfont iconSearch" @click="handleApplay"></LkxButton>
            </div>
        </template>
    </LkxGrid>
    <LkxGrid v-if="detailVisabled" ref='lkxDetailGrid' class="grid"
        :columns="gridDetailAction.Columns"
        :dataSource="detailDataSource"
        :gridAction="gridDetailAction"
        :methods="gridDetailAction.Methods"
        :events="gridDetailAction.Events"
        :tableConfig="gridDetailAction.TableConfig"
        :serachBoxConfig="gridDetailAction.SerachBoxConfig"
        :pagerConfig="gridDetailAction.PagerConfig"
        :power="gridDetailAction.PowerList"
        :loading="gridDetailAction.Loading"
        :loadText="gridDetailAction.LoadText"
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel">
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, watch, useTemplateRef, markRaw } from 'vue'
import { LkxGrid, LkxButton, LkxInput, MessageBox, InputOptionsType } from '@v4x/ui'
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TCustomerSaleReport, TCustomerDetailSaleReport } from "./action"
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'
import { CustomerSaleReportInstanceRefs } from './types'

defineOptions({
    name: 'saleReports/CustomerSaleReport'
})

const lkxGrid = useTemplateRef('lkxGrid')
const lkxDetailGrid = useTemplateRef('lkxDetailGrid')
const detailVisabled = ref(false)
const StartDateCode = ref($Util.getMonthFirst())
const EndDateCode = ref($Util.getMonthLast())
const headerData = ref<Record<string, any>>({})

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
        ApiPath: '/masterApi/disApi/reports/SaleReports/CustomerSaleReport/',
        KeyFieldName: 'CustomerCode',
        NotAllowOperationList: [],
        getParmars: {
            totalFieldSql: `count(CustomerCode) as count,
                                sum(Num) as Num,sum(CostMoney) as CostMoney,
                                sum(SaleMoney) as SaleMoney,sum(ProFit) as ProFit`
        }
    })
)

const detailDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/reports/SaleReports/CustomerSaleReport/detailSaleReport/',
        KeyFieldName: 'productCode',
        NotAllowOperationList: [],
        getParmars: {
            sortFields: 'productCode',
            totalFieldSql: `count(productcode) as count,
                                sum(Num) as Num,sum(CostMoney) as CostMoney,
                                sum(SaleMoney) as SaleMoney,sum(ProFit) as ProFit`
        }
    })
)
const instanceRefs = markRaw<CustomerSaleReportInstanceRefs>({
    headerData,
    detailVisabled,
    StartDate: StartDateCode,
    EndDate: EndDateCode
})

const Win = reactive(new TWinForm(instanceRefs))
const gridAction = reactive(new TCustomerSaleReport(dataSource, instanceRefs))
const gridDetailAction = reactive(new TCustomerDetailSaleReport(detailDataSource, instanceRefs))

const headerConfig = ref<HeaderConfigType>({
    disabled: false,
    items: [
        [
            {
                fieldName: 'customercode',
                span: 10,
                config: {
                    caption: '客户',
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'drop',
                },
                dropConfig: {
                    allowInput: false,
                    allowFilter: true,
                    dropListPosition: {},
                    resultFieldName: 'idcode',
                    displayFieldName: 'name',
                    displayFields: 'idcode|name',
                    displayFieldWidths: '70|300',
                    dropListDatas: gridAction.commonDatas.CustomerDatas,
                }
            },
            {
                fieldName: 'startat',
                span: 4,
                config: {
                    caption: '日期 从',
                    captionWidth: 55,
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'drop',
                }
            },
            {
                fieldName: 'endat',
                span: 4,
                config: {
                    caption: '到',
                    captionWidth: 25,
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'drop',
                }
            }
        ]
    ]
})


const handleApplay = async () => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/reports/SaleReports/CustomerSaleReport/', 'buildReport', {
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

onUpdated(() => {
    Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
})

watch(detailVisabled, (visible) => {
    if (visible) {
        detailDataSource.getParams.sortFields = 'productCode'
        gridDetailAction.PagerConfig.curPage = 1
        gridDetailAction.dataSource.getParams.condition = ''
        gridDetailAction.open()
    } else {
        detailDataSource.close()
    }
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
