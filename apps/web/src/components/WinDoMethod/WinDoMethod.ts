import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinDoMethodComponent from './WinDoMethod.vue'  
import type { WinDoMethodOptions } from './types'

async function show(options: WinDoMethodOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '选择',
        width: options.width || '200px',
        height: options.height || '300px',
        position: options.position || 'center',
        content: WinDoMethodComponent,
        ...options
    })
    return result
}

export const WinDoMethod = {
    show
}

export type { WinDoMethodOptions }
