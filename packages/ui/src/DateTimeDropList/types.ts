export interface DateTimeDropListPosition {
    top: number
    left: number
    width: number
    height: number
}

export interface DateTimeDropListProps {
    dropListPosition?: DateTimeDropListPosition
    date?: string
    showTime?: boolean
}
