import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinOutHistoryInfBoxComponent from './WinOutHistoryInfBox.vue'  
import type { OutHistoryInfBoxOptions } from './types'

async function show(options: OutHistoryInfBoxOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '付款历史',
        width: options.width || 850,
        height: options.height || 400,
        position: options.position || 'center',
        content: WinOutHistoryInfBoxComponent,
        ...options
    })
    return result
}

export const WinOutHistoryInfBox = {
    show
}

export type { OutHistoryInfBoxOptions }
