import { ModalOptions } from '@v4x/ui'
import type { ModalResultValue } from '@v4x/ui'

export interface TransferShipperOptions extends ModalOptions {
    defaultShipperCode?: number|string
    defaultCostPrice?: number|string
    defaultNum?: number|string
    allowChangeNum?: boolean
}
