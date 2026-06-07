export interface ColProps {
    span?: number | string
    offset?: number | string
    ipad?: ResponsiveConfig
    narrowPc?: ResponsiveConfig
    pc?: ResponsiveConfig
    widePc?: ResponsiveConfig
}

export interface ResponsiveConfig {
    span?: number | string
    offset?: number | string
}
