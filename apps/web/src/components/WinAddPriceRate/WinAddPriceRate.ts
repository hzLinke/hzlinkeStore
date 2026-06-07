import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinAddPriceRateComponent from './WinAddPriceRate.vue'  
import type { AddPriceRateOptions } from './types'

async function show(options: AddPriceRateOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '加价批量设置',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinAddPriceRateComponent,
        ...options
    })
    return result
}

export const WinAddPriceRate = {
    show
}

export type { AddPriceRateOptions }
