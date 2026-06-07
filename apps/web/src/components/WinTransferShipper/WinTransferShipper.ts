import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinTransferShipperComponent from './WinTransferShipper.vue'
import type { TransferShipperOptions } from './types'

async function show(options: TransferShipperOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '供货商转移',
        width: options.width || 400,
        height: options.height || 230,
        position: options.position || 'center',
        content: WinTransferShipperComponent,
        ...options
    })
    return result
}

export const WinTransferShipper = {
    show
}

export type { TransferShipperOptions }
