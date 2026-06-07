import type { EChartsOption, SeriesOption } from 'echarts'

export interface EchartsProps {
    title?: string
    legendData?: unknown[]
    xAxisData?: unknown[]
    seriesData?: SeriesOption | SeriesOption[] | any[]
}
