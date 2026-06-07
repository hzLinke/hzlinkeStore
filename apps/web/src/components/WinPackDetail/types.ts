import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue, TableRowDataType } from '@v4x/ui'

export interface PackDetailOptions extends ModalOptions {
    headerDatas?: TableRowDataType
    deliveryAt: string
    billnumber?: string
    productCode: string
    saleType: number|string
    qualityGrade: number|string
    billType: string
    batchNumber?: string,
    showOpt?: boolean,

}
