export interface ToolsBarItemType {
    title: string
    idCode: string
    index: number
    iconCls?: string
    dropDown?: boolean
    Separate?: boolean
}

export interface ToolsBarProps {
    toolsBarItems: ToolsBarItemType[]
    showIcon?: boolean
}
