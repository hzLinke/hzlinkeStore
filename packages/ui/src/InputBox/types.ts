import { TableRowDataType } from '@v4x/ui'
import { ModalOptions } from '@v4x/ui'
export interface InputBoxOptions extends ModalOptions {
    title?: string
    description?: string
    note?: string
    cancelText?: string
    confirmText?: string
    abortText?: string
    showCancel?: boolean,
    showAbort?: boolean,
    defaultValue: string | number
    placeholder?: string
    inputType: 'text' | 'number' | 'date' | 'drop'
    dropDataList?: TableRowDataType[]
}
