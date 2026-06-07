import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinBatchInSelectComponent from './WinBatchInSelect.vue'    
import type { BatchInSelectOptions } from './types'

async function show(options: BatchInSelectOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '批次匹配',
        width: options.width || '80%',
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinBatchInSelectComponent,
        ...options
    })
    return result
}

export const WinBatchInSelect = {
    show
} 

export type { BatchInSelectOptions }

