export interface SearchBoxFieldItem {
    caption: string
    fieldName: string
    filterType: string
    inList?: any[]
    keyFieldName?: string
    displayFieldName?: string
    displayFields?: string
}

export interface SearchBoxProps {
    rowData?: any
    config?: SearchBoxConfigType
}

export interface SearchBoxConfigType {
    [propName: string]: any
    open?: boolean
    title?: string
    hideFooter?: boolean
    width?: string
    height?: string
    maskClosable?: boolean
    zIndex?: number
    handleClose?(data: object): void
    fields?: SearchBoxFieldItem[]
}
