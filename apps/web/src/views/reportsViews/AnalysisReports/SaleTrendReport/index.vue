<template>
    <div class="winBody" ref="WinBox" @keydown="handleKeyDown" :tabindex="1">
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
            <select v-model="selected" @change="handleSelectChange">
                <option value="line">线型</option>
                <option value="bar">柱型</option>
            </select>
            <LkxButton class="opbut" type="default" radius=6 height="30" width="80" caption="应用" IconCls="iconfont iconSearch" @click="handleApplay"></LkxButton>
        </div>
        <div class="ReportBody">
            <div class="EchartsBody">
                <LkxEcharts class="Echarts" :legendData="legendData" :xAxisData="xAxisData" :seriesData="seriesData"/>
            </div>
            <div class="ReportsInfo">
                <div class="ReportsInfo-List">
                    <div>今日数据</div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 客单数：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(toDayDatas.length>0?toDayDatas[0].billnumbernum:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 销售额：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(toDayDatas.length>0?toDayDatas[0].salemoney:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 毛利：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(toDayDatas.length>0?toDayDatas[0].profit:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 采购额：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(toDayDatas.length>0?toDayDatas[0].purchasemoney:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 配货率：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(toDayDatas.length>0?toDayDatas[0].disrate:0)+'%'}}</div>
                    </div>
                </div>
                <div class="ReportsInfo-List">
                    <div>昨日数据</div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 客单数：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(yesterDayDatas.length>0?yesterDayDatas[0].billnumbernum:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 销售额：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(yesterDayDatas.length>0?yesterDayDatas[0].salemoney:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 毛利：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(yesterDayDatas.length>0?yesterDayDatas[0].profit:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 采购额：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(yesterDayDatas.length>0?yesterDayDatas[0].purchasemoney:0)}}</div>
                    </div>
                    <div class="ReportsInfo-List-item">
                        <div class="ReportsInfo-List-note"> 配货率：</div>
                        <div class="ReportsInfo-List-data"> {{clearDecimal(toDayDatas.length>0?toDayDatas[0].disrate:0)+'%'}}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, nextTick } from 'vue'


import { TWinForm } from "@/usehook/win"
import { InputOptionsType, LkxButton,LkxEcharts } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'
import { clearDecimal } from '@v4x/utils'
import { MessageBox } from '@v4x/ui'

defineOptions({
    name: 'AnalysisReports/SaleTrendReport'
})

const WinBox = ref<null | HTMLElement>(null)
const Win = reactive(new TWinForm({}))
const selected = ref('line')
const StoreCode = ref(1)
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

const toDayDatas = ref(<any>[])
const yesterDayDatas = ref(<any>[])

const legendData = ['销售额', '毛利', '客单数', '采购额']
const xAxisData = ref([] as any)
const seriesData = reactive([
    {
        data: [] as any,
        type: "line",
        name: '销售额',
    },
    {
        data: [] as any,
        type: "line",
        name: '毛利',
    },
    {
        data: [] as any,
        type: "line",
        name: '客单数',
    },
    {
        data: [] as any,
        type: "line",
        name: '采购额',
    }
])

const handleApplay = async () => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/reports/AnalysisReports/SaleTrendReport/', 'buildReport', {
        StartAt: StartDateCode.value,
        EndAt: EndDateCode.value,
        StoreCode: StoreCode.value,
        IsExtend: 0
    })
    if (res.errCode == 0) {
        xAxisData.value = []
        seriesData[0].data = []
        seriesData[1].data = []
        seriesData[2].data = []
        seriesData[3].data = []
        const rs = await $api.comonRequest('/masterApi/disApi/reports/AnalysisReports/SaleTrendReport/', 'get', {})
        if (rs.errCode == 0 && rs.datas.length != 0) {
            rs.datas.forEach((item: any) => {
                xAxisData.value.push($Util.getDatePart('D', item.at) + '号')
                seriesData[0].data.push(item.salemoney)
                seriesData[1].data.push(item.profit)
                seriesData[2].data.push(item.billnumbernum)
                seriesData[3].data.push(item.purchasemoney)
            })
        }
        const rToDay = await $api.comonRequest('/masterApi/disApi/reports/AnalysisReports/SaleTrendTodyReport/', 'get', {})
        if (rToDay.errCode == 0 && rToDay.datas.length != 0) {
            toDayDatas.value = rToDay.datas.filter((item: any) => {
                return item.at == $Util.getDate('none', 0, 'yyyy-MM-dd')
            })

            yesterDayDatas.value = rToDay.datas.filter((item: any) => {
                return item.at == $Util.getDate('d', -1, 'yyyy-MM-dd')
            })
        }
    }
    MessageBox.closeAllLoading()
}

const handleSelectChange = () => {
    seriesData.map(item => {
        item.type = selected.value
    })
}

const handleKeyDown = (e: KeyboardEvent) => {
    if (e.key == 'Escape') {
        Win.closeWin()
    }
}

nextTick(() => {
    (WinBox.value as HTMLDivElement).focus()
    handleApplay()
})
</script>

<style lang="scss" scoped>
.winBody {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
}

.ReportBody {
    display: flex;
    flex-direction: row;
    width: 100%;
    height: 100%;

    .EchartsBody {
        flex: 1;
        display: flex;

        .Echarts {
            flex: 1;
        }
    }

    .ReportsInfo {
        width: 200px;
        display: flex;
        flex-direction: column;
        margin-right: 10px;
        margin-top: 30px;

        .ReportsInfo-List {
            div {
                padding-top: 5px;
            }

            width: 200px;
            height: 180px;
            margin-bottom: 5px;
            border: 1px solid blue;
            border-radius: 10px;
            display: flex;
            flex-direction: column;

            .ReportsInfo-List-item {
                display: flex;
                flex: 1;

                .ReportsInfo-List-note {
                    padding-left: 30px;
                    width: 80px;
                }

                .ReportsInfo-List-data {
                    flex: 1;
                    text-align: right;
                    margin-right: 10px;
                }
            }
        }
    }
}

.hearderPanel {
    display: flex;
    align-items: center;
    height: 40px;
    padding: 3px 20px;
    border-bottom: 1px solid #eeee;

    .Input-At {
        width: 200px;
    }

    input,
    select {
        outline-color: blue;
    }

    select {
        height: 30px;
        margin-left: 10px;
        width: 100px;
    }

    .opbut {
        margin-left: 20px;
    }
}
</style>
