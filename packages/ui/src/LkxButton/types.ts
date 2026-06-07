export interface ButtonProps {
    type?: 'default' | 'primary' | 'success' | 'danger' | 'warning' | 'info' ;
    caption?: string
    height?: number | string
    width?: number | string
    radius?: number | string
    iconCls?: string
    disabled?: boolean
}
