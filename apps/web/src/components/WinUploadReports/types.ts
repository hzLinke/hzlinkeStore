import { ModalOptions, TableRowDataType } from '@v4x/ui'

export interface UploadReportsOptions extends ModalOptions {
    productCode?: string
    productName?: string
    fileNames?: string
    billNumber?: string

    listDatas?: TableRowDataType[]

}
