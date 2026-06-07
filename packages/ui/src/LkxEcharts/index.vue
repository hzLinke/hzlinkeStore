<template>
    <div ref="echartsBox" class="echarts-box">
        <div ref="myEcharts" class="echarts"></div>
    </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, ref, watch } from 'vue'
import * as echarts from 'echarts'
import type { EChartsOption, SeriesOption } from 'echarts'

interface Props {
    title?: string
    legendData?: unknown[]
    xAxisData?: unknown[]
    seriesData?: SeriesOption | SeriesOption[] | any[]
}

const props = withDefaults(defineProps<Props>(), {
    title: '',
    legendData: () => [],
    xAxisData: () => [],
    seriesData: () => []
})

const echartsBox = ref<HTMLElement | null>(null)
const myEcharts = ref<HTMLElement | null>(null)
let chart: echarts.ECharts | null = null

const chartsSize = () => {
    if (!echartsBox.value || !myEcharts.value) return
    const containerStyle = window.getComputedStyle(echartsBox.value)
    myEcharts.value.style.width = containerStyle.width
    myEcharts.value.style.height = containerStyle.height
}

const chartDraw = (_chart: echarts.ECharts) => {
    const option: EChartsOption = {
        title: {
            text: props.title,
            left: 'center'
        },
        legend: {
            icon: 'circle',
            itemWidth: 10,
            itemHeight: 10,
            itemGap: 40,
            textStyle: {
                color: '#000'
            },
            data: props.legendData as any
        } as any,
        xAxis: {
            type: 'category',
            data: props.xAxisData as any
        } as any,
        tooltip: {
            trigger: 'axis'
        },
        yAxis: {
            type: 'value'
        },
        series: props.seriesData
    }
    _chart.setOption(option)
}

const initChart = () => {
    if (!myEcharts.value) return
    chart = echarts.init(myEcharts.value)
    chartDraw(chart)
}

const handleResize = () => {
    chartsSize()
    chart?.resize()
}

onMounted(() => {
    chartsSize()
    initChart()
    window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
    window.removeEventListener('resize', handleResize)
    chart?.dispose()
    chart = null
})

watch(
    () => props.xAxisData,
    () => {
        chart && chartDraw(chart)
    },
    { deep: true }
)

watch(
    () => props.seriesData,
    () => {
        chart && chartDraw(chart)
    },
    { deep: true }
)
</script>

<style lang="scss" scoped>
.echarts-box {
    width: 100%;
    height: 100%;
}
</style>