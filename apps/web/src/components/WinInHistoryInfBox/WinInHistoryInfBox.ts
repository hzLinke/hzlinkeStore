import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinInHistoryInfBoxComponent from './WinInHistoryInfBox.vue'  
import type { InHistoryInfBoxOptions } from './types'

async function show(options: InHistoryInfBoxOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '收款历史',
        width: options.width || 850,
        height: options.height || 400,
        position: options.position || 'center',
        content: WinInHistoryInfBoxComponent,
        ...options
    })
    return result
}

export const WinInHistoryInfBox = {
    show
}

export type { InHistoryInfBoxOptions }
