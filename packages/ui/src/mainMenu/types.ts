export interface MenuDataType {
    id?: string | number
    name?: string
    title?: string
    path?: string
    url?: string
    icon?: string
    children?: MenuDataType[],
    level?: number
    [key: string]: unknown
}


export interface MainMenuProps {
    nemuDatas?: MenuDataType[]
    defaultActiveIndex?: number
    direction?: string
    itemClick?: (item: MenuDataType) => void
}

