import { ModalOptions } from '@v4x/ui'

export interface UploadProductImageOptions extends ModalOptions {
    productCode?: string
    productName?: string
    fileNames?: string
    billNumber?: string
}

