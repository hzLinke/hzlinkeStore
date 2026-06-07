import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue } from '@v4x/ui'

export interface OrderQrCodeOptions extends ModalOptions {
    shipperName?: string
    deliveryAt?: string
    qrCodeData?: string
}
