<template>
    <div class="winBody" ref="WinBox" @keydown="handleKeyDown" tabindex="1">
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
            <select v-model="selected" @change="handleSelectChange">
                <option value="line">线型</option>
                <option value="bar">柱型</option>
            </select>
            <LkxButton class="opbut" type="default" radius=6 height="30" width="80" caption="应用" IconCls="iconfont iconSearch" @click="handleApplay"></LkxButton>
        </div>
        <LkxEcharts class="Echarts" :legendData="legendData" :xAxisData="xAxisData" :seriesData="seriesData"/>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, nextTick } from 'vue'

import { TWinForm } from "@/usehook/win"
import { InputOptionsType, LkxButton,LkxEcharts } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'
import { MessageBox } from '@v4x/ui'

defineOptions({
    name: 'AnalysisReports/MonMReport'
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
        onChange: (_data: any) => {
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
        onChange: (_data: any) => {
        }
    }
})

const legendData = ['销售额', '毛利']
const xAxisData = ref([] as any)
const seriesData = ref([
    {
        data: [] as any[],
        type: "line" as const,
        name: '销售额'
    },
    {
        data: [] as any[],
        type: "line" as const,
        name: '毛利',
    }
])

const handleApplay = async () => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/reports/AnalysisReports/MonMReport/', 'buildReport', {
        StartAt: StartDateCode.value,
        EndAt: EndDateCode.value,
        StoreCode: StoreCode.value,
        IsExtend: 0
    })
    if (res.errCode == 0) {
        const rs = await $api.comonRequest('/masterApi/disApi/reports/AnalysisReports/MonMReport/', 'get', {})
        if (rs.errCode == 0 && rs.datas.length != 0) {
            xAxisData.value = []
            seriesData.value[0].data = []
            seriesData.value[1].data = []
            rs.datas.forEach((item: any) => {
                xAxisData.value.push($Util.getDatePart('D', item.at) + '号')
                seriesData.value[0].data.push(item.salemoney)
                seriesData.value[1].data.push(item.profit)
            })
        }
    }
    MessageBox.closeAllLoading()
}

const handleSelectChange = () => {
    seriesData.value.forEach(item => {
        (item as any).type = selected.value
    })
}

const handleKeyDown = (e: KeyboardEvent) => {
    if (e.key == 'Escape') {
        Win.closeWin()
    }
}

nextTick(() => {
    (WinBox.value as HTMLDivElement).focus()
})
</script>

<style lang="scss" scoped>
.winBody {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
}

.Echarts {
    flex: 1;
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
