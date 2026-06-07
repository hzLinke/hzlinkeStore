import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinOrderQrCodeComponent from './WinOrderQrCode.vue'
import type { OrderQrCodeOptions } from './types'

async function show(options: OrderQrCodeOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '订单二维码',
        width: options.width || 300,
        height: options.height || 350,
        position: options.position || 'center',
        content: WinOrderQrCodeComponent,
        ...options
    })
    return result
}

export const WinOrderQrCode = {
    show
}

export type { OrderQrCodeOptions }
