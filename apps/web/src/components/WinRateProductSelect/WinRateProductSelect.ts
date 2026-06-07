import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinRateProductSelectComponent from './WinRateProductSelect.vue'  
import type { RateProductSelectOptions } from './types'

async function show(options: RateProductSelectOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '产品选择',
        width: options.width || 600,
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinRateProductSelectComponent,
        ...options
    })
    return result
}

export const WinRateProductSelect = {
    show
} 

export type { RateProductSelectOptions }

