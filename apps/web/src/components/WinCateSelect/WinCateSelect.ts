import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinCateSelectComponent from './WinCateSelect.vue'  
import type { CateSelectOptions } from './types'

async function show(options: CateSelectOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '加价批量设置',
        width: options.width || 580,
        height: options.height || 350,
        position: options.position || 'center',
        content: WinCateSelectComponent,
        ...options
    })
    return result
}

export const WinCateSelect = {
    show
}

export type { CateSelectOptions }
