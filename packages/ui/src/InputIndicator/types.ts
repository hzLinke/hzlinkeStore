import type { DataSourceType, IndicatorButtonsType, InputDropOptionsType } from '@v4x/ui'

export interface InputIndicatorGridAction {
    commonDatas?: Record<string, any[]>
    beforedEdit?: (rowData: any, fieldName: string) => Promise<boolean>
    afterEdit?: (rowData: any) => void
}

export interface InputIndicatorProps {
    modelValue?: string | number
    inputType?: string
    inputFormat?: string
    dataType?: string
    indicatorButtons?: IndicatorButtonsType[]
    allowInputString?: boolean
    numberFlg?: string
    rowData?: any
    fieldName?: string
    dataSource?: DataSourceType
    gridAction?: InputIndicatorGridAction
    dropListConfig?: Partial<InputDropOptionsType>
}
