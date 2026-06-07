import { WinModal, type ModalResultValue } from '@v4x/ui'
import WinPackDetailComponent from './WinPackDetail.vue'
import type { PackDetailOptions } from './types'

async function show(options: PackDetailOptions): Promise<ModalResultValue> {
    const result = await WinModal.open({
        title: options.title || '打包明细',
        width: options.width || '70%',
        height: options.height || '80%',
        position: options.position || 'center',
        content: WinPackDetailComponent,
        ...options
    })
    return result
}

export const WinPackDetail = {
    show
}

export type { PackDetailOptions }
