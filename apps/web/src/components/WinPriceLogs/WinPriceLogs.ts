import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinPriceLogsComponent from './WinPriceLogs.vue'  
import type { PriceLogsOptions } from './types'

async function show(options: PriceLogsOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '价格日志',
        width: options.width || 800,
        height: options.height || 400,
        position: options.position || 'center',
        content: WinPriceLogsComponent,
        ...options
    })
    return result
}

export const WinPriceLogs = {
    show
}

export type { PriceLogsOptions }
