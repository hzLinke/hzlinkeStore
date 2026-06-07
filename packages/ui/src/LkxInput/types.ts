import type { DataSourceType,InputConfigType, InputDropConfigType } from '@v4x/ui'

export interface InputOptionsType {
    span?: number
    fieldName?: string
    placeholder?: string
    modelValue?: string | number
    dataSource?: DataSourceType
    config?: InputConfigType
    dropConfig?: InputDropConfigType
}
