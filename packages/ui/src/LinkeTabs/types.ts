export interface TabItem {
    idcode: number
    title: string
    iconcls?: string
}

export interface TabsProps {
    defaultValue?: string | number
    tabList?: TabItem[]
    closeBut?: boolean
}
