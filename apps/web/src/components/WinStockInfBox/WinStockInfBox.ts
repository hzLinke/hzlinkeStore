import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinStockInfBoxComponent from './WinStockInfBox.vue'  
import type { StockInfBoxOptions } from './types'

async function show(options: StockInfBoxOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '库存信息',
        width: options.width || 800,
        height: options.height || 400,
        position: options.position || 'center',
        content: WinStockInfBoxComponent,
        ...options
    })
    return result
}

export const WinStockInfBox = {
    show
}

export type { StockInfBoxOptions }
