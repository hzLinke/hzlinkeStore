export interface DropListPosition {
    top: number
    left: number
    width: number
    height: number
}

export interface DropListProps {
    dropListPosition?: DropListPosition
    allowFilter?: boolean
    dropListDatas?: any[]
    fields?: string
    fieldWidths?: string
    groupFieldName?: string
    indentation?: boolean
    filterFunc?: (value: string, data: any[]) => any[]
}
