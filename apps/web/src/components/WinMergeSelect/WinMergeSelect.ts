import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinMergeSelectComponent from './WinMergeSelect.vue'  
import type { MergeSelectOptions } from './types'

async function show(options: MergeSelectOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '合并选择窗口',
        width: options.width || 450,
        height: options.height || 300,
        position: options.position || 'center',
        content: WinMergeSelectComponent,
        ...options
    })
    return result
}

export const WinMergeSelect = {
    show
}

export type { MergeSelectOptions }
