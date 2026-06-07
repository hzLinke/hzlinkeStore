import type { TableColumnsType, TableMethodsType, TableEventsType, DataSourceType, TableConfigType, ToolsBarConfigType,  PagerConfigType } from '@v4x/ui'
import type { SearchBoxConfigType } from '../SearchWin/types'

export interface GridProps {
    columns?: TableColumnsType[]
    power?: {
        allowedExport: boolean
        allowedSaveStyle: boolean
        allowedClearStyle: boolean
        allowedCancelCol: boolean
        allowedRecoveryCol: boolean
        allowedTableSet: boolean
    }
    dataSource?: DataSourceType
    gridAction?: any
    printConfig?: any
    headerData?: any
    loading?: boolean
    loadText?: string
    methods?: TableMethodsType
    events?: TableEventsType
    tableConfig?: TableConfigType
    toolsBarConfig?: ToolsBarConfigType  
    serachBoxConfig?: SearchBoxConfigType
    pagerConfig?: PagerConfigType
}
