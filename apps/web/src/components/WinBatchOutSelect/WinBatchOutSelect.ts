import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinBatchOutSelectComponent from './WinBatchOutSelect.vue'    
import type { BatchOutSelectOptions } from './types'

async function show(options: BatchOutSelectOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '批次匹配',
        width: options.width || '80%',
        height: options.height || '80%',
        position: options.position || 'right',
        content: WinBatchOutSelectComponent,
        ...options
    })
    return result
}

export const WinBatchOutSelect = {
    show
} 

export type { BatchOutSelectOptions }

