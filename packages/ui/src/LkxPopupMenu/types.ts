export interface PopupMenuItem {
    text: string
    iconCls?: string
    [key: string]: any
}

export interface PopupMenuProps {
    items?: PopupMenuItem[]
    pointXy?: {
        left: number
        top: number
    }
    open?: boolean
    cellIndex?: number
    closePopuMenu?: (data?: { item?: PopupMenuItem; cellIndex?: number }) => void
}
